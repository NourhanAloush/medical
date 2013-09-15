class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	
	validates :name,  presence: true, length: { maximum: 50 }
	validates :email, presence: true,  uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	validates_confirmation_of :password,
                          if: lambda { |m| m.password.present? }

	has_secure_password


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpg"

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
