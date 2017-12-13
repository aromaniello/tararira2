class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
		t.belongs_to :investment_account, index: true
		t.string :old_value, null: false
		t.string :new_value, null: false
		t.integer :action_type, null: false

    	t.timestamps null: false
    end
  end
end
