require 'spec_helper'

describe Vaccine do
before(:each) do 
	@cat = FactoryGirl.create(:animal)
	@dog = FactoryGirl.create(:animal, :name => "Dog")
	@rabies = FactoryGirl.create(:vaccine, :animal => @dog)
	@leukemia = FactoryGirl.create(:vaccine, :animal => @cat, :name => "Leukemia", :duration => nil)
	@heartworm = FactoryGirl.create(:vaccine, :animal => @dog, :name => "Heartworm")
end

	describe "Test factories" do
		it "should have valid factory objects" do
			@cat.should be_valid
			@dog.should be_valid
			@rabies.should be_valid
			@leukemia.should be_valid
			@heartworm.should be_valid
		end

	end
	
	it "should have the correct associations" do
		should belong_to(:animal)
		should have_many(:vaccinations)
		should have_many(:visits).through(:vaccinations)
	end
	
	describe "Validations" do
		it "should validate presence of" do
		should validate_presence_of(:name)
		should validate_presence_of(:animal_id)
		end
		
		it "should validate numericality of" do
			should validate_numericality_of(:duration).only_integer
		end
		
		it "should allow valid numbers for durations" do
			should allow_value(1).for(:duration)
			should allow_value(100).for(:duration)
			should allow_value(500).for(:duration)
		end
		
		it "should not allow invalid numbers for duration" do
			should_not allow_value(0).for(:duration)
			should_not allow_value(-1).for(:duration)
			should_not allow_value(3.14159).for(:duration)
			should_not allow_value(-3.14159).for(:duration)
		end
	end
	
	describe "Scopes" do
		it "return all names alphabetically" do
			Vaccine.alphabetical.map{|v| v.name}.should == ["Heartworm", "Leukemia", "Rabies"]
		end
		it "should return all vaccinations for a given animal" do
			Vaccine.for_animal(@cat.id).alphabetical.map{|v| v.name}.should == ["Leukemia", "Rabies"]
		end
	end
	
	describe "Methods" do
		it "should assume lifetime for nil or blank duration" do
			@leukemia.duration.should == 7300
		end
	end
end
