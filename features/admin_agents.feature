Feature: Admin agents

  Scenario: Agent CRUD

    Given I am signed in as an admin
    And I have 1 agent
    When I follow "Agents"
    Then I should see my list of agents

    When I follow "Add an Agent"
    And I fill out the agent form
    Then I should see that my agent is added

    When I click to edit an agent
    And I make changes to that agent
    Then I should see that my agent is edited

    When I click to delete an agent
    Then I should see that my agent is deleted
