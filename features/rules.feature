Feature: Rules

  Scenario: Use of 'accord and satisfaction'
    When I test "AccordAndSatisfaction"
    Then the output should contain exactly:
      """
      test.md:3:187:RuleBase.AccordAndSatisfaction:Did the parties intend to agree to accord, novation, or release?
      """

  Scenario: Use of 'action or proceeding'
    When I test "ActionOrProceeding"
    Then the output should contain exactly:
      """
      test.md:3:8:RuleBase.ActionOrProceeding:Avoid legal couplets
      """

  Scenario: Use of 'actively'
    When I test "Actively"
    Then the output should contain exactly:
      """
      test.md:3:22:RuleBase.Actively:Omit 'actively', if it precedes an action
      """

  Scenario: Use of 'actual'
    When I test "Actual"
    Then the output should contain exactly:
      """
      test.md:3:48:RuleBase.Actual:Omit 'actual' in contracts
      """

  Scenario: Use of 'actually'
    When I test "Actually"
    Then the output should contain exactly:
      """
      test.md:1:3:RuleBase.Actually:Avoid disagreement in contracts
      test.md:3:40:RuleBase.Actually:Avoid disagreement in contracts
      """

  Scenario: Use of 'affirmative action'
    When I test "AffirmativeAction"
    Then the output should contain exactly:
      """
      test.md:3:10:RuleBase.AffirmativeAction:'Affirmative' is redundant
      """

  Scenario: Use of 'affirmative covenants'
    When I test "AffirmativeCovenants"
    Then the output should contain exactly:
      """
      test.md:3:15:RuleBase.AffirmativeCovenants:Avoid archaic language
      test.md:4:15:RuleBase.AffirmativeCovenants:Avoid archaic language
      """

  Scenario: Use of 'affirmatively'
    When I test "Affirmatively"
    Then the output should contain exactly:
      """
      test.md:3:13:RuleBase.Affirmatively:Omit 'affirmatively', if it precedes an action
      """