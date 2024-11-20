Feature: Validate SpaceX GraphQL API
  This feature tests the SpaceX GraphQL API for retrieving **dragons** details 
  It validates the response structure, field types, and data correctness.

  Background:
  # Base URL for SpaceX API
  * url 'https://spacex-production.up.railway.app/'

  Scenario: Validate dragons field response
    Given text query =
    """
      {
        dragons {
          id
          # Including comment...
          name
        }
      }
    """
    And request { query: '#(query)' }
    When method post
    Then status 200
    * match each response.data.dragons == 
    """
      {
        "id": "#regex [a-f0-9]+",
        "name": "#string"
      }
    """

  Scenario: Validate dragons query using operation type and name
    Given text query =
    """
      query DragonsAndDescription {
        dragons {
          name
          description
        }
      }
    """
    And request { query: '#(query)' }
    When method post
    Then status 200
    * match each response.data.dragons == 
    """
      {
        "name": "#string",
        "description": "#string"
      }
    """

  Scenario: Validate dragons response including object response
    # Sub-selection of thruster field object
    Given text query =
    """
      {
        dragons {
          id
          name
          thrusters {
            amount
          }
        }
      }
    """
    And request { query: '#(query)' }
    When method post
    Then status 200
    * match each response.data.dragons == 
    """
      {
        "id": "#regex [a-f0-9]+",
        "name": "#string",
        "thrusters": "#array"
      }
    """

  Scenario: 400 - Check validation error response
    # Using alias for a field that doesn't support
    Given text query =
    """
      {
          unmanned: Dragons(crew_capacity: 0) {
              name
          }
      }
    """
    And request { query: '#(query)' }
    When method post
    Then status 400
    * match each response.errors == 
    """
      {
        "message": "Cannot query field \"Dragons\" on type \"Query\". Did you mean \"dragon\" or \"dragons\"?",
        "locations": [
          {
            "line": 2,
            "column": 5
          }
        ],
        "extensions": {
          "code": "GRAPHQL_VALIDATION_FAILED"
        }
      }
    """