class GlobalConfig < ActiveRecord::Base
	after_update :update_global_config


	def update_global_config
		self.attributes.each do |attr_name, attr_value|
			APP_CONFIG[attr_name] = attr_value if attr_value != nil && attr_value != ''
		end
	end
end
