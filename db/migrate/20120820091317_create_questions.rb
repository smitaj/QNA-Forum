class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.text :question
      t.string  :title
      t.timestamps
    end
  end
end
