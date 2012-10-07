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
		#	visit owners_new_path
		end
		
		When /^I open owners page$/ do
		#	visit owners_path
		end
		
		Then /^I should be seeing "(.*?)" as the heading$/ do |message|
		#	page.should have_content message
		end
		
		When /^I follow the update path$/ do
			pending #	visit owners_update_path
		end
	
		When /^I follow the delete path$/ do
			pending #		visit owners_destroy_path
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
		
		When /^click the delete button for owner of id "(.*?)"$/ do |arg1|
		pending
		end
		
		Then /^I should see nil for owner of id "(.*?)"$/ do |arg1|
		pending
		end