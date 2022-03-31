Feature: Rules

  Scenario: Use of 'accord and satisfaction'
    When I test "AccordAndSatisfaction"
    Then the output should contain exactly:
      """
      test.md:3:187:RuleBase.AccordAndSatisfaction:Did the parties intend to agree to accord, novation, or release?
      """