require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @course = courses(:one)
    @evaluation = evaluations(:one)
    @student = students(:one)
    @grade = grades(:one)
  end

   
 test "should update grade" do
    patch course_evaluation_grade_path(@course,@evaluation,@grade), params: { grade: { evaluation_id: @grade.evaluation_id, grade: @grade.grade, student_id: @grade.student_id } }
    assert_redirected_to course_evaluation_grade_path(@course,@evaluation)
  end
end
