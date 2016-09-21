class Student < ActiveRecord::Base
  belongs_to :instructor

  def to_s
    "#{id}: #{first_name} #{last_name} is #{age} years old and has job #{job} and has instructor #{instructor.full_name}."
  end
end
