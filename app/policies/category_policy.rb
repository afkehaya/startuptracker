class CategoryPolicy < ApplicationPolicy
	def index?
		true
	end
	def create?
		user.present?
	end

	def update?
		user.present? && user == category.user
	end

	def show?
		true
	end

	def destroy?
		true
	end

private
	def category
		record
	end
end
