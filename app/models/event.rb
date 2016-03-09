class Event < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }
  acts_as_votable
  belongs_to :user
  has_many :comments, as: :commentable
  validates_presence_of :name
  validates_presence_of :when 
end
