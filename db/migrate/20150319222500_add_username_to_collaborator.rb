class AddUsernameToCollaborator < ActiveRecord::Migration
  def change
    add_column :collaborators, :username, :string
  end
end
