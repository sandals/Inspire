class AddCollectionToCollaborator < ActiveRecord::Migration
  def change
    add_reference :collaborators, :collection, index: true
    add_foreign_key :collaborators, :collections
  end
end
