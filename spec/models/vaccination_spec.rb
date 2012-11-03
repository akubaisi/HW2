require 'spec_helper'

describe Vaccination do
	before(:each) do
		@dog = FactoryGirl.create(:animal, :name => "Dog")
		@cat = FactoryGirl.create(:animal)
		@owner = FactoryGirl.create(:owner)
		@henry = FactoryGirl.create(:pet, :owner => @owner, :name => "Henry", :animal  => @dog)
		@boots = FactoryGirl.create(:pet, :owner => @owner, :name => "Boots")
		@rabies = FactoryGirl.create(:vaccine, :animal => @dog)
		@leukemia = FactoryGirl.create(:vaccine, :animal => @cat, :name => "Leukemia", :durtion => nil)
		@heartworms = FactoryGirl.create(:vaccine, :animal => @dog, :name => "Heartworm")
		@visit1 = FactoryGirl.create(:visit, :pet => @henry)
		@visit2 = FactoryGirl.create(:visit, :pet => @boots, :visit_date => 5.days.ago)
		@visit3 = FactoryGirl.create(:visit, :pet => @boots, :visit_date => 2.years.ago)
		@vacc1 = FactoryGirl.create(:vaccination, :visit => @visit1, :vaccine => @leukemia)
		@vacc2 = FactoryGirl.create(:vaccination, :visit => @visit2, :vaccine => @rabies)
		@vacc3 = FactoryGirl.create(:vaccination, :visit => @visit2, :vaccine => @leukemia)
		@vacc4 = FactoryGirl.create(:vaccination, :visit => @visit3, :vaccine => @rabies)
			
	end
			
	it "should have valid factory objects" do
		@dog.should be_valid
		@cat.should be_valid
		@owner.should be_valid
		@henry.should be_valid
		@boots.should be_valid
		@rabies.should be_valid
		@leukemia.should be_valid
		@heartworms.should be_valid
		@visit1.should be_valid
		@visit2.should be_valid
		@visit3.should be_valid
		@vacc1.should be_valid
		@vacc2.should be_valid
		@vacc3.should be_valid
		@vacc4.should be_valid
	end
	
	it "should have the proper asociation" do
		should belong_to (:visit)
		should belong_to (:vaccine)
	end
	
	describe "Scopes" do
		it "should list in chronological order" do	
			dates = Array.new
			dates << 2.days.ago
			dates << 5.days.ago
			dates << 2.years.ago
			Vaccination.chronological.map{|v| v.visit_date}.should == dates
		end
		
		it "should get vaccinations for a given visit" do
			Vaccination.for_visit(@visit2).size.should == 2
		
		end
		
		it "should get all the vaccinations for a given vaccine" do
			Vaccination.for_vaccine(@leukemia).size.should == 2
		end
		
		it "should get all the last 'x' number of vaccinations" do
			Vaccination.for_vaccine(@boots.id).latest(5).size.should == 3
			Vaccination.for_vaccine(@henry.id).latest(1).size.should == 1
		
		
		end
	end
	
	describe "Methods" do
		it "should allow matching vaccine and animal type" do
			vacc1.vaccine_matches_animal_type.should be_true
		end
		
		it "should not allow matching vaccine and animal type" do
			vacc1.vaccine_matches_animal_type.should_not be_true
		end

		it "should allow vaccines that are offered by QATS" do
			vacc1.vaccine_offered_by_QATS.should be_true
		end
		
		it "should not allow vaccines that are not offered by QATS" do
			vacc1.vaccine_offered_by_QATS.should_not be_true
		end
	end
	
		
end

