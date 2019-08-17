class User < ApplicationRecord
  has_secure_password

  before_validation :set_status

  has_many :votes
  has_many :voters, through: :votes, as: :vote
  has_one :pin

  private

  def set_status
    self.active = false unless active
  end
end
