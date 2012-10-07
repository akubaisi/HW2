#textmate for mac
Feature: Owner
	As a user
	I want to be able to view certain information
	So I can have confidence in the system

		Scenario: Do not see the default rails page
			When I go to the home page
			Then I should not see "You're riding Ruby on Rails!"
				And I should not see "About your application's environment"
				And I should not see "Create your database"
				
		Scenario: View 'About Us'
			Given I am on the home page
			When I follow the "About Us" link
			Then I should see "About Us" in thee "title"
			
		Scenario: View 'Contact Us'
			Given I am on the home page
			When I follow the "Contact Us" link
			Then I should see "Contact Us" in thee "title"
		
		Scenario: View 'Privacy Policy'
			Given I am on the home page
			When I follow the "Privacy Policy" link
			Then I should see "Privacy Policy" in thee "title"
		
		Scenario: View webmaster information in footer
			Given I am on the home page
			When I follow the "Webmaster" link
			Then I should see "Webmaster" in thee "footer"
			
		Scenario: View About Us information in footer
			Given I am on the home page
			When I follow the "About Us" link
			Then I should see "About Us" in thee "footer"
		
		Scenario: View Contact Us information in footer
			Given I am on the home page
			When I follow the "Contact Us" link
			Then I should see "Contact Us" in thee "footer"
		
		Scenario: View Privacy Policy information in footer
			Given I am on the home page
			When I follow the "Privacy Policy" link
			Then I should see "Privacy Policy" in thee "footer"
			
		Scenario: view owners page
			When I open owners page
			Then I should be seeing "Owners#index" as the heading
		
		Scenario: view Owners#new page
			When I follow the create path
			Then I should be seeing "New owner" as the heading
			
		Scenario: view Owners#update page
			When I follow the update path
			Then I should be seeing "owners#update" as the heading
		
		Scenario: view owners#delete
			When I follow the delete path
			Then I should be seeing "owners#destry" as the heading
			
		Scenario: creating a user
			When I follow the create path
			And I enter "Asma" in "first_name" 
			And I enter "Al-kubaisi" in "last_name"
			And I enter "Abe aldarda" in "Street"
			And I enter "asma@ff.gov" in "Email"
			And I enter "97455555555" in "Phone"
			And I enter "Doha" in "City"
			And I select "Qatar" in "Country"
			And I check active
			Then I should be seeing "Created new owner Asma Al-kubaisi"
			And I should be seeing "Name:"
			And I should be seeing "Asma Al-kubaisi"
			And I should be seeing "Street"
			And I should be seeing "Abe aldarda"
			And I should be seeing "Email:"
			And I should be seeing "asma@ff.gov"
			And I should be seeing "phone:"
			And I should be seeing "97455555555"
			And I should be seeing "City:"
			And I should be seeing "Doha"
			And I should be seeing "Country:"
			And I should be seeing "Qatar"
			And I should be seeing "Active with QATS? true"
		
		
		Scenario: updating a user
			When I open owners page
			And click the update button
			And I change "first_name" to "Marwa"
			Then I should be seeing "Owner was successfully updated."
			And I should be seeing "Name:"
			And I should be seeing "Marwa Al-abdulla"
			
		Scenario: deleting a user
			When I open owners page
			And click the delete button for owner of id "1"
			Then I should be seeing nil for owner of id "1"
		
		
		