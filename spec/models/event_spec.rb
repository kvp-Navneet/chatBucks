require 'rails_helper'

RSpec.describe Event, type: :model do
	before(:each) do
		@event = Event.create
	end

	it "validate presence of :name" do
		expect(@event).to validate_presence_of(:name)
	end

	it "validate presence of :when" do
		expect(@event).to validate_presence_of(:when)
	end

	it "check association of :event to :user" do
		should belong_to(:user) 
	end
	it "check association of :event to :comment" do
		should have_many(:comments) 
	end
	
end
