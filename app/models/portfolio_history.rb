class PortfolioHistory < ActiveRecord::Base

	def aum
		self.shares * self.share_value
	end

	def self.history_by_period(risk_profile)

		one_month = PortfolioHistory.where("risk_profile = ?", risk_profile).order("created_at DESC").limit(22).to_a

		base = one_month.last

		diffs = Array.new

		one_month.reverse.each do |e|
			diff = ((e.aum - base.aum) / base.aum).abs
			diffs << { id: e.id, risk_profile: e.risk_profile, shares: e.shares, share_value: e.share_value, created_at: e.created_at, diff: diff }
		end

		h = Hash.new
		h["one_month"] = diffs
		h["six_months"] = diffs
		h["one_year"] = diffs
		h["two_years"] = diffs
		return h
	end

	def self.history_by_period_old(risk_profile)
		h = Hash.new

		one_month = PortfolioHistory.where("risk_profile = ?", risk_profile).order("created_at DESC").limit(22).to_a

		one_month = one_month.map { |e| PortfolioHistorySerializer.new(e).serializable_hash }

		max = 22*6
		six_months_base = self.where("risk_profile = ?", risk_profile).order("created_at DESC").limit(max).to_a
		step = (max/20).round

		six_months = Array.new
		for i in (0..max).step(step)
			break if i >= six_months_base.length
			six_months.push six_months_base[i]
		end

		six_months = six_months.map { |e| PortfolioHistorySerializer.new(e).serializable_hash }

		max = 22*12
		one_year_base = self.where("risk_profile = ?", risk_profile).order("created_at DESC").limit(max).to_a
		step = (max/20).round

		one_year = Array.new
		for i in (0..max).step(step)
			break if i >= one_year_base.length
			one_year.push one_year_base[i]
		end

		one_year = one_year.map { |e| PortfolioHistorySerializer.new(e).serializable_hash }

		max = 22*24
		two_years_base = self.where("risk_profile = ?", risk_profile).order("created_at DESC").limit(max).to_a
		step = (max/20).round

		two_years = Array.new
		for i in (0..max).step(step)
			break if i >= two_years_base.length
			two_years.push two_years_base[i]
		end

		two_years = two_years.map { |e| PortfolioHistorySerializer.new(e).serializable_hash }

		h["one_month"] = one_month
		h["six_months"] = six_months
		h["one_year"] = one_year
		h["two_years"] = two_years
		return h
	end
end
