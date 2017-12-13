module RoutesHelper
	def self.list_path_helpers
		Rails.application.routes.url_helpers.public_instance_methods.each do |method|
			puts method if method.to_s[-4,4] == "path"
		end
		nil
	end

	def self.path_helper(method_name, id = nil)
		Rails.application.routes.url_helpers.send(method_name, only_path: true) # TODO: pass id when required
	end
end