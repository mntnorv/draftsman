class AddObjectChangesColumnToDrafts < ActiveRecord::Migration
  def self.up
    add_column :drafts, :object_changes, :hstore
  end

  def self.down
    remove_column :drafts, :object_changes
  end
end
