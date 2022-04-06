Feature: Rules

  Scenario Outline: Use of legal rules
    When I test "<rule>"
    Then the output should contain exactly:
      """
      test.md:<caretPosition>:RuleBase.<rule>:<message>
      """

    Examples:
      | rule                  | caretPosition | message                                                          |
      | AccordAndSatisfaction | 1:187         | Did the parties intend to agree to accord, novation, or release? |
      | ActionOrProceeding    | 1:8           | Avoid legal couplets                                             |
      | Actively              | 1:22          | Omit 'actively', if it precedes an action                        |
      | Actual                | 1:48          | Omit 'actual' in contracts                                       |
      | Actually              | 1:40          | Avoid disagreement in contracts                                  |
      | AffirmativeAction     | 1:10          | 'Affirmative' is redundant                                       |
      | AffirmativeCovenants  | 1:15          | Avoid archaic language                                           |
      | Affirmatively         | 1:13          | Omit 'affirmatively', if it precedes an action                   |