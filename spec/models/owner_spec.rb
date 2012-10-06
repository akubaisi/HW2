require 'spec_helper'
require 'factory_girl'
	
	describe Owner do
		describe "Validation Macros" do
			it{should validate_presence_of(:first_name)}
			it{should validate_presence_of(:last_name)}
			it{should validate_presence_of(:email)}
			it{should validate_presence_of(:phone)}
		end

		describe "Validates good emails" do
			it{should allow_value("fred@fred.com").for(:email)}
			it{should allow_value("fred@qatar.cmu.edu").for(:email)}
			it{should allow_value("my.fred@fred.org").for(:email)}
			it{should allow_value("fred@fred.gov").for(:email)}
			it{should allow_value("1234fred@fred.net").for(:email)}
		end
		
		describe "Rejects bad emails" do
			it{should_not allow_value("fred").for(:email)}
			it{should_not allow_value("fred@fred,com").for(:email)}
			it{should_not allow_value("fred@fred.uk").for(:email)}
			it{should_not allow_value("my fred@fred.com").for(:email)}
			it{should_not allow_value("fred@fred.con").for(:email)}
		end

describe "Validates good phone numbers" do
		it{should allow_value("97444548624").for(:phone)}
	end
	describe "Rejects bad phone numbers" do
		it{should_not allow_value("800-EAT-FOOD").for(:phone)}
	end
	describe "Validates good country" do
		it{should allow_value("QA").for(:counry)}
	end
	
	describe "Rejects bad ountry" do
		it{should_not allow_value("bad").for(:counry)}
	end
	

		end
	