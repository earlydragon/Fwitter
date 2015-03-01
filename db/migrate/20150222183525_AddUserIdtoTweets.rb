class AddUserIdtoTweets < ActiveRecord::Migration
	def up
			remove_column :tweets, :user 
			add_column :tweets, :user_id, :integer
	end

	def down 
			remove_column :tweets, :user_id
			add_column :tweets, :user, :string
	end 
end
