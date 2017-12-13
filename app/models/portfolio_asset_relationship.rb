class PortfolioAssetRelationship < ActiveRecord::Base
	belongs_to :portfolio
	belongs_to :asset
end
