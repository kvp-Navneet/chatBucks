class User < ActiveRecord::Base
	  has_many :posts
    has_many :events
    has_many :comments
    has_many :friendships
    has_many :friends, :through=> :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user
    mount_uploader :avatar, AvatarUploader
    validates :mobile, length: { is: 10 }

    validates_presence_of :name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
