class AddSetGradeToEvaluations < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluations, :set_grade, :boolean, default: false
  end
end
