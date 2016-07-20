class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tag_users

  validates_presence_of :avatar 
  validates_integrity_of :avatar 
  validates_processing_of :avatar
end
