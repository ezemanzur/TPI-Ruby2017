class Student < ApplicationRecord
  belongs_to :course
  has_many :grades,  dependent: :delete_all
  validates :dni , uniqueness: {scope: :course , message:"No puede repetirse el estudiante dentro del curso"}
  after_create :cargar_notas
  
  def cargar_notas
  	self.course.evaluations.each do |evaluation|
          grade=Grade.new()
          grade.student_id= self.id
          grade.evaluation=evaluation 
          grade.save
      end
  end
end
