class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
		t.belongs_to :user, index: true
		t.integer :goal_type, default: 0, null: false
		t.date :end_date
		t.float :value, default: 0
		t.float :initial_investment, default: 0
		t.float :periodic_investment, default: 0

    	t.timestamps null: false
    end
  end
end
