class Evaluation < ApplicationRecord
  default_scope {order('date ASC')}
  belongs_to :course
  has_many :grades, inverse_of: :evaluation, dependent: :restrict_with_error 
  accepts_nested_attributes_for :grades
  validates :min_grade , presence: true,  numericality: { greater_than: 0}
  validates :title , presence: true, uniqueness: {scope: :course , message:"La evaliacion debe ser única por curso"}
  validates :date, presence: true

	def approved_students
		 self.grades.where("grade >= #{min_grade}" ).count
	end
	def disapproved_students
		self.grades.count - self.approved_students - self.absent_sudents
	end
	def absent_sudents
		self.grades.where("grade is NULL" ).count
	end
	def percentage_of_approved
		((self.approved_students / (grades.count - self.absent_sudents).to_f) * 100).to_f.round(2)
	end
	def result student
		self.grades.where("student_id = #{student.id}" ).first.grade
	end
	def approved student
		if result(student).nil?
			false
		else
			(self.result(student)>= self.min_grade)? true : false
		end	 	 
	end
end
