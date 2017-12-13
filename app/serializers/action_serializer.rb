class ActionSerializer < ActiveModel::Serializer
	attributes :id, :value, :old_value, :new_value, :action_type, :action_date, :created_at

	def old_value
		object.value
	end

	def new_value
		object.value
	end
end
