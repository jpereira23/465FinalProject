class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :tag_articles
end
