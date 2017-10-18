class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

  validates :question_content, presence: true, length: { minimum: 6, message: "Please write better question*"}


  belongs_to :user

  has_many :answers
  has_many :question_votes

end
