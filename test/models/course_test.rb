require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	setup do
		@course = courses(:one)
		@course2= courses(:curso_sin_evaluaciones)
	end
	test "No se puden crear 2 cursadas en un mismo año" do
		assert_difference("Course.count", 0) do
      		course= Course.create(name:@course.name + "aas",year:@course.year)
    	end
	end
	test "No se puede elminar un curso con evaluaciones" do
		assert_equal(Course.count,Course.count) do
			@course.destroy
    	end
	end
	test "Eliminar un curso sin evaluaciones" do
		assert_difference("Course.count", -1) do
			@course2.destroy
		end
	end
	test "No se puede guardar un curso con atributos nulos" do
		c=Course.new
		refute c.save
	end
	
end
