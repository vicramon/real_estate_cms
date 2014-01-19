Feature: Super admin user management

  Scenario: Super admin creates a site admin
    Given 1 site
    And I am signed in as a super admin
    When I follow "Users"
    And I follow "Create New User"
    And I fill out the user form
    Then I should see my newly created user

  Scenario: Super admin edits user
    Given I am signed in as a super admin
    And 1 site
    When I follow "Users"
    And I follow "Joe Cool"
    And I fill out the user form
    Then the changes to that user should be saved

  Scenario: Super admin views users
    Given there are 2 users
    And I am signed in as a super admin
    When I follow "Users"
    Then I should see those users

  Scenario: Super admin deletes a user
    Given there are 2 users
    And I am signed in as a super admin
    When I follow "Users"
    And I click to delete the first user
    Then that user should be deleted
