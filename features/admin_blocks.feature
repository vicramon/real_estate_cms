Feature: Admin blocks

  Scenario: Admin edits a block
    Given I am signed in as an admin
    And I have 1 page
    And I have 1 block
    When I follow "Pages"
    And I click to edit the first page
    And I make changes to my first block
    Then those changes to my block should be persisted

  Scenario: Admin adds a block
    Given I am signed in as an admin
    And I have 1 page
    When I follow "Pages"
    And I click to edit the first page
    And I follow "Add a Block"
    And I fill out the block form
    Then I should see that my block is persisted

  @javascript
  Scenario: Admin deletes a block
    Given I am signed in as an admin
    And I have 1 page
    And I have 1 block
    When I follow "Pages"
    And I click to edit the first page
    And I click to delete the block
    And I submit the form
    Then I should see that my block is deleted

  Scenario: Admin reorders blocks
    Given I am signed in as an admin
    And I have 1 page
    And I have 3 blocks
    When I follow "Pages"
    And I click to edit the first page
    And I follow "Reorder Blocks"
    And I reorder my blocks
    Then I should see that my blocks are reordered
