class IndustryPolicy < ApplicationPolicy
	def index?
		true
	end
	def create?
		user.present? && user.admin?
	end

	def update?
		user.present? && user.admin?
	end

	def show?
		true
	end

	def destroy?
		user.present? && user.admin?
	end

	def user?
		user.present?
	end 
private
	def category
		record
	end
end