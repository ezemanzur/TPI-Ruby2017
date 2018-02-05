class Student < ApplicationRecord
  belongs_to :course
  has_many :grades,  dependent: :delete_all
  validates :dni , presence: true, uniqueness: {scope: :course , message:"No puede repetirse el estudiante dentro del curso"}
  validates :name, presence: true
  validates :lastname, presence: true
  validates :number, presence: true
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
