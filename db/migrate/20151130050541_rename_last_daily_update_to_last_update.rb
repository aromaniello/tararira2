class RenameLastDailyUpdateToLastUpdate < ActiveRecord::Migration
    def change
        rename_column :investment_accounts, :last_daily_update, :last_update
        rename_column :portfolios, :last_daily_update, :last_update
    end
end
