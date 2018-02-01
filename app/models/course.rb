class Course < ApplicationRecord
	has_many :students, dependent: :restrict_with_error
	has_many :evaluations, dependent: :restrict_with_error
	validates :year, numericality: { only_integer: true }, uniqueness: true
	validates :name, presence: true,
			  :length => { :minimum => 5 }
end

