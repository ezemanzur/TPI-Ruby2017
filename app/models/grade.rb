class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :evaluation, inverse_of: :grades 
  validates :student , uniqueness: {scope: :evaluation, message:"Debe haber una nota por estudiante en cada evaluación"}
  validates :grade, numericality: true, allow_nil: true
end
