class AddUserToCard < ActiveRecord::Migration
  def change
    add_reference :cards, :user, index: true
    add_foreign_key :cards, :users
  end
end
