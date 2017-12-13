desc "This task is called by the Heroku scheduler add-on"
task :daily_update => :environment do
	Portfolio.daily_update
	InvestmentAccount.daily_update
end
