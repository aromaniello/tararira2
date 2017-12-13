class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
		t.integer :asset_type, default: 0
		t.string :name
		t.float :current_value, default: 0

    	t.timestamps null: false
    end
  end
end
