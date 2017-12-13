class PortfolioSerializer < ActiveModel::Serializer
	attributes :id, :name, :risk_profile, :share_value, :shares, :categories
	
	has_many :assets
	
	def assets
		a = Array.new
		object.portfolio_asset_relationships.each do |rel|
			h = Hash.new
			h[:weight] = rel.weight
			h[:name] = rel.asset.name
			h[:asset_type] = rel.asset.asset_type
			h[:asset_subtype] = rel.asset.asset_subtype
			a << h
		end
		return a
	end
	
	def categories
		h = {
			stock_national: 0,
			stock_international: 0,
			bond_pesos: 0,
			bond_dollars: 0,
			trust: 0,
			other: 0
		}
	
		object.portfolio_asset_relationships.each do |rel|
			if rel.asset.asset_type == "stock" && rel.asset.asset_subtype == "national"
				h[:stock_national] += rel.weight
			elsif rel.asset.asset_type == "stock" && rel.asset.asset_subtype == "international"
				h[:stock_international] += rel.weight
			elsif rel.asset.asset_type == "bond" && rel.asset.asset_subtype == "pesos"
				h[:bond_pesos] += rel.weight
			elsif rel.asset.asset_type == "bond" && rel.asset.asset_subtype == "dollars"
				h[:bond_dollars] += rel.weight
			elsif rel.asset.asset_type == "trust"
				h[:trust] += rel.weight
			elsif rel.asset.asset_type == "other"
				h[:other] += rel.weight
			else
				raise "unknown asset type or subtype error: #{rel.asset.asset_type}"
			end
		end
	
		return h
	end

end
