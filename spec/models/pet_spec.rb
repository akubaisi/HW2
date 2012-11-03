require 'spec_helper'

describe Pet do
	it "should have correct associations" do
		should belong_to(:owner)
		should belong_to(:animal)
		should have_many(:visits)
	end
	
	it "should have a name" do
		should validate_presence_of(:name)
	end
	
	describe "Create our factories" do
		before(:each) do
			@cat = FactoryGirl.create(:animal)
			@dog = FactoryGirl.create(:animal, :name => "Dog")
			@gianna = FactoryGirl.create(:owner, :first_name => "Gianna")
			@joey = FactoryGirl.create(:owner)
			@Ryn = FactoryGirl.create(:owner, :first_name => "Ryn")
			@spot = FactoryGirl.create(:pet, :name => "Spot", :animal => @dog, :owner => @joey, :female => true, :active => false)
			@boots = FactoryGirl.create(:pet, :animal => @cat, :owner => @joey, :active => false)
			@puss = FactoryGirl.create(:pet, :name => "Puss", :animal => @cat, :owner => @ryn)			
			@henry = FactoryGirl.create(:pet, :name => "Henry", :animal => @dog, :owner => @gianna)
		end
		
		it "should create the factories correctly" do
			@cat.should be_valid
			@dog.should be_valid
			@gianna.should be_valid
			@joey.should be_valid
			@ryn.should be_valid
			@spot.should be_valid
			@boots.should be_valid
			@puss.should be_valid
			@henry.should be_valid
		end
		
		it "should have valid attributes" do
			@dog.name.should == "Dog"
			@gianna.first_name.should == "Gianna"
			@henry.name.should == "Henry"
		end
		
		it "should have corect associations" do
			@gianna.pets[0].name.should == "Henry"
			@henry.owner.first_name.should == "Gianna"
			@boots.owner.first_name.should == "Joey"
			@puss.animal.name.should == "Cat"
			@henry.animal.name.should == "Dog"
		end
		
		it "should allow an owner to have many pets" do
			@joey.pets.count.should == 2
			@joey.pets.alphabetical.map{|p| p.name}.should == ["Boots", "Spot"]
		end

		it "should return all active pets" do
			Pet.active.count.should == 2
			Pet.active.alphabetical.map{|p| p.name}.should == ["Henry", "Puss"]
		end
		
		it "should return all female pets" do
			Pet.female.count.should == 1
			Pet.female.alphabetical.map{|p| p.name}.should == ["Spot"]
		end

		it "should return all male pets" do
			Pet.male.count.should == 3
			Pet.male.alphabetical.map{|p| p.name}.should == ["Boots", "Henry", "Puss"]
		end
		
		it "should return all the pets of a given owner" do
			Pet.for_owner(@joey.id).count.should == 2
			Pet.for_owner(@joey.id).alphabetical.map{|p| p.name}.should == ["Boots", "Spot"]
		end
		
		it "should return all the pets of a given animal type" do
			Pet.by_animal(@cat.id).count.should == 2
			Pet.by_animal(@cat.id).alphabetical.map{|p| p.name}.should == ["Henry", "Spot"]
		end
		
		it "should return all the pets before a given date of birth" do
			Pet.born_before(5.years.ago).count.should == 4
			Pet.born_before(5.years.ago).alphabetical.map{|p| p.name}.should == ["Boots", "Henry", "Puss", "Spot"]
		end
	
	end	
 end
