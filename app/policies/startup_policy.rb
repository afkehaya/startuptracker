class StartupPolicy < CategoryPolicy
	def create?
		user.present?
	end

	def import?
	 	user.present?
	end
end