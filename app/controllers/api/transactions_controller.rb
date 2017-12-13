module API
	class TransactionsController < APIController
		before_action :authenticate_user!

		def create
			transaction = current_user.investment_account.transactions.build(transaction_params.except(:proof, :amount))

			transaction.amount = params[:amount].to_d unless transaction.is_deposit? # prevent client from setting an amount for deposits
			
			if transaction_params[:proof]
				image = Paperclip.io_adapters.for(params[:proof])
				extension = image.content_type.split('/').last
				image.original_filename = "proof_#{Time.now.to_i}.#{extension}"
				transaction.proof = image
			end
			
			if transaction.save
				render json: transaction, root: false, status: 201, location: api_transaction_url(transaction)
			else
				render json: transaction.errors, root: false, status: 422
			end
		end

		def show
			transaction = current_user.investment_account.transactions.find(params[:id])
			if transaction
				render json: transaction, root: false, status: 200
			else
				head 404
			end
		end

		def index
			transactions = current_user.investment_account.transactions
			render json: transactions, root: false, status: 200
		end

		def update
			transaction = current_user.investment_account.transactions.find(params[:id])
			
			head 404 unless transaction
			
			if transaction.update(transaction_params)
				render json: transaction, root: false, status: 200
			else
				render json: transaction.errors, root: false, status: 422
			end
		end

		def destroy
			transaction = current_user.investment_account.transactions.find(params[:id])
			
			if transaction
				transaction.destroy
				head 204
			else
				head 404
			end
		end

		private
			def transaction_params
				params.permit(:transaction_type, :amount, :proof)
			end
	end
end
