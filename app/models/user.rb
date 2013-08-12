class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
	validates :email, presence: true,  uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	validates_confirmation_of :password,
                          if: lambda { |m| m.password.present? }

	has_secure_password
end
