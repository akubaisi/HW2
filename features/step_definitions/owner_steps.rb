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
		
		Then /^I should see "(.*?)" in the "(.*?)"$/ do |output, selectorX| 
			page.should have_selector(selectorX, :text => output) 
		end
		
		
		
		