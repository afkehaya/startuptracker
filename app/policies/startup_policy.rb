class StartupPolicy < CategoryPolicy
	def create?
		user.present?
	end

	def show?
		user.present?
	end
end