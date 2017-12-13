class BankAccount < ActiveRecord::Base
	enum account_type: [:checking, :savings, :unique, :sight]
	
	belongs_to :bank_account_like, polymorphic: true
end
