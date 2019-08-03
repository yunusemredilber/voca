class Partner < ApplicationRecord
  has_secure_password

  has_many :votes
  has_many :voted_users, through: :votes, as: :user

end
