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
			Then I should see "About Us" in the "title"
			
		Scenario: View 'Contact Us'
			Given I am on the home page
			When I follow the "Contact Us" link
			Then I should see "Contact Us" in the "title"
		
		Scenario: View 'Privacy Policy'
			Given I am on the home page
			When I follow the "Privacy Policy" link
			Then I should see "Privacy Policy" in the "title"
		
		Scenario: View webmaster information in footer
			Given I am on the home page
			When I follow the "Webmaster" link
			Then I should see "Webmaster" in the "footer"
			
		Scenario: View About Us information in footer
			Given I am on the home page
			When I follow the "About Us" link
			Then I should see "About Us" in the "footer"
		
		Scenario: View Contact Us information in footer
			Given I am on the home page
			When I follow the "Contact Us" link
			Then I should see "Contact Us" in the "footer"
		
		Scenario: View Privacy Policy information in footer
			Given I am on the home page
			When I follow the "Privacy Policy" link
			Then I should see "Privacy Policy" in the "footer"