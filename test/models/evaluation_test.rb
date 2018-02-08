require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  	setup do
    	@course = courses(:one)
    	@evaluation = evaluations(:one)
    	@evaluation2 = evaluations(:eva2)
    	@student= students(:one)
    	@grade= grades(:one)
    	@g2= grades(:two)
    	@g3= grades(:three)
    	@g4= grades(:four)
  	end

  	test "No se pueden eliminar evaluaciones con notas" do
  		assert_equal(Evaluation.count,Evaluation.count) do
			@evaluation.destroy
    	end
  	end
  	test "No se pueden crear evaluaciones con el mismo nombre en el mismo curso" do
  		assert_equal(Evaluation.count, Evaluation.count) do
			e2=Evaluation.create(name: @evaluation.name,date: 5.year.from_now,min_grade: 9,course: @evaluation.course)
		end
  	end
  
	test "No se puede guardar una evaluación con atributos nulos" do
		e=Evaluation.new
		e.course=@course
		refute e.save
	end
	test "Alumno aprobado" do
		@grade.grade= @evaluation.min_grade
		@grade.save 
		assert @evaluation.approved(@student)
	end
	test "Alumno desaprobado" do
		@grade.grade= @evaluation.min_grade - 1
		@grade.save
		refute @evaluation.approved(@student)
	end
	test "Alumno Ausente" do
		@grade.update grade: nil
		assert_nil @evaluation.result(@student)
	end
	test "Cantidad de alumnos aprobados" do
		@grade.update grade: @evaluation.min_grade - 1
		@g2.update grade: @evaluation.min_grade + 1
		@g3.update grade: @evaluation.min_grade + 1
		@g4.update grade: nil
		assert_equal @evaluation.approved_students, 2
	end
	test "Cantidad de alumnos desaprobados" do
		@grade.update grade: @evaluation.min_grade - 1
		@g2.update grade: @evaluation.min_grade + 1
		@g3.update grade: @evaluation.min_grade + 1
		@g4.update grade: nil
		assert_equal @evaluation.disapproved_students, 1
	end
	test "Cantidad de alumnos ausentes" do
		@grade.update grade: @evaluation.min_grade - 1
		@g2.update grade: @evaluation.min_grade + 1
		@g3.update grade: nil
		@g4.update grade: nil
		assert_equal @evaluation.absent_sudents, 2
	end
	test "Porcentaje de almunos aprobados" do
		@grade.update grade: @evaluation.min_grade - 1
		@g2.update grade: @evaluation.min_grade + 1
		@g3.update grade: @evaluation.min_grade 
		@g4.update grade: nil
		assert_equal @evaluation.percentage_of_approved, 66.67
	end
end
