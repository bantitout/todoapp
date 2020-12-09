class User < ApplicationRecord
  has_many :tasks,dependent: :destroy
  has_secure_password
  validates_presence_of   :username, :message => 'Please Enter User  Name.'
  validates_presence_of   :password, :message => 'Please Enter Password.'
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
end
