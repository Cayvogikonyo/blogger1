class Author < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
  has_one :user, dependent: :destroy
  has_many :articles, dependent: :nullify

	def to_s
		name
	end
end
