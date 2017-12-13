class Asset < ActiveRecord::Base
	enum asset_type: [:bond, :stock, :trust, :other]
	enum asset_subtype: [:national, :international, :pesos, :dollars]

	has_many :portfolio_asset_relationships, dependent: :destroy
	has_many :portfolios, through: :portfolio_asset_relationships
end
