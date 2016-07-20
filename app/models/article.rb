class Article < ActiveRecord::Base
  has_many :tag_users

end
