class AddCollaboratorToCollection < ActiveRecord::Migration
  def change
    add_reference :collections, :collaborator, index: true
    add_foreign_key :collections, :collaborators
  end
end
