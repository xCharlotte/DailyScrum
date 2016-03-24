class Standup < ApplicationRecord
  validates :yesterday, presence: true
  validates :today, presence: true
  
  belongs_to :user
  belongs_to :team 
end
