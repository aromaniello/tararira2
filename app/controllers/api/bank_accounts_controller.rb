module API
	class BankAccountsController < APIController
		before_action :authenticate_user!
		before_action :check_pin!

		def create
			bank_account = current_user.bank_accounts.build(bank_account_params)
			
			if bank_account.save
				render json: bank_account, root: false, status: 201, location: api_bank_account_url(bank_account)
			else
				render json: bank_account.errors, root: false, status: 422
			end
		end

		def show
			bank_account = current_user.bank_accounts.find(params[:id])
			
			if bank_account
				render json: bank_account, root: false, status: 200
			else
				head 404
			end
		end
		
		def show_active
			bank_account = current_user.bank_accounts.where(active: true).order("created_at DESC").first
			
			if bank_account
				render json: bank_account, root: false, status: 200
			else
				head 404
			end
		end

		def index
			bank_accounts = current_user.bank_accounts
			render json: bank_accounts, root: false, status: 200
		end

		def update
			bank_account = current_user.bank_accounts.find(params[:id])
			
			head 404 unless bank_account
			
			bank_account_history = BankAccountHistory.new(bank_name: bank_account.bank_name, account_type: bank_account.account_type, account_number: bank_name.account_number, account_cbu: bank_account.account_cbu)
			
			if bank_account.update(bank_account_params)
				bank_account_history.save
				render json: bank_account, root: false, status: 200
			else
				render json: bank_account.errors, root: false, status: 422
			end
		end
		
		def update_active
			bank_account = current_user.bank_accounts.where(active: true).order("created_at DESC").first
			
			head 404 unless bank_account
			
			bank_account_history = BankAccountHistory.new(bank_name: bank_account.bank_name, account_type: bank_account.account_type, account_number: bank_name.account_number, account_cbu: bank_account.account_cbu)
			
			if bank_account.update(bank_account_params)
				bank_account_history.save
				render json: bank_account, root: false, status: 200
			else
				render json: bank_account.errors, root: false, status: 422
			end
		end

		def destroy
			bank_account = current_user.bank_accounts.find(params[:id])
			
			if bank_account
				BankAccountHistory.create(bank_name: bank_account.bank_name, account_type: bank_account.account_type, account_number: bank_name.account_number, account_cbu: bank_account.account_cbu)
				bank_account.destroy
				head 204
			else
				head 404
			end
		end

		private
			def bank_account_params
				params.permit(:bank_name, :account_type, :account_number, :account_cbu, :active)
			end
	end
end
