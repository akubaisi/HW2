require 'spec_helper'

describe Visit do
	before(:each) do
		before(:each) do #look at factory, is there any visit here? No, so we create a visit factory (found below #at factories ...)
		@owner = FactoryGirl.create(:owner)
		@puss = FactoryGirl.create(:pet, :owner => @owner, :name => "Puss")
		@boots = FactoryGirl.create(:pet, :owner => @owner, :name => "Boots")
		@visit1 = FactoryGirl.create(:visit, :pet =>@puss)
		@visit2 = FactoryGirl.create(:visit, :pet => @boots, :visit_date => 5.days.ago)
		@visit2 = FactoryGirl.create(:visit, :pet => @boots, :visit_date => 2.years.ago)
	end
	end
	it "should have valid factories" do
		@owner.should be_valid
		@puss.should be_valid
		@boots.should be_valid
		@visit1.should be_valid
		@visit2.should be_valid
		@visit3.should be_valid
	end
	it "should allow only valid numbers for weight" do
		should allow_value(1).for(:weight)
		should allow_value(10).for(:weight)
		should allow_value(50).for(:weight)
	end

	it "should not allow invalid numbers for weight" do
		should_not allow_value(0).for(:weight)
		should_not allow_value(-1).for(:weight)
		should_not allow_value(3.1415).for(:weight)     #since we saved the data type as integer
		should_not allow_value(-3.1415).for(:weight)
	end

	it "should have the correct associations" do
		should belong_to(:pet)
		should have_many(:vaccinations)
		should have_many(:vaccines).through(:vaccinations)
	end
	
	it "should validate the presence of pet_id" do
		should validate_presence_of :pet_id
	end

	it "should validate the presence of weight" do
		should validate_presence_of :weight
	end

	it "should validate the presence of visit_date" do
		should validate_presence_of :visit_date
	end
	
	it "should validate the numericality of weight" do
		should validate_numericality_of(:weight)
	end
	
	it "should create valid visit factory" do
		@visit.should be_valid
	end
	
	it "should validate that weight is greater than 0" do
		@visit.weight = 0
		@visit.should_not be_valid
	end
	
	describe "Testing Scoped" do
		it "should put visits in chronological order" do   #the most recent to the oldest, comparing dates from visits
			dates = Array.new
			dates << 2.days.ago
			dates << 5.days.ago
			dates << 2.years.ago
			Visit.chronological.map{|v| v.visit_date}.should == dates
		end
		
		it "should allow us to return the visits for a given pet" do
			Visit.for_pet(@boots.id).size.should == 2
			Visit.for_pet(@puss.id).size.should == 1
		end
		
		it "should allow us to return the latest 'x' visits" do
			Visit.for_pet(@boots.id).latest(5).size.should == 2
			Visit.for_pet(@boots.id).latest(1).size.should == 1
			Visit.for_pet(@boots.id).latest(2).size.should == 1
		end
	end
end
