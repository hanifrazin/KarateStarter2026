Feature: Verify user emails from JSONPlaceholder

  Scenario Outline: Verify user emails using <id> trials
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'users', <id>
    When method get
    Then status 200
    And match response.email == '<email>'

    # Print seluruh response
    * print '=== RESPONSE ===', response

    # Print response dengan pretty print (JSON)
    * karate.log('Response:', response)

    Examples:
      | id | email              |
      | 1  | Sincere@april.biz  |
      | 2  | Shanna@melissa.tv  |
      | 3  | Nathan@yesenia.net |

