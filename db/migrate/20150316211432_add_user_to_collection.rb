class AddUserToCollection < ActiveRecord::Migration
  def change
    add_reference :collections, :user, index: true
    add_foreign_key :collections, :users
  end
end
