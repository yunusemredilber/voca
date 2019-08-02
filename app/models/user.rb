class User < ApplicationRecord
  has_secure_password

  has_many :votes
  has_many :voters, through: :votes, as: :vote
  has_one :pin

  private

  def set_status
    self.status = false unless status
  end
end
