module API
	class StaticDataController < APIController

		def cities
			head 400 if params[:country].nil?
			country = params[:country].upcase
			available_countries = ["AR"]
			@@data = File.read("public/cities_#{country}.json")
			if available_countries.include? country
				render json: @@data
			else
				head 404
			end
		end
		
		def banks
			head 400 if params[:country].nil?
			country = params[:country].upcase
			available_countries = ["AR"]
			@@data = File.read("public/banks_#{country}.json")
			if available_countries.include? country
				render json: @@data
			else
				head 404
			end
		end

	end
end