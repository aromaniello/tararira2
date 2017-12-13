require 'rails_helper'

RSpec.describe InvestmentAccount, type: :model do

	before do
		@user = User.create(Factory.attributes_for(:user))
		@inv_acc = @user.investment_account.update(risk_profile: 3, shares: 1, last_update: Time.now)
		@portfolio = Portfolio.current_for_risk_profile(3)
	end

	it "returns the current portfolio" do
		expect(@inv_acc.current_portfolio).to eq(@portfolio)
	end

	describe "account value" do
		it "calculates the account value correclty" do
			pending
		end
	end

	describe "share value" do
		it "returns a share value of zero if there is no risk profile" do
			@inv_acc.update!(risk_profile: nil)
			expect(@inv_acc.share_value).to eq(0)
		end

		it "returns the current portfolio's share value" do
			expect(@inv_acc.share_value).to eq(@portfolio.share_value)
		end
	end

	describe "risk profiles" do
		it "returns the correct valid risk profiles" do
			expect(InvestmentAccount.valid_risk_profiles).to eq([1,2,3,4,5])
		end

		it "checks whether a risk profile is valid" do
			expect(InvestmentAccount.valid_risk_profile?(3)).to be_true
			expect(InvestmentAccount.valid_risk_profile?(7)).to be_false
		end
	end

	it "calculates last variation correctly" do
		pending
	end
end
