class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  default_scope -> { order('created_at DESC') }
  validates_presence_of :comment

end
