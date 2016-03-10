class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }
  acts_as_commentable
  acts_as_votable
  belongs_to :user
  has_many :comments, as: :commentable ,dependent: :destroy
  counter_culture :user
  mount_uploader :attachment, AvatarUploader
  validates_presence_of :content
  validates_presence_of :user
  


end
