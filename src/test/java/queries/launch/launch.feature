Feature: Validate SpaceX GraphQL API
  This feature tests the SpaceX GraphQL API for retrieving past **launch**. 
  It validates the response structure, field types, and data correctness.

  Background:
  # Base URL for SpaceX API
  * url 'https://spacex-production.up.railway.app/'

  # Import the custom JavaScript time validator
  * def isValidTime = read('file:src/test/resources/lib/time-validator.js')

  Scenario Outline: Validate past launch GraphQL response
    # Data-Driven
    Given text query =
    """
      query ($id: ID!){
        launch(id: $id) {
          id
          mission_name
          rocket {
            rocket_name
          }
        }
      }
    """
    And def variables =
    """
    {
      "id": "<id>"
    }
    """
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    * match response ==
    """
    {
      "data": {
        "launch": {
          "id": "<id>",
          "mission_name": "#string",
          "rocket": { "rocket_name": "#string" }
        }
      }
    }
    """
    
    Examples:
      | id                        |
      | 5eb87cd9ffd86e000604b32a  |
      | 5eb87d14ffd86e000604b361  |
      | 6243ae24af52800c6e919258  |
      | 62a9f89a20413d2695d8871a  |
      | 62dd70d5202306255024d139  |

  Scenario: Validate past launches GraphQL response for negative scenario
    # Invalid ID
    Given text query =
    """
      query ($id: ID!){
        launch(id: $id) {
          id
          mission_name
        }
      }
    """
    And def variables =
    """
    {
      "id": 123456
    }
    """
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    * match response == 
    """
      {
        "errors": [
          {
            "message": "invalid json response body at https://api.spacexdata.com/v5/launches/123456 reason: Unexpected token 'N', \"Not Found\" is not valid JSON",
            "locations": [{ "line": 2, "column": 3 }],
            "path": ["launch"],
            "extensions": { "code": "INTERNAL_SERVER_ERROR" }
          }
        ],
        "data": { "launch": null }
      }      
    """
