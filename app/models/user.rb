class User < ActiveRecord::Base
  has_many :posts
  before_save { self.email = email.downcase }

# #3
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

# #4
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
# #5
  validates :password, presence: true, length: { minimum: 6 }
# #6
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

# #7
  has_secure_password

end
