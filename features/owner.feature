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
			
	
		Scenario: List	Owner
			Given I am on the 'owners' page
			Then I should see "QATS :: Owners" in thee "title"
			And in the "body", I should see "Pet Owners Served by QATS" 
			And in the "th", I should see "Owner"
			And in the "th", I should see "Phone" 
			And in the "th", I should see "Email"
			And in the "td", I should see "Phelps, Joey"
			And in the "td", I should see "97444548624"
			And in the "td", I should see "joey@joeyphelps.com"
			And I should see a link to "Add a New Owner" in the "body"
			
			
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
			
		
		Scenario: updating an owner
			Given I am on the 'owners' page
			When I follow the "Edit" link for "Phelps, Joey"
			And I change the email address "joey@joeyphelps.com" to "joey@me.com"
			And I click the button "Update"
			Then in the "div#flash_notice", I should be seeing "Joey Phelps was successfully updated."
			
		Scenario: deleting an owner
			Given I am on the 'owners' page
			When I follow the "Destroy" link for "Phelps, Joey"
			Then I should not see "Phelps, Joey"
			
		
		Scenario: creating a Pet
			When I follow the create pet path
			And I enter "1" in "animal_id"
			And I enter "Boots" in "name"
			Then I should be seeing "Created new pet Boots."

		Scenario: view pet page
			When I open pets page
			Then I should be seeing "Pets#index" as the heading
		
		Scenario: view Pets#new page
			When I follow the create pet path
			Then I should be seeing "New pet" as the heading
			
		Scenario: view Pets#update page
			When I follow the update pet path
			Then I should be seeing "pets#update" as the heading
		
		Scenario: view Pets#delete
			When I follow the delete pet path
			Then I should be seeing "pets#destry" as the heading
			
			
		Scenario: creating an animal
			When I follow the create animal path
			And I enter "Cat" in "name"
			Then I should be seeing "Created new animal Cat."

		Scenario: view animal page
			When I open animal page
			Then I should be seeing "Animals#index" as the heading
		
		Scenario: view Animals#new page
			When I follow the create pet path
			Then I should be seeing "New pet" as the heading
			
		Scenario: view Animals#update page
			When I follow the update animal path
			Then I should be seeing "Animals#update" as the heading
		
		Scenario: view animals#delete
			When I follow the delete animal path
			Then I should be seeing "animals#destry" as the heading
			
	
		Scenario: creating a visit
			When I follow the create visit path
			And I enter "1" in "pet_id"
			And I enter "20" in "weight"
			And I enter "2.days.ago" in "date"
			Then I should be seeing "Created new visit 1."

		Scenario: view visit page
			When I open visit page
			Then I should be seeing "visits#index" as the heading
		
		Scenario: view visits#new page
			When I follow the create visit path
			Then I should be seeing "New visit" as the heading
			
		Scenario: view visits#update page
			When I follow the update visit path
			Then I should be seeing "visits#update" as the heading
		
		Scenario: view visits#delete
			When I follow the delete visit path
			Then I should be seeing "visits#destry" as the heading
			
	
		Scenario: creating a vaccine
			When I follow the create vaccine path
			And I enter "Leukemia" in "name"		
			And I enter "1" in "animal_id"
			Then I should be seeing "Created new vaccine Leukemia."

		Scenario: view vaccine page
			When I open vaccine page
			Then I should be seeing "vaccines#index" as the heading
		
		Scenario: view vaccines#new page
			When I follow the create vaccine path
			Then I should be seeing "New vaccine" as the heading
			
		Scenario: view vaccines#update page
			When I follow the update vaccine path
			Then I should be seeing "vaccines#update" as the heading
		
		Scenario: view vaccines#delete
			When I follow the delete vaccine path
			Then I should be seeing "vaccines#destry" as the heading
	
	
			Scenario: creating a vaccination
			When I follow the create vaccination path
			And I enter "1" in "id"		
			Then I should be seeing "Created new vaccination 1."

		Scenario: view vaccination page
			When I open vaccination page
			Then I should be seeing "vaccinations#index" as the heading
		
		Scenario: view vaccinations#new page
			When I follow the create vaccination path
			Then I should be seeing "New vaccination" as the heading
			
		Scenario: view vaccinations#update page
			When I follow the update vaccination path
			Then I should be seeing "vaccinations#update" as the heading
		
		Scenario: view vaccinations#delete
			When I follow the delete vaccination path
			Then I should be seeing "vaccinations#destry" as the heading
	
