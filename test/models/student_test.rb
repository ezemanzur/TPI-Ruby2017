require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  setup do
		@student = students(:one)
		@course = courses(:one)
		@course2= courses(:curso_sin_evaluaciones)
		@grade= grades(:one)
	end
	test "No se puden crear 2 alumnos en un mismo dni dentro de un mismo curso" do
		assert_difference("Student.count", 0) do
      		student= Student.create(name:"ezequiel",lastname:"manzur",course:@course,dni:@student.dni,number:13486/8)
    	end
	end
	test "Se puede crear alumno con el mismo dni en distintos cursos" do
		assert_equal(Student.count,Student.count) do
      		student= Student.create(name:"ezequiel",lastname:"manzur",course:@course2,dni:@student.dni,number:13486/8)
    	end
	end
	test "Se deben eliminar las notas de un estudiante al elminar el estudiante" do
		cant_grades=Grade.count
		@student.destroy
		assert cant_grades > Grade.count
	end
	
	
end
