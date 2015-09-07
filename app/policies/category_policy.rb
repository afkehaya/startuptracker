class CategoryPolicy < ApplicationPolicy
	def index?
		true
	end
	def create?
		user.present?
	end

	def update?
		user.present? && user == category.user || user.admin?
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
