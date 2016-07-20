class TagUser < ActiveRecord::Base
  has_one :users 
  has_one :articles 
end
