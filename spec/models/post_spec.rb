require 'rails_helper'
RSpec.describe Post, type: :model do

	before(:each) do
		@post = Post.create
	end

	it "validate presence of :content" do
		expect(@post).to validate_presence_of(:content)
	end

	it "validate presence of :user" do
		expect(@post).to validate_presence_of(:user)
    end

	it "check association of :post to :user" do
		should belong_to(:user) 
	end
	it "check association of :post to :comment" do
		should have_many(:comments) 
	end
end
