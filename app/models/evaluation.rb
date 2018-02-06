class Evaluation < ApplicationRecord
  default_scope {order('date ASC')}
  belongs_to :course
  has_many :grades, inverse_of: :evaluation, dependent: :restrict_with_error
  accepts_nested_attributes_for :grades
  validates :min_grade , presence: true,  numericality: { greater_than: 0}
  validates :title , presence: true, uniqueness: {scope: :course , message:"La evaliacion debe ser única por curso"}
  validates :date, presence: true

	def approved_students
		self.grades.select{|g| g.grade.to_f >= self.min_grade}.count
	end
	def disapproved_students
		self.grades.count - self.approved_students - self.absent_sudents
	end
	def absent_sudents
		self.grades.select{|g| g.grade.nil?}.count
	end
	def percentage_of_approved
		((self.approved_students / (grades.count - self.absent_sudents).to_f) * 100).to_f.round(2)
	end
	def result student
		self.grades.detect{|g| g.student==student}.grade
	end
	def approved student
		if result(student).nil?
			false
		else
			(self.result(student)>= self.min_grade)? true : false
		end	 	 
	end
end
