def input_students
  puts "Please enter the names of the students and cohort"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Enter name"
  name = gets.chomp
  if name.empty?
    puts "no value entered for name"
  end

  puts "Enter cohort"
  cohort = gets.chomp
  if cohort.empty?
    puts "no value entered for cohort"
  end
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user

    puts "Enter name"
    name = gets.chomp
    if name.empty?
      puts "no value entered for name"
    end

    puts "Enter cohort"
    cohort = gets.chomp
    if cohort.empty?
      puts "no value entered for cohort"
    end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(30)
  puts "-------------".center(30)
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1} #{student[:name]} #{student[:cohort]}".center(30)
  end
end

def print_footer(students)
  if students.count < 2
    puts "Overall, we have #{students.count} great student".center(30)
  else
    puts "Overall, we have #{students.count} great students".center(30)
  end
end
#nothing happens until we call the method
students = input_students
print_header
print(students)
print_footer(students)
