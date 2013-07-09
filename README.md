# [rubocop](https://github.com/bbatsov/rubocop)

- [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide)に従ってコーディングチェックしてくれる

## Style

- `Encoding` - 文字コードはUTF-8にする

    - 実際の文字コードをチェックしているわけではなく、1行目の`# coding: utf-8`を確認
    - Ruby1.9.x対象、Ruby2.0.0以降はチェックしない

    ```ruby
    source_code_layout/bad/utf8.rb:1:1: C: Missing utf-8 encoding comment.
    # coding: euc-jp
    ^
    ```

- `LingLength` - 1行に80文字以内にする

    - 文字数は変更可能

    ```ruby
    source_code_layout/bad/line_length.rb:1:80: C: Line is too long. [81/79]
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa = 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
                                                                                   ^^
    ```

- `MethodLength` - メソッドは10行以内にする

    - 行数は指定可能

    ```ruby
    source_code_layout/bad/method_length.rb:1:1: C: Method has too many lines. [11/10]
    def test
    ^^^
    ```

- `Tab` - インデントにはspaceを利用、tabを利用しない

    ```ruby
    source_code_layout/bad/tab.rb:2:1: C: Tab detected.
    	puts 'hello'
    ^^^^^^^^
    ```

- `TrailingWhitespace` - 行末にspaceを利用しない

    ```ruby
    source_code_layout/bad/trailing_whitespace.rb:1:10: C: Trailing whitespace detected.
    puts 'cc'
             ^
    ```

- `CaseIndentation` - whenとcaseは同じインデントにする

    ```ruby
    source_code_layout/bad/case_indentation.rb:3:3: C: Indent when as deep as case.
      when 1
        ^^^^
    ```

- `EmptyLineBetweenDefs` - メソッドとメソッドの間に空白行あける

    ```ruby
    source_code_layout/bad/empty_line_between_defs.rb:4:1: C: Use empty lines between defs.
    def test2
    ^^^
    ```

- `EmptyLines` - 2行以上空白行をあけない

    ```ruby
    source_code_layout/bad/empty_lines.rb:5:1: C: Extra blank line detected.
    ```

- `SpaceAroundOperatos` - オペレーターの前後には空白をいれる

    ```
    source_code_layout/bad/surrounding_space.rb:1:3: C: Surrounding space missing for operator '='.
    a =2
      ^
    ```

- `SpaceAroundBraces` - 波括弧（brace）の前後には空白を入れる

    ```ruby
    source_code_layout/bad/surrounding_space.rb:3:14: C: Space inside hash literal braces missing.
    aaa = { aaa: 'bbb'}
                 ^^^^^
    ```

- `SpaceInsideParens` - 丸括弧（paren）の後には空白を入れない

    ```ruby
    source_code_layout/bad/surrounding_space.rb:7:3: C: Space inside parentheses detected.
    (1 ).lengh
      ^
    ```

- `SpaceInsideBrackets` - 角括弧（bracket）の後には空白を入れない

    ```ruby
    source_code_layout/bad/surrounding_space.rb:5:2: C: Space inside square brackets detected.
    [ 1, 2, 3].length
     ^
    ```

- `SpaceAfterConma` - カンマの後に空白を入れる

    ```ruby
    source_code_layout/bad/space_after.rb:1:2: C: Space missing after comma.
    a,b = 1, 2
     ^
    ```

- `SpaceAfterSemicolon` - セミコロンの後に空白を入れる

    ```ruby
    source_code_layout/bad/space_after.rb:5:21: C: Space missing after semicolon.
    1 > 2 ? true : false;puts 'Hi'
                        ^
    ```

- `SpaceAfterColon` - コロンの後に空白を入れる

    ```ruby
    source_code_layout/bad/space_after.rb:3:13: C: Space missing after colon.
    1 > 2 ? true:false
                ^
    ```

- `SpaceAfterControlKeyword` - ifなどの後に空白を入れる

    ```ruby
    source_code_layout/bad/space_after.rb:7:1: C: Use space after control keywords.
    if(aaa)
        ^^
    ```

- HashSyntax // TODO

- `EndOfLine` - 改行コードはLFを利用、CRLFを利用しない

    ```ruby
    source_code_layout/bad/end_of_line.rb:1:11: C: Carriage return character detected.
    puts 'aaa'
              ^
    ```

- `NumericLiterals ` - 6桁を超える数値（リテラル）を扱う場合、アンダースコアを利用する

    ```ruby
    source_code_layout/a.rb:1:6: C: Add underscores to large numeric literals to improve their readability.
    puts 100000
         ^^^^^^
    ```

- Align the parameters of a method call if they span more than one line. // TODO

- `DefWithParentheses` - defの引数には丸括弧を利用する

    ```ruby
    source_code_layout/bad/def_parentheses.rb:1:10: C: Use def with parentheses when there are arguments.
    def test aaa, bbb
             ^^^^^^^^
    ```

- `DefWithoutParentheses` - defに引数がない場合は丸括弧を利用しない

    ```ruby
    source_code_layout/bad/def_parentheses.rb:4:10: C: Omit the parentheses in defs when the method doesn't accept any arguments.
    def test2()
             ^
    ```

- `IfWithSelmicolon` - if x;の場合は三項演算子を利用する // TODO

    ```ruby
    source_code_layout/bad/if_with_semicolon.rb:1:1: C: Never use if x; Use the ternary operator instead.
    if aaa > 0; puts 'true' end
    ```
    
- `MultilineIfThen` - if/unlessが複数行になる場合はthenを利用しない

    ```ruby
    source_code_layout/bad/multiline_if_then.rb:2:1: C: Never use then for multi-line if/unless.
    if aaa > 2 then
        ^^^
    ```

- `OneLineConditional` - if/then/else/endの場合、三項演算子を利用する // TODO

    ```ruby
    source_code_layout/bad/one_line_conditional.rb:1:10: C: Favor the ternary operator (?:) over if/then/else/end constructs.
    result = if aaa > 5 then puts 'over' else puts 'under' end
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ```

- `Blocks` - 1行ブロックでは{...}を利用する

    ```ruby
    source_code_layout/bad/blocks.rb:3:12: C: Prefer {...} over do...end for single-line blocks.
    names.each do |name| puts name end
               ^^
    ```

- `Blocks` - 複数行ブロックでは{...}を利用しない（避ける）

    ```ruby
    source_code_layout/bad/blocks.rb:5:12: C: Avoid using {...} for multi-line blocks.
    names.each { |name|
               ^
    ```

- `ParameterLists` - メソッドに6個以上引数を設定しない（避ける）

    - 最大数は設定可能

    ```ruby
    ource_code_layout/bad/parameter_lists.rb:1:10: C: Avoid parameter lists longer than 5 parameters.
    def test (aaa, bbb, ccc, ddd, eee, fff)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ```

- `StringLeterals` - 特別な理由がない限り、string（リテラル）はシングルクォートを利用する

    ```ruby
    source_code_layout/bad/string_literals.rb:1:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    aaa = "bbb"
          ^^^^^
    ```

- `MultilineTernaryOperator` - 三項演算子を複数行にしない（避ける）

    ```ruby
    source_code_layout/bad/ternary_operator.rb:3:1: C: Avoid multi-line ?: (the ternary operator); use if/unless instead.
    aaa > 15 ?
    ^^^^^^^^^^^
    ```


- `NestedTernaryOperator` - 三項演算子をネストしない

    ```ruby
    source_code_layout/bad/ternary_operator.rb:1:19: C: Ternary operators must not be nested. Prefer if/else constructs instead.
    some_condition ? (1 ?  'a' : 'b') : somthing_else
                      ^^^^^^^^^^^^^^
    ```

- `UnlessElse` - else付きのunlessは利用しない

    ```ruby
    source_code_layout/bad/unless_else.rb:1:1: C: Never use unless with else. Rewrite these with the positive case first.
    unless success?
    ^^^
    ```

- `AndOr` - andには&&、orには||を利用する

    ``` ruby
    source_code_layout/bad/and_or.rb:4:8: C: Use && instead of and.
    if aaa and bbb
               ^^^
    source_code_layout/bad/and_or.rb:8:8: C: Use || instead of or.
    if aaa or bbb
               ^^
    ```

- `WhenThen` - when x;は利用しない、代わりにwhen x thenを利用する

    ```ruby
    source_code_layout/bad/when_then.rb:3:7: C: Never use "when x;". Use "when x then" instead.
    when 1;
          ^
    ```

- `IfUnlessModifier` - if/unlessのボディが1行の場合、かっこよくする

    ```ruby
    source_code_layout/bad/favor_modifer.rb:2:1: C: Favor modifier if/unless usage when you have a single-line body. Another good alternative is the usage of control flow &&/||.
    if aaa == 1
        ^^^
    ```

- `WhileUntilModifier` - while/untilのボディが1行の場合、かっこよくする

    ```ruby
    source_code_layout/bad/favor_modifer.rb:6:1: C: Favor modifier while/until usage when you have a single-line body.
    while aaa > 1
        ^^^
    ```

- `FavorUnlessOverNegatedIf` - ifで負の条件チェックする場合はunlessを利用する

    ```ruby
    source_code_layout/bad/favor_unless_over_negated_if.rb:3:1: C: Favor unless (or control flow or) over if for negative conditions.
    puts 'message' if !bbb
    ^^^^^^^^^^^^^^^^^^^^^^
    ```

- `FavorUntilOverNeatedWhile` - whileを負の条件でチェックする場合はuntilを利用する

    ```ruby
    source_code_layout/bad/favor_unless_over_negated_if.rb:5:1: C: Favor until over while for negative conditions.
    puts 'message' while !bbb
    ^^^^^^^^^^^^^^^^^^^^^^^^^
    ```

- `SpaceAroundEqualsInParameterDefault` - メソッドのデフォルト値の=前後にはspaceを入れる

    ```ruby
    source_code_layout/bad/surrounding_space.rb:9:13: C: Surrounding space missing in default value assignment.
    def test (a =1)
                ^
    ```

- `Lambda` - 1行ブロックの場合はlambdaリテラル（->）を利用する

    ```ruby
    source_code_layout/bad/lambda.rb:1:5: C: Use the new lambda literal syntax ->(params) {...}.
    l = lambda { |a, b| a + b }
        ^^^^^^
    ```

- `Lambda` - 複数行ブロックのlambdaはlambdaメソッド（lambda）を利用する

    ```ruby
    source_code_layout/bad/lambda.rb:3:5: C: Use the lambda method for multi-line lambdas.
    l = ->(a, b) do
        ^^
    ```

- `Proc` - 
    
    ```ruby
    source_code_layout/bad/proc.rb:1:5: C: Use proc instead of Proc.new.
    p = Proc.new { |n| puts n }
        ^^^^^^^^
    ```

- `ParenthesesAroundCondition` - if/unless/whileの条件に()を利用しない

    ```ruby
    ParenthesesAroundCondition
    ```

- `MethodAndVariableSnakeCase` - 変数をメソッド名はスネークケースを利用する

    ```ruby
    source_code_layout/bad/method_and_variable_snake_case.rb:1:1: C: Use snake_case for methods and variables.
    isEngineer = false
    ^^^^^^^^^^^^^^^^^^
    source_code_layout/bad/method_and_variable_snake_case.rb:3:1: C: Use snake_case for methods and variables.
    def isEngineer
    ^^^
    ```

- `ClassAndModuleCamelCase` - クラス、モジュール名はキャメルケースを利用する

    ```ruby
    source_code_layout/bad/class_and_module_camel_case.rb:1:7: C: Use CamelCase for classes and modules.
    class Some_Class
          ^^^^^^^^^^
    ```

- `CollectionMethos` - // TODO
- `AvoidFor` - forではなくeachを利用する

    ```ruby
    source_code_layout/bad/avoid_for.rb:1:1: C: Prefer *each* over *for*.
    for elem in arr do
        ^^^
    ```

- `AvoidPerlisms` - Perlスタイルのグローバル変数を利用しない

    ```ruby
    source_code_layout/bad/avoid_perlisms.rb:1:6: C: Prefer $PROGRAM_NAME over $0.
    puts $0
         ^^
    ```

- `AvoidPerlBackrefs` - Perlスタイルの正規表現を使わない

- 式や文をわける時にセミコロン「;」を利用しない

    ```ruby
    source_code_layout/bad/semicolon.rb:2:11: C: Do not use semicolons to terminate expressions.
    pust 'foo'; puts 'bar'
              ^
    ```



- Prefer a single-line format for class difinitions with no body.

- 1行関数は避ける

    ```ruby
    source_code_layout/bad/single_line_methods.rb:1:1: C: Avoid single-line method definitions.
    def too_much; puts 'a'; puts 'b'; end
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ```
