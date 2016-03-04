class Event < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, as: :commentable
  validates_presence_of :name
  validates_presence_of :when 
end
