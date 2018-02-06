require 'test_helper'

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @course = courses(:one)
    @evaluation = evaluations(:one)
    @evaluation2 = evaluations(:eva2)
  end

  test "should get index" do
    get course_evaluations_url(@course)
    assert_response :success
  end

  test "should get new" do
    get new_course_evaluation_url(@course)
    assert_response :success
  end

  test "should create evaluation" do
    assert_difference('Evaluation.count') do
      post course_evaluations_url(@course), params: { evaluation: { course_id: @evaluation.course_id, date: 5.year.from_now, min_grade: @evaluation.min_grade, title: @evaluation.title + "dojsdf" } }
    end

    assert_redirected_to course_evaluation_path(@course , Evaluation.last)
  end

  test "should show evaluation" do
    get course_evaluation_url(@course,@evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_evaluation_url(@course,@evaluation)
    assert_response :success
  end

  test "should update evaluation" do
    patch course_evaluation_url(@course,@evaluation), params: { evaluation: { course_id: @evaluation.course_id, date: @evaluation.date, min_grade: @evaluation.min_grade, title: @evaluation.title + "a" } }
    assert_redirected_to course_evaluation_url(@course,@evaluation)
  end

  test "should destroy evaluation" do
    assert_difference('Evaluation.count', -1) do
      delete course_evaluation_url(@course,@evaluation2)
    end

    assert_redirected_to course_evaluations_url(@course)
  end
end
