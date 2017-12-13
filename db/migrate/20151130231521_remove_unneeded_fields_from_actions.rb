class RemoveUnneededFieldsFromActions < ActiveRecord::Migration
    def change
        remove_column :actions, :processed, :boolean, default: false
        remove_column :actions, :processed_at, :datetime
        remove_column :actions, :requested_at, :datetime
    end
end
