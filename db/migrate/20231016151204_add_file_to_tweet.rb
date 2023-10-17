class AddFileToTweet < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :file, :binary
  end
end
