# == Schema Information
#
# Table name: blackmail
#
#  id           :integer         not null, primary key
#  user_id      :integer         not null
#  title        :string(255)     not null
#  description  :string(255)     not null
#  victim_name  :string(255)     not null
#  victim_email :string(255)     not null
#  expired_at   :datetime
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Blackmail < ActiveRecord::Base
  # Relations  
  belongs_to :user
  has_many :demands, dependent: :delete_all
  
  #this might fix the "expecting 'Demands' got 'Array' error when posting new blackmail:
  accepts_nested_attributes_for :demands
  
  # Validations
  validates :victim_email, email: true
  validate :at_least_one_demand
    
  private
  
  def at_least_one_demand
    unless demands.any?
      errors.add_to_base 'You must specify at least one demand.'
    end
  end
  
end
