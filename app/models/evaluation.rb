class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :grades, inverse_of: :evaluation
  accepts_nested_attributes_for :grades
  validates :min_grade ,  numericality: { greater_than: 0}
  validates :name , uniqueness: {scope: :course , message:"La evaliacion debe ser única por curso"}

end
