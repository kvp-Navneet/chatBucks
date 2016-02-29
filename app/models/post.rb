class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  counter_culture :user
  acts_as_votable
  acts_as_commentable
  mount_uploader :attachment, AvatarUploader
  validates_presence_of :content
  validates_presence_of :user
  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }
end
