class CreateAnswerVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :answer_votes do |t|
			t.integer :answer_id
			t.integer :vote
			t.integer :user_id
			t.timestamps
		end
	end
end
