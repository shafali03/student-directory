def input_students
  puts "Please enter the names of the students, cohort, hobbies, and country of birth"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Enter name"
  name = gets.chomp
  puts "Enter cohort"
  cohort = gets.chomp
  puts "Enter hobbies"
  hobbies = gets.chomp
  puts "Enter country of birth"
  country_of_birth = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter name"
    name = gets.chomp
    puts "Enter cohort"
    cohort = gets.chomp
    puts "Enter hobbies"
    hobbies = gets.chomp
    puts "Enter country of birth"
    country_of_birth = gets.chomp
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
    puts "#{index + 1} #{student[:name]} #{student[:cohort]} #{student[:hobbies]} #{student[:country_of_birth]}".center(30)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(30)
end

#nothing happens until we call the method
students = input_students
print_header
print(students)
print_footer(students)
