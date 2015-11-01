class StartupPolicy < CategoryPolicy
	def create?
		user.present? && user.admin?
	end

	def show?
		user.present?
	end
end