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
    puts %Q{#{@task.strip.split("\n").map(&:strip).join("\n")}\n\n}

    begin
      if @input_message == :enter
        print "#{bold(ENTER_TEXT)} "
        $stdin.gets
      else
        print "#{bold(@input_message)} "
      end

      passed = @check.call

      if (!passed)
        puts red("\nLeider falsch. Probieren Sie es noch einmal.\n")
      end
    end while !passed

    puts green("\nKorrekt. Gut gemacht!\n")
  end
end
