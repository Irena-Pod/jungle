class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def self.authenticate_with_credentials(email,password)
    email = email.gsub(/\s+/,"")
    @user = User.where("lower(email) = ?", email.downcase).first
    if @user && @user.authenticate(password)
       @user
    else
        nil
    end
end

end
