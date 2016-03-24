class Team < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  def full_name
    self.first_name + ' ' + self.last_name
  end

  has_many :standups
  
end
