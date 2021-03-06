class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         has_many :posts
         has_many :comments
         has_many :votes, dependent: :destroy
         mount_uploader :avatar, AvatarUploader
end

def role?(base_role)
    role == base_role.to_s
end



