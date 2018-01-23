class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :evaluation, inverse_of: :grades 

end
