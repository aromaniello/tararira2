module Seeder

	def self.create_admins!
		AdminUser.create!(email: "roma@invertir.la", password: "tararira", password_confirmation: "tararira")
		AdminUser.create!(email: "lucho@invertir.la", password: "tararira", password_confirmation: "tararira")
		AdminUser.create!(email: "juan@invertir.la", password: "tararira", password_confirmation: "tararira")
		AdminUser.create!(email: "admin@invertir.la", password: "tararira", password_confirmation: "tararira")
	end

	def self.create_users!
		email = "user1@invertir.la"
		u = User.create!(email: email, password: "tararira", password_confirmation: "tararira", uid: email, provider: "email")
		u.update!(first_name: "John", last_name: "Smith")
		u.update!(authorized: true)
		u.confirm
		u.investment_account.update!(risk_profile: 3, shares: 1, last_update: Time.now)

		email = "user2@invertir.la"
		u = User.create!(email: email, password: "tararira", password_confirmation: "tararira", uid: email, provider: "email")
		u.update!(first_name: "Jane", last_name: "Smith")
		u.update!(authorized: true)
		u.confirm
		u.investment_account.update!(risk_profile: 4, shares: 2, last_update: Time.now)

		# unauthorized but pending authorization
		email = "user3@invertir.la"
		u = User.create!(email: email, password: "tararira", password_confirmation: "tararira", uid: email, provider: "email")
		u.update!(first_name: "Mike", last_name: "Smith")
		u.update!(pending_authorization: true)
		u.confirm
		u.investment_account.update!(risk_profile: 4, shares: 2, last_update: Time.now)
	end

	def self.delete_portfolios_and_assets!
		Portfolio.destroy_all
		Asset.destroy_all
		PortfolioAssetRelationship.destroy_all
	end

	def self.create_portfolios_and_assets!

		######################
		### Risk Profile 1 ###
		######################

		p = Portfolio.create!(risk_profile: 1, name: "RJ Delta Ahorro", ticker: "RJDAHOA:AR", share_value: 3.651302, shares: 477476889)

		a = Asset.create!(name: "Lebac L21O5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 6.33)

		a = Asset.create!(name: "Lebac L25N5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0621)

		a = Asset.create!(name: "Lebac L04N5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0568)

		a = Asset.create!(name: "Lebac L28O5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0356)

		a = Asset.create!(name: "Lebac L20E6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0308)

		a = Asset.create!(name: "Bono CABA 2016 BD7C6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0297)

		a = Asset.create!(name: "Lebac L02D5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0291)

		a = Asset.create!(name: "ON YPF Serie 30", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0259)

		a = Asset.create!(name: "Lebac L23D5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0236)

		a = Asset.create!(name: "Letra Ciudad Bs As BCG16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0226)

		a = Asset.create!(name: "Lebac L18N5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0215)

		a = Asset.create!(name: "Letra Prov Bs As BB8D5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0198)

		a = Asset.create!(name: "Letra Ciudad Bs As LCD15", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0185)

		a = Asset.create!(name: "Letra Ciudad Bs As 140116", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0154)

		a = Asset.create!(name: "ON YPF Serie 32", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0135)

		a = Asset.create!(name: "Lebac L09D5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0132)

		a = Asset.create!(name: "Lebac L06E6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0129)

		a = Asset.create!(name: "Letra Prov Bs As BB9D5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0112)

		a = Asset.create!(name: "Bono de Consolidacion Septima Serie", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0109)

		a = Asset.create!(name: "Letra Ciudad Bs As LCN15", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0107)

		a = Asset.create!(name: "Lebac L03F6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0102)

		a = Asset.create!(name: "Lebac L14O5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0099)

		a = Asset.create!(name: "Letra Ciudad Bs As BCO15", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0097)

		a = Asset.create!(name: "ON Central T Loma L C2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0087)

		a = Asset.create!(name: "Letra Prov Bs As LB2N5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0081)

		a = Asset.create!(name: "VCP PEPASA S 11", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0080)

		a = Asset.create!(name: "Lebac L30D5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0078)

		a = Asset.create!(name: "ON Pan American Energy C2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0063)

		a = Asset.create!(name: "ON Bco Itau S 12", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0062)

		a = Asset.create!(name: "ON Bco Serv Fin S13", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0058)

		a = Asset.create!(name: "Bono Bonar 2016 AS16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0055)

		a = Asset.create!(name: "ON Cresud S9 Cl17", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0055)

		a = Asset.create!(name: "Lebac L11N5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0053)

		a = Asset.create!(name: "ON Tarj Naranja C28 S1", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0052)

		a = Asset.create!(name: "ON Cresud S8 Cl15", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0049)

		a = Asset.create!(name: "ON Bco Hipotecario S19", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0045)

		a = Asset.create!(name: "VCP PEPASA S 12", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0038)

		a = Asset.create!(name: "ON YPF Serie 37", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0037)

		a = Asset.create!(name: "ON Tarj Cuyanas C14 S2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0037)

		a = Asset.create!(name: "ON IRSA Prop. Comer C1", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0033)

		a = Asset.create!(name: "ON ICBC Clase 6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0029)

		a = Asset.create!(name: "ON Bco Ciudad C3", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0029)

		a = Asset.create!(name: "ON Bco Hipotecario S24", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0029)

		a = Asset.create!(name: "ON Medanito S5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0028)

		a = Asset.create!(name: "ON BBVA Frances Cl 14", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0028)

		a = Asset.create!(name: "ON Bco Serv Transac C7", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0028)

		a = Asset.create!(name: "ON YPF Serie 40", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0027)

		a = Asset.create!(name: "Lebac L13E6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0026)

		a = Asset.create!(name: "ON Tarj Shop Clase 15", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0023)

		a = Asset.create!(name: "ON Bco Saenz S5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0023)

		a = Asset.create!(name: "ON Central T Loma L C A", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0020)

		a = Asset.create!(name: "ON Carsa Serie 4", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0018)

		a = Asset.create!(name: "ON Bco Patagonia Cl 3", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "Bono Muni de Cordoba S2 BAE17", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Bco Comafi S 11", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Bco CMF Serie 4", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Inversora Juramento C2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Bco Comafi S 12", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Central T Loma L C C", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Cresud S11 Cl21", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Tarj Cuyanas C21", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "VCP CFN S 4", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Bco CMF Serie 6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Caterpillar Financ. C1", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Central Tca Guemes C5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Tarj Cuyanas C17", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0017)

		a = Asset.create!(name: "ON Disal Serie 1 Clase A", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0016)

		a = Asset.create!(name: "ON Tarj Naranja C25 S2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0015)

		a = Asset.create!(name: "ON Grimoldi S4", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0014)

		a = Asset.create!(name: "ON Petroqui C. Rivadavia2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0012)

		a = Asset.create!(name: "ON BACS Clase 6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0012)

		a = Asset.create!(name: "ON BBVA Frances Cl 16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0012)

		a = Asset.create!(name: "ON Bco Serv Transac C9", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0012)

		a = Asset.create!(name: "Letra Ciudad Bs As BCD15", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0009)

		a = Asset.create!(name: "ON Com. Financ Arg C11 S2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0009)

		a = Asset.create!(name: "ON Toyota Clase 13", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0008)

		a = Asset.create!(name: "ON Fiat Clase 8", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0006)

		a = Asset.create!(name: "ON Rombo Cia Fciera S25", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0006)

		a = Asset.create!(name: "ON Petroqui C. Rivadavia1", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0006)

		a = Asset.create!(name: "ON Bco Hipotecario S14", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0006)

		a = Asset.create!(name: "Letra Prov Entre R ER2D6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0006)

		a = Asset.create!(name: "ON Disal S2 Clase C", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0006)

		a = Asset.create!(name: "ON Savant Pharma S3 CG", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0004)

		a = Asset.create!(name: "ON TGLT Clase 5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0004)

		a = Asset.create!(name: "ON Impsa - Clase 8 Tasa Variable", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0003)

		a = Asset.create!(name: "Letra M. Rio Cuarto S 28", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0003)

		a = Asset.create!(name: "ON MSU S4 C2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0002)

		a = Asset.create!(name: "ON Cetelem Arg Clase 6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0001)



		a = Asset.create!(name: "Plazo Fijo Pesos Banco Santander Rio", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0719)

		a = Asset.create!(name: "Plazo Fijo Pesos Banco de la Nacion Argentina", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0444)

		a = Asset.create!(name: "Plazo Fijo Pesos Banco de Galicia", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0307)

		a = Asset.create!(name: "Plazo Fijo Pesos Banco de la Provincia de Bs As", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0224)

		a = Asset.create!(name: "Plazo Fijo Pesos Compania Financiera Argentina", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0112)

		a = Asset.create!(name: "Caucion Colocadora en Pesos Argentina", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0022)



		a = Asset.create!(name: "FCI Premier Renta CP $ CA", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0225)

		a = Asset.create!(name: "FCI Pionero Pesos", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0214)

		a = Asset.create!(name: "FCI Goal Pesos Clase B", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0115)

		a = Asset.create!(name: "FCI Fima Premium Clase B", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0099)

		a = Asset.create!(name: "FF Pvcred 23 A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0028)

		a = Asset.create!(name: "FF Vicentin Export. S2", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0021)

		a = Asset.create!(name: "FF Ribeiro S77 Clase A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0013)

		a = Asset.create!(name: "FF Vicentin Export. S4 B", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0012)

		a = Asset.create!(name: "FF Best Consumer S35 Cl A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0011)

		a = Asset.create!(name: "FF Centrocard 14 Clase A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0009)

		a = Asset.create!(name: "FF CMR Falabella S51 Cl A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0009)

		a = Asset.create!(name: "FF AGL S7 Senior", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0005)

		a = Asset.create!(name: "FF ICBC Personales 12 S A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0005)

		a = Asset.create!(name: "FF Ribeiro S79 Clase A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0004)

		a = Asset.create!(name: "FF Supervielle Cr 83", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0003)

		a = Asset.create!(name: "FF Ames S5 Clase A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0003)

		a = Asset.create!(name: "FF Tarj Elebar 13 Cl A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0002)

		a = Asset.create!(name: "FF Supervielle Cr 79", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0001)

		a = Asset.create!(name: "FF Credinamico 5 Clase A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0001)



		a = Asset.create!(name: "Fut Reg ARS", asset_type: :other, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0056)

		a = Asset.create!(name: "Fut Rofex DLR112015", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0056)

		######################
		### Risk Profile 2 ###
		######################

		p = Portfolio.create!(risk_profile: 2, name: "RJ Delta Moneda", ticker: "RJDGLOA:AR", share_value: 5.074606, shares: 311402631)

		a = Asset.create!(name: "Bono Bonac AY16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.191)

		a = Asset.create!(name: "Bono Bonac A2M6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1143)

		a = Asset.create!(name: "BONO DE LA NACION ARGENTINA VINCULADO AL DOLAR 1,75% VTO. 2016 (BONAD 1,75% 2016)", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.105)

		a = Asset.create!(name: "Bono Bonar 2016 AS16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0413)

		a = Asset.create!(name: "Bono Muni Cordoba BAO17", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0378)

		a = Asset.create!(name: "Bono Bonar 2017 AM17", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0337)

		a = Asset.create!(name: "ON YPF Serie 19", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0328)

		a = Asset.create!(name: "Letra Ciudad Bs As 140116", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0322)

		a = Asset.create!(name: "Bono Bonac AL16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0311)

		a = Asset.create!(name: "ON Petrolera Pampa C 5", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0304)

		a = Asset.create!(name: "Bono Prov Neuquen Garantizado Cl2 NDG21", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0285)

		a = Asset.create!(name: "Letra Prov Neuquen C1 S4", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0277)

		a = Asset.create!(name: "Bono Bonad 2017", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0227)

		a = Asset.create!(name: "Bono Bonar 2017 AO17", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0205)

		a = Asset.create!(name: "ON Molinos Rio Plata C7", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0180)

		a = Asset.create!(name: "ON Molinos Rio Plata C10", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0163)

		a = Asset.create!(name: "Titulos de cancelacion de deudas y financiamiento de obras Provincia de Neuquen S1 C1", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0126)

		a = Asset.create!(name: "Bono Prov Entre R. ERD16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0126)

		a = Asset.create!(name: "Bono Prov Entre R. ERG16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0117)

		a = Asset.create!(name: "Letra Prov Neuquen C2 S1", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0103)

		a = Asset.create!(name: "Letra Prov d Chubut BUN15", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0097)

		a = Asset.create!(name: "Bono Bonad 2018 AM18", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0091)

		a = Asset.create!(name: "ON TGLT Clase 4", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0068)

		a = Asset.create!(name: "ON Roch Clase 2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0066)

		a = Asset.create!(name: "Bono de Consolidacion Septima Serie", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0051)

		a = Asset.create!(name: "ON MSU S2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0049)

		a = Asset.create!(name: "Bono CABA 2016 BD4C6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0048)

		a = Asset.create!(name: "TITULOS DE DEUDA PUBLICA CABA CLASE N� 12 CON VENCIMIENTO EN 2016", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0045)

		a = Asset.create!(name: "ON YPF Serie 33", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0038)

		a = Asset.create!(name: "ON Central T Loma L C A", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0013)

		a = Asset.create!(name: "ON Cresud S7 Cl14", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.001)

		a = Asset.create!(name: "ON Savant Pharma S3 CG", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0005)

		a = Asset.create!(name: "Bono CABA 2016 BD2C6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0004)

		a = Asset.create!(name: "ON Impsa - Clase 9 Tasa Fija", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0001)



		a = Asset.create!(name: "Caucion Colocadora en Pesos Argentina", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0283)



		a = Asset.create!(name: "FCI Premier Renta CP $ CA", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0161)

		a = Asset.create!(name: "FCI Goal Pesos Clase B", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0127)

		a = Asset.create!(name: "FCI Pionero Pesos", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0117)

		a = Asset.create!(name: "FCI Fima Premium Clase B", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0105)

		a = Asset.create!(name: "FCI FST Pesos Clase B", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0070)

		a = Asset.create!(name: "FF Vicentin Export. S3 A", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0058)



		a = Asset.create!(name: "Fut Rofex DLR052016", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0926)

		a = Asset.create!(name: "Fut Rofex DLR032016", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0885)

		a = Asset.create!(name: "Fut Rofex DLR012016", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0836)

		a = Asset.create!(name: "Fut Rofex DLR300616", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0792)

		a = Asset.create!(name: "Fut Rofex DLR042016", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0302)

		a = Asset.create!(name: "Fut Rofex DLR022016", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0286)

		a = Asset.create!(name: "Fut Reg ARS", asset_type: :other, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: -0.3934)

		######################
		### Risk Profile 3 ###
		######################

		p = Portfolio.create!(risk_profile: 3, name: "RJ Delta Renta", ticker: "RJDRTAA:AR", share_value: 9.167753, shares: 16899916)

		a = Asset.create!(name: "Bono Bonac AY16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.2420)

		a = Asset.create!(name: "Bono Bonac A2M6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.2181)

		a = Asset.create!(name: "Bono Bonad 2018 AM18", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1274)

		a = Asset.create!(name: "BONO DE LA NACION ARGENTINA VINCULADO AL DOLAR 1,75% VTO. 2016 (BONAD 1,75% 2016)", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1147)

		a = Asset.create!(name: "Bono Bonac AL16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1055)

		a = Asset.create!(name: "Bono Prov Neuquen Garantizado Cl2 NDG21", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0372)

		a = Asset.create!(name: "ON Molinos Rio Plata C10", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0281)

		a = Asset.create!(name: "Bono Muni Cordoba BAO17", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0165)

		a = Asset.create!(name: "ON Central T Loma L C A", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0108)

		a = Asset.create!(name: "Bono Prov Salta 9,5 %", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0061)

		a = Asset.create!(name: "Bono de Consolidacion Septima Serie", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0029)

		a = Asset.create!(name: "ON Disal S2 Clase C", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0029)

		a = Asset.create!(name: "Bono CABA 2016 BDC16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0015)

		a = Asset.create!(name: "Bono Bonad 2017", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0009)



		a = Asset.create!(name: "BC Maxcom Telecom 2020", asset_type: :bond, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0033)



		a = Asset.create!(name: "FCI Pionero Pesos", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0461)

		a = Asset.create!(name: "FCI Goal Pesos Clase B", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0015)



		a = Asset.create!(name: "Fut Rofex DLR300616", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.2645)

		a = Asset.create!(name: "Fut Rofex DLR052016", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0645)

		a = Asset.create!(name: "Fut Reg ARS", asset_type: :other, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: -0.3269)

		######################
		### Risk Profile 4 ###
		######################

		p = Portfolio.create!(risk_profile: 4, name: "RJ Delta Multimercado I", ticker: "RJMULIA:AR", share_value: 4.695519, shares: 45299729)

		a = Asset.create!(name: "Bono Bonac AY16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1730)

		a = Asset.create!(name: "Bono Bonac AL16", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1007)

		a = Asset.create!(name: "Bono Bonac A2M6", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0941)

		a = Asset.create!(name: "BONO DE LA NACION ARGENTINA VINCULADO AL DOLAR 1,75% VTO. 2016 (BONAD 1,75% 2016)", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0782)

		a = Asset.create!(name: "Bono Bonad 2018 AM18", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0626)

		a = Asset.create!(name: "ON Roch Clase 2", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0235)

		a = Asset.create!(name: "ON Central T Loma L C A", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0092)

		a = Asset.create!(name: "Bono Prov Neuquen Garantizado Cl2 NDG21", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0087)

		a = Asset.create!(name: "Bono Muni Cordoba BAO17", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0078)

		a = Asset.create!(name: "Bono Prov Salta 9,5 %", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0052)

		a = Asset.create!(name: "ON Disal S2 Clase C", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0024)



		a = Asset.create!(name: "Pampa Energia S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1159)

		a = Asset.create!(name: "Grupo Financiero Galicia S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0696)

		a = Asset.create!(name: "Petrolera Pampa S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0640)

		a = Asset.create!(name: "YPF S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0556)

		a = Asset.create!(name: "TGLT SA", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0301)

		a = Asset.create!(name: "Banco Santander Rio S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0179)

		a = Asset.create!(name: "Siderar S.A.I.C.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0172)

		a = Asset.create!(name: "Inversiones y Representaciones S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0121)

		a = Asset.create!(name: "Nortel Inversora S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0116)

		a = Asset.create!(name: "Banco Macro S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0097)

		a = Asset.create!(name: "Grimoldi S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0049)

		a = Asset.create!(name: "San Miguel S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0036)

		a = Asset.create!(name: "Grupo Clarin S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0029)

		a = Asset.create!(name: "Ferrum S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0001)



		a = Asset.create!(name: "FCI Goal Pesos Clase B", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0003)

		a = Asset.create!(name: "FCI Pionero Pesos", asset_type: :trust, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0002)



		a = Asset.create!(name: "Fut Rofex DLR052016", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1651)

		a = Asset.create!(name: "Fut Rofex DLR300616", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1130)

		a = Asset.create!(name: "Fut Rofex DLR122015", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0971)

		a = Asset.create!(name: "Fut Rofex DLR042016", asset_type: :other, asset_subtype: :dollars)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0538)

		a = Asset.create!(name: "Fut Reg ARS", asset_type: :other, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: -0.4147)

		######################
		### Risk Profile 5 ###
		######################

		p = Portfolio.create!(risk_profile: 5, name: "RJ Delta Acciones", ticker: "RJDELTA:AR", share_value: 7.759158, shares: 23201819)

		a = Asset.create!(name: "ON Central T Loma L C A", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0121)

		a = Asset.create!(name: "ON Savant Pharma S3 CG", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0047)

		a = Asset.create!(name: "ON Disal S2 Clase C", asset_type: :bond, asset_subtype: :pesos)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0033)



		a = Asset.create!(name: "YPF S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1570)

		a = Asset.create!(name: "Grupo Financiero Galicia S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1511)

		a = Asset.create!(name: "Pampa Energia S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.1371)

		a = Asset.create!(name: "Siderar S.A.I.C.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0666)

		a = Asset.create!(name: "Banco Macro S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0570)

		a = Asset.create!(name: "Grupo Clarin S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0447)

		a = Asset.create!(name: "Petrolera Pampa S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0372)

		a = Asset.create!(name: "Banco Santander Rio S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0362)

		a = Asset.create!(name: "Sociedad Comercial del Plata S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0229)

		a = Asset.create!(name: "Central Puerto S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0227)

		a = Asset.create!(name: "San Miguel S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0218)

		a = Asset.create!(name: "Petrobras Argentina S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0213)

		a = Asset.create!(name: "Inversiones y Representaciones S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0189)

		a = Asset.create!(name: "Nortel Inversora S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0184)

		a = Asset.create!(name: "TGLT SA", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0176)

		a = Asset.create!(name: "Grimoldi S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0168)

		a = Asset.create!(name: "Aluar Aluminio Argentino S.A.I.C.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0159)

		a = Asset.create!(name: "BBVA Banco Frances S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0142)

		a = Asset.create!(name: "Cresud S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0103)

		a = Asset.create!(name: "Edenor S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0076)

		a = Asset.create!(name: "Transener S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0071)

		a = Asset.create!(name: "Caputo S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0032)

		a = Asset.create!(name: "Garovaglio y Zorraquin S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0025)

		a = Asset.create!(name: "Alto Palermo S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0024)

		a = Asset.create!(name: "Ferrum S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0010)

		a = Asset.create!(name: "Longvie S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0005)

		a = Asset.create!(name: "Dycasa S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0004)

		a = Asset.create!(name: "Molinos Rio de la Plata S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0002)

		a = Asset.create!(name: "Transportadora de Gas del Norte S.A.", asset_type: :stock, asset_subtype: :national)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0002)



		a = Asset.create!(name: "Tenaris S.A.", asset_type: :stock, asset_subtype: :international)
		r = p.portfolio_asset_relationships.create!(asset_id: a.id, weight: 0.0074)

	end

end