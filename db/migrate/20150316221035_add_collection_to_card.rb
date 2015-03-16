class AddCollectionToCard < ActiveRecord::Migration
  def change
    add_reference :cards, :collection, index: true
    add_foreign_key :cards, :collections
  end
end
