class Log < ActiveRecord::Base
	enum log_type: [:error, :warning, :success, :notice, :exception]

	def self.error(values = {})
		self.create_with_type(:error, values)
	end

	def self.success(values = {})
		self.create_with_type(:success, values)
	end

	def self.warning(values = {})
		self.create_with_type(:warning, values)
	end

	def self.create_with_type(new_log_type, values)
		raise "invalid log type" unless new_log_type.is_a?(Symbol) && [:error, :warning, :success, :notice, :exception].include?(new_log_type)
		
		log = self.new(log_type: new_log_type)
		log.description = values[:description] unless values[:description].nil?
		log.location = values[:location] unless values[:location].nil?
		log.context = values[:context] unless values[:context].nil?
		log.save
	end
end
