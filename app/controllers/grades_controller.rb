class GradesController < ApplicationController
  before_action :set_evaluation
  before_action :set_students
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  # GET /grades
  # GET /grades.json
 
  # GET /grades/1
  # GET /grades/1.json
  
  # GET /grades/new

  # GET /grades/1/edit
 
  # POST /grades
  # POST /grades.json
 

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to course_evaluation_grade_url(@evaluation.course,@evaluation,@grade), notice: 'La nota ha sido actualizada con éxito.' }
        format.json { render :show, status: :ok, location: [@evaluation.course,@evaluation,@grade]}
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end
    def set_evaluation
      @evaluation = Evaluation.find(params[:evaluation_id])
    end
    def set_students
      @students = @evaluation.course.students
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:grade, :student_id, :evaluation_id)
    end
end
