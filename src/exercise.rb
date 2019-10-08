##
# Class to store the single exercises to be performed
# by the students.
class Exercise
  attr_accessor :title, :purpose, :task, :input_message, :solution, :check, :setup, :teardown

  ##
  # Create a new instance.
  #
  # @param title String the title of the exercise
  # @param purpose String what should the student now beforehand
  # @param task String the actual task to be performed
  # @param input_message String|symbol what to display as input prompt. If set to
  #        symbol :enter the standard Message from ENTER_TEXT ist printed
  # @param solution String the correct command
  # @param check Proc check for the exercise, returns +true+ or +false+
  # @param setup Proc preparation of the exercise. Ignored if nil
  # @param teardown Proc cleanup after the exercise
  def initialize(title, purpose, task, input_message, solution, check, setup = nil, teardown = nil)
    @title = title
    @purpose = purpose
    @task = task
    @input_message = input_message
    @solution = solution
    @check = check
    @setup = setup
    @teardown = teardown
  end

  ##
  # Execute this exercise
  def execute

    @setup.call if @setup
    puts "#{red(@title)}\n\n"
    puts "#{yellow(@purpose)}\n\n"

    # allow free formatting of the text in the input, Remove
    # leading blanks
    task_text = @task.strip.split("\n").map(&:strip)

    # ensure that on the terminal no newline appears in the middle of
    # a word
    task_text.map! { |line| fit(line, LINE_WIDTH) }

    # highlight keywords
    task_text.map! { |line| highlight(line) }

    # print the text
    puts %Q{#{task_text.join("\n")}\n\n}

    begin
      if @input_message == :enter
        # standard text asking for <ENTER>
        print "#{bold(ENTER_TEXT)} "
        $stdin.gets
      else
        # user defined message
        print "#{bold(@input_message)} "
      end

      # determine OS. Currently supported :linux and :macos
      os = if RUBY_PLATFORM =~ /linux/
             :linux
          elsif RUBY_PLATFORM =~ /darwin/
             :macos
          else
             nil
          end

      # Call the check. Lambdas enforce arity, therefore
      # we check it before calling the Proc/Lambda to avoid
      # crashes
      passed = if @check.arity == 1
                 @check.call(os)
               else
                 @check.call
               end

      if (!passed)
        puts red("\n#{WRONG_SOLUTION}\n")
      end

    end while !passed

    puts green("\n#{CORRECT_SOLUTION}\n")
  end
end
