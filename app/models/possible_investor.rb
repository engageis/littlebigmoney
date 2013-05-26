class PossibleInvestor < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :amount
  validates :project, :user, :amount, presence: true
end
