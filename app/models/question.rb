class Question < ActiveRecord::Base

  ##Associations============================================================
  has_many  :answers

  # Field validations=======================================================
  validates :title, :presence => true
  validates :name, :presence => true
  validates :question, :presence => true
end
