class StartupPolicy < CategoryPolicy
	def create?
		user.present?
	end
	def import?
	 	true
	end
end