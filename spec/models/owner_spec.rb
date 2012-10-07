require 'spec_helper'
require 'factory_girl'
	
	describe Owner do
	
		before (:each )do
		@attr = {:first_name => "asma", :last_name => "Al-kubaisi",	:street => "Abe aldardaa", :country => "QA", :city => "Doha", :email => "asma@jxs.com", :phone => "97444548624",
			:active => true}
		end
	
		describe "Validation Macros" do
			it{should validate_presence_of(:first_name)}
			it{should validate_presence_of(:last_name)}
			it{should validate_presence_of(:email)}
			it{should validate_presence_of(:phone)}
		end

		describe "Validates good emails" do
		#	it{should allow_value("fred@fred.com").for(:email)}
		#	it{should allow_value("fred@qatar.cmu.edu").for(:email)}
		#	it{should allow_value("my.fred@fred.org").for(:email)}
		#	it{should allow_value("fred@fred.gov").for(:email)}
		#	it{should allow_value("1234fred@fred.net").for(:email)}
		end
		
		describe "Rejects bad emails" do
		#	it{should_not allow_value("fred").for(:email)}
		#	it{should_not allow_value("fred@fred,com").for(:email)}
		#	it{should_not allow_value("fred@fred.uk").for(:email)}
		#	it{should_not allow_value("my fred@fred.com").for(:email)}
		#	it{should_not allow_value("fred@fred.con").for(:email)}
		end

	describe "Validates good phone numbers" do
		#it{should allow_value("97444548624").for(:phone)}
	end
	describe "Rejects bad phone numbers" do
		#it{should_not allow_value("800-EAT-FOOD").for(:phone)}
	end
	describe "Validates good country" do
		#it{should allow_value("QA").for(:country)}
	end
	
	describe "Rejects bad ountry" do
		#it{should_not allow_value("bad").for(:country)}
	end
	
	describe "Creating three owner" do
	#	before (:each) do
	#		@joey = FactoryGirl.create(:owner)  #creates it and saves it to the database
	#		@ryn = FactoryGirl.create(:owner, :first_name => "Ryn", :active => false)   #changing two values from the default, the rest stays the same
	#		@gianna = FactoryGirl.create(:owner, :first_name => "gianna", :Phone => "974-5557-8615")
	#	end
		
	#	describe "All factories are properly created" do   #the name method
	#		@joey.first_name.should == "Joey"
	#		@ryn.first_name.should == "Ryn"
	#		@gianna.first_name.should == "gianna"
	#		@joey.active.should be_true
	#		@ryn.active.should_not be_true
	#		@gianna.active.should be_true  #doesnt work <<<<<<<<<<<<<<<<<<<<<< add factory girl in gem file ??
	#	end
	end
	describe "Create objects with FactoryGirl" do
		before(:each) do
			@joey = FactoryGirl.create(:owner)  #gets all the default ones
			@ryn = FactoryGirl.create(:owner, :first_name => "Ryn", :active => false)
			@gianna = FactoryGirl.create(:owner, :first_name => "Gianna", :phone => "+974-5557-8615")
		end
	
	#now we need to write our test! test for factory creating objects right, then attributes are right, then test diff methods (scopes and methods)
		it "created the factory object correctly" do
			@joey.should be_valid
			@ryn.should be_valid
			@gianna.should be_valid
		end
	
		it "should have the right attributes" do
			@joey.first_name.should == "Joey"
			@ryn.frist_name.should == "Ryn"
			@ryn.active.should be_false 
			@gianna.first_name.should == "Gianna"
		end
		
		it "should remove all + and . from phone before save" do
			@gianna.phone.should == "9745578615" 
		end
		
		it "should return the proper name as first_name last_name" do
			@joey.proper_name.should == "Joey Phelps"
			@gianna.proper_name.should == "Gianna Phelps"
		end
		
		it "should return the name as last_name, first_name" do
			@joey.name.should == "Phelps, Joey"
			@gianna.name.should == "Phekps, Gianna"
		end
		
		it "should return the names in alphabetical order" do
			Owner.alphabetical.map{|o| o.first_name}.shold == ["gianna", "Joey", "Ryn"]
		end
		
		it "should return only active owners" do
			Owner.active.alphabetical.map{|o| o.first_name}.should == ["Gianna", "Joey"]
		end
		
	end
	
		end
	