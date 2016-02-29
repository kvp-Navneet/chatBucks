class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  acts_as_votable
  acts_as_commentable
  validates_presence_of :name
  validates_presence_of :when 
  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }
end
