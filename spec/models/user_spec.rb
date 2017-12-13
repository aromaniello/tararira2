require 'rails_helper'

RSpec.describe User, type: :model do

	before do
		@user = User.create(email: "john@smith.com", first_name: "John", last_name: "Smith", password: "tararira", password_confirmation: "tararira")
	end

	it "automatically creates an investment account after being saved" do
		expect(@user.investment_account).to_not be_nil
	end

	it "should return the user's full name" do
		expect(@user.full_name).to eq("John Smith")
	end	

	it "should correctly check the user's PIN" do
		expect(@user.set_pin("1234")).to be true
		expect(@user.check_pin("1234")).to be true
	end
	
	it "should correctly be set as authorized" do
		expect(@user.authorize).to be true
		expect(@user.authorized?).to be true
	end
end
