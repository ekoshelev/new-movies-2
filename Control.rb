#Elizabeth Koshelev
#PA Movies Part 2
#COSI 166B
#Pito Salas

require_relative "Validator.rb"
require_relative "Ratings.rb"

class Control

    Validator.new("u1.base","u1.test").validate
    Validator.new("u2.base","u2.test").validate
    Validator.new("u3.base","u3.test").validate
    Validator.new("u4.base","u4.test").validate
    Validator.new("u5.base","u5.test").validate


end
