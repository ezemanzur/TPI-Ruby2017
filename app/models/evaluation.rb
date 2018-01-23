class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :grades, inverse_of: :evaluation
  accepts_nested_attributes_for :grades
end
