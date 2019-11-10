@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.strip)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
     puts "Show student successful"
  when "3"

     puts "Saved student successful"
     save_student
  when "4"
    load_students
     puts "Loading student successful"
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  puts "Enter name"
  name = STDIN.gets.strip
  if name.empty?
    puts "No value recorder for name"
  end

  puts "Enter cohort"
  cohort = STDIN.gets.strip
  if cohort.empty?
    puts "No value recorded for cohort"
  end

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user

    puts "Enter name"
    name = STDIN.gets.strip
    if name.empty?
      puts "No value recorded"
    end

    puts "Enter cohort"
    cohort = STDIN.gets.strip
    if cohort.empty?
      puts "No value recorded"
    end
  end
  @students
end

def show_students
  print_header
  print_student_list
  print_footer
end


def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.strip.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}".center(30)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist.".center(30)
    exit # quit the program
  end
end

def print_header
  puts "The students of Villains Academy".center(30)
  puts "-------------".center(30)
end

def print_student_list
  @students.each_with_index { |student, index|
    puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)" }
  end

  def print_footer
    if @students.count == 1
      puts "Overall, we have #{@students.count} great student".center(30)
    else
      puts "Overall, we have #{@students.count} great students".center(30)
    end
  end

  try_load_students
  interactive_menu
