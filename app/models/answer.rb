class Answer < ActiveRecord::Base

  ##Associations============================================================
  belongs_to  :question

  ##Field Validations
  #validates :answer,  :presence => true
end
