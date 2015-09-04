class StartupPolicy < CategoryPolicy
	def create?
		user.present?
	end
end