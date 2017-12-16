class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :grades
  accepts_nested_attributes_for :grades
end
