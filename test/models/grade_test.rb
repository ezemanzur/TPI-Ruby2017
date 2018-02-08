require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  setup do
		@student = students(:one)
		@evaluation= evaluations(:one)
	end
	test "Debe haber una nota por estudiante en cada evaluación" do
		assert_difference("Grade.count", 0) do
      		 Grade.create(student:@student,evaluation:@evaluation)
      	end
	end
end
