class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :evaluation, inverse_of: :grades 
  validates :student , uniqueness: {scope: :evaluation, message:"Debe haber un estudiante por evaluación"}

end
