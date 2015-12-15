class SubmissionPolicy < ApplicationPolicy
	def index?
		user.present? && user.admin?
	end
	def create?
		true
	end

	def update?
		user.present? && user.admin?
	end

	def show?
		user.present? || user.admin?
	end

	def destroy?
		user.present? && user.admin? 
	end

private
	def category
		record
	end
end