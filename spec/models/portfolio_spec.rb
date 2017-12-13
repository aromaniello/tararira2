require 'rails_helper'

RSpec.describe Portfolio, type: :model do

	before do
		@portfolio = Portfolio.new(risk_profile: 3, share_value: 1_000, shares: 50, name: "Test Portfolio", ticker: "TPTPTP")
	end

	it "calculates aum correctly" do
		expect(@portfolio.aum).to eq(50_000)
	end

	it "returns the correct portfolio" do
		expect(Portfolio.current_for_risk_profile(3)).to eq(@portfolio)
	end
end
