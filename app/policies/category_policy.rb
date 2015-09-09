class CategoryPolicy < ApplicationPolicy
	def index?
		true
	end
	def create?
		user.present?
	end

	def update?
		return true if user.present? && (user.admin? || category.user)
	end

	def show?
		true
	end

	def destroy?
		user.present? && user.admin?
	end
private
	def category
		record
	end
end
