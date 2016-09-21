class Instructor < ActiveRecord::Base
  has_many :students

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    "#{id}: #{first_name} #{last_name} is #{age} years old and has #{students.length} students."
  end
end
