Feature: Admin manages pages

  Scenario: Admin views list of pages
    Given I am signed in as an admin
    And I have 2 pages
    When I follow "Pages"
    Then I should see those pages

  Scenario: Admin creates a page
    Given I am signed in as an admin
    When I follow "Pages"
    And I follow "Add a Page"
    And I fill in the page form
    Then I should see that my page is persisted

  Scenario: Admin edits a page
    Given I am signed in as an admin
    And I have 1 page
    When I follow "Pages"
    And I click to edit the first page
    And I fill in the page form
    Then I should see that my page is updated

  Scenario: Admin deletes a page
    Given I am signed in as an admin
    And I have 1 page
    When I follow "Pages"
    And I click to delete the first page
    Then I should see that my page is deleted
