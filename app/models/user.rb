class User < ApplicationRecord
	has_one :info
	validates :email, :name,  presence: true, uniqueness: true

	#validates :password
	#validates :name ,uniqueness: { case_sensitive: false}
end
