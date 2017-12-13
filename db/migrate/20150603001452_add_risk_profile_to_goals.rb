class AddRiskProfileToGoals < ActiveRecord::Migration
  def change
  	add_column :goals, :risk_profile, :integer, default: 3
  end
end
