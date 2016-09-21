require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/student" # require the Student class definition that we defined in the models/student.rb file
require_relative "models/instructor"

# This will put us into a state of the pry REPL, in which we've established a connection
# with the wdi database and have defined the Student Class as an
# ActiveRecord::Base class.

ActiveRecord::Base.logger = Logger.new(STDOUT)

Student.destroy_all
Instructor.destroy_all
jesse = Instructor.create(first_name: "Jesse", last_name: "Shawl", age: 26)
adrian = Instructor.create(first_name: "Adrian", last_name: "Maseda", age: 28)

tom = Student.create(first_name: "Tom", last_name: "Jefferson", age: 67, job: "Doctor", instructor: adrian)
jack = Student.create(first_name: "Jack", last_name: "Adams", age: 67, job: "Lawyer", instructor: jesse)
andy = Student.create(first_name: "Andy", last_name: "Jackson", age: 55, job: "Banker", instructor: jesse)
ted = Student.create(first_name: "Ted", last_name: "Roosevelt", age: 55, job: "Hunter", instructor: adrian)

Instructor.all.each do |instructor|
  puts instructor
end

Student.all.each do |student|
  puts student
end

binding.pry

puts "end of application"
