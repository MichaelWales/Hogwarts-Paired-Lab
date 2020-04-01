require("pry")
require_relative("../models/students")
require_relative("../models/houses")

Student.delete_all()
House.delete_all()

student1 = Student.new({"first_name" => "Harry", "last_name" => "Potter", "age" => 16, "house" => "Gryffindor"})
student1.save()

student2 = Student.new({"first_name" => "Ron", "last_name" => "Weasley", "age" => 15, "house" => "Gryffindor"})
student2.save()

student3 = Student.new({"first_name" => "Hermione", "last_name" => "Granger", "age" => 17, "house" => "Gryffindor"})
student3.save()

student4 = Student.new({"first_name" => "Luna", "last_name" => "Lovegood", "age" => 16, "house" => "Hufflepuff"})
student4.save()

student5 = Student.new({"first_name" => "Draco", "last_name" => "Malfoy", "age" => 16, "house" => "Slytherin"})
student5.save()

student6 = Student.new({"first_name" => "Cho", "last_name" => "Chang", "age" => 16, "house" => "Ravenclaw"})
student6.save()


house1 = House.new ({"name" => "Gryffindor"})
house1.save

house2 = House.new ({"name" => "Slytherin"})
house2.save

house3 = House.new ({"name" => "Hufflepuff"})
house3.save

house4 = House.new ({"name" => "Ravenclaw"})
house4.save


binding.pry
nil
