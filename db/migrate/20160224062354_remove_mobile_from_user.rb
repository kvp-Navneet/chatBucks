class RemoveMobileFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :mobile, :integer
  end
end
