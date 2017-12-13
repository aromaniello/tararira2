class PortfolioHistorySerializer < ActiveModel::Serializer
	attributes :id, :risk_profile, :shares, :share_value, :created_at, :diff
end
