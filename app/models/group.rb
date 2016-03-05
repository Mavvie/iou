class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  def add_user
    
  end
end
