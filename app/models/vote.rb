class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :partner

  enum status: [:undecided, :approved, :denied ]
end
