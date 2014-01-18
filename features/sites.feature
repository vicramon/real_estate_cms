Feature: Site management

  Scenario: Super admin creates site
    Given I am signed in as a super admin
    When I click to create a new site
    And I fill in and submit the site form
    Then I should see my newly created site

  Scenario: Super admin edits site
    Given I am signed in as a super admin
    And there is a site
    When I go to edit that site
    And I fill in and submit the site form
    Then I should see that my changes are saved

  Scenario: Super admin views sites
    Given there are 2 sites
    And I am signed in as a super admin
    When I follow "View Sites"
    Then I should see those sites
