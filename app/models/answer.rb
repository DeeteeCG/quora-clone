class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

  validates :answer_content, presence: true, length: { minimum: 2, message: "Please write better answer*"}

# length: { minimum: 2 }

  belongs_to :user
  belongs_to :question


end
