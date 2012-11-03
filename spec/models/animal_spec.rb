require 'spec_helper'

describe Animal do
	it "should have proper associations" do
		should have_many(:pets)
		should have_many(:vacines)
	end
	
	it "should have proper validations" do
		should validate_presence_of(:name)
	end
	
	it "should have proper factory values" do
		@cat = FactoryGirl.create(:animal)
		@cat.should be_valid
	end






end
