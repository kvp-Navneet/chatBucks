class Post < ActiveRecord::Base
  acts_as_commentable
  acts_as_votable
  belongs_to :user
  has_many :comments, as: :commentable
  counter_culture :user
  mount_uploader :attachment, AvatarUploader
  validates_presence_of :content
  validates_presence_of :user
  auto_html_for :content do
    html_escape
    image
    youtube(width: 400, height: 250, autoplay: true)
    link target: '_blank', rel: 'nofollow'
    simple_format
 end


end
