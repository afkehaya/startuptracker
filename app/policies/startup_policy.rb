class StartupPolicy < CategoryPolicy
	def create?
		user.present?
	end

	def show?
		true
	end
end