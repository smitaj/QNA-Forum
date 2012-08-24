class AddColumnRatingsToAnswers < ActiveRecord::Migration
  def up
    add_column  :answers, :rating,  :integer
  end

  def down
    remove_column  :answers, :rating
  end
end
