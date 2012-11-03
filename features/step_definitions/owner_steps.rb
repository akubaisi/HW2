		When /^I go to the home page$/ do  #Done
			visit root_path
		end
		
		Then /^I should not see "(.*?)"$/ do |message|  #Done
			page.should_not have_content message
		end
		
		Given /^I am on the home page$/ do
			visit root_path
		end
			
		When /^I follow the "(.*?)" link$/ do |linktext| 
			page.should have_link linktext
			click_link linktext
			
		end
		
		Then /^I should see "(.*?)" in thee "(.*?)"$/ do |output, selectorX| 
			page.should have_selector(selectorX, :text => output) 
		end
		
		When /^I follow the create path$/ do
			#visit new_owner_path
		end
		
		When /^I open owners page$/ do
		pending #	visit owners_path
		end
		
		Then /^I should be seeing "(.*?)" as the heading$/ do |title|
		pending #	page.should have_content title
		end
		
		When /^I follow the update path$/ do
			pending #..	visit owners_update_path
		end
	
		When /^I follow the delete path$/ do
			pending #..		visit owners_destroy_path
		end
		
		When /^I enter "(.*?)" in "(.*?)"$/ do |arg1, arg2|
			pending
		end
		
		When /^I select "(.*?") in "(.*?)"$/ do |arg11, arg2|
		pending
		end
		
		When /^I check active$/ do
			pending
		end
		
		Then /^I should be seeing "(.*?)"$/ do |arg1|
			pending
		end
		
		When /^click the update button$/ do
			pending
		end
		
		When /^I change "(.*?)" to "(.*?)"$/ do |arg1, arg2|
			pending
		end
		
		
		#Given /^an initial business$/ do
		#	@cat = FactoryGirl.create(:animal)
		#	@dog = FactoryGirl.create(:animal, :name => "Dog")
		#	@gianna = FactoryGirl.create(:owner, :first_name => "Gianna")
		#	@joey = FactoryGirl.create(:owner)
		#	@Ryn = FactoryGirl.create(:owner, :first_name => "Ryn")
		#	@spot = FactoryGirl.create(:pet, :name => "Spot", :animal => @dog, :owner => @joey, :female => true, :active => false)
		#	@boots = FactoryGirl.create(:pet, :animal => @cat, :owner => @joey, :active => false)
		#	@puss = FactoryGirl.create(:pet, :name => "Puss", :animal => @cat, :owner => @ryn)			
		#	@henry = FactoryGirl.create(:pet, :name => "Henry", :animal => @dog, :owner => @gianna)
		#end
		
		Then /^in the "(.*?)", I should see "(.*?)"$/ do |tag,value|
			page.should have_css(tag, :text => value)
		end
		
		Given /^I am on the 'owners' page$/ do
			visit owners_path
		end
		
		Then /^I should see a link to "(.*?)" in the "(.*?)"$/ do |csstag,value|
			within csstag do
			page.should have_link value
			end
		end
		
		When /^I follow the "(.*?)" link for "(.*?)"$/ do |link, cell_value|
			within_table('Owner List') do
				within('tr', :text => cell_value) do
					find('a', :text => link).click
				end
			end
		end
		
		When /^I change the email address "(.*?)" to "(.*?)"$/ do |oldemail, newemail|
			fill_in "Email", :with => newemail
		end
		
		When /^I click the button "(.*?)"$/ do |buttonname|
			click_button buttonname
		end
		
		When /^in the "(.*?)", I should be seeing "(.*?)"$/ do |arg1, arg2|
			pending
		end
				
		When /^I follow the create pet path$/ do
		pending
		end		
		
		
		When /^I follow the create animal path$/ do
		pending
		end		
		
		
		When /^I follow the create visit path$/ do
		pending
		end		
		
		
		When /^I follow the create vaccine path$/ do
		pending
		end		
		
		
		When /^I follow the create vaccination path$/ do
		pending
		end		
		
		
		When /^I open pets page$/ do
		pending
		end		
		
		When /^I open animal page$/ do
		pending
		end		
		When /^I open vaccine page$/ do
		pending
		end		
		When /^I open visit page$/ do
		pending
		end		
		When /^I open vaccination page$/ do
		pending
		end		
		
		When /^I follow the delete pet path$/ do
		pending
		end		
		
		When /^I follow the delete animal path$/ do
		pending
		end		
		
		When /^I follow the delete visit path$/ do
		pending
		end		
		
		When /^I follow the delete vaccine path$/ do
		pending
		end		
		
		When /^I follow the delete vaccination path$/ do
		pending
		end		
		
		
		When /^I follow the update pet path$/ do
		pending
		end		
		
		When /^I follow the update animal path$/ do
		pending
		end		
		When /^I follow the update visit path$/ do
		pending
		end		
		When /^I follow the update vaccine path$/ do
		pending
		end		
		When /^I follow the update vaccination path$/ do
		pending
		end		