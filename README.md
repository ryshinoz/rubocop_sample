# rubocop_sample

- [rubocop](https://github.com/bbatsov/rubocop)のサンプル
- [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide)に従ってコーディングチェックしてくれる

## Style

- `Encoding` - 文字コードは`UTF-8`にする

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

    - 行数は変更可能
    - コメントを含めるか指定可能

    ```ruby
    source_code_layout/bad/method_length.rb:1:1: C: Method has too many lines. [11/10]
    def test
    ^^^
    ```

- `Tab` - インデントには空白を利用、`tab`を利用しない

    ```ruby
    source_code_layout/bad/tab.rb:2:1: C: Tab detected.
    	puts 'hello'
    ^^^^^^^^
    ```

- `TrailingWhitespace` - 行末に空白を利用しない

    ```ruby
    source_code_layout/bad/trailing_whitespace.rb:1:10: C: Trailing whitespace detected.
    puts 'cc'
             ^
    ```

- `CaseIndentation` - `when`と`case`は同じインデントにする

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
    
    - Hashリテラルの場合は`SpaceIndsideHashLiteralBraces`で空白指定ができる

    ```ruby
    source_code_layout/bad/surrounding_space.rb:3:16: C: Surrounding space missing for '{'.
    [1, 2, 3].each {|e| puts e }
                   ^
    ```

- `SpaceInsideParens` - 丸括弧（paren）の間には空白を入れない

    ```ruby
    source_code_layout/bad/surrounding_space.rb:7:3: C: Space inside parentheses detected.
    (1 ).lengh
      ^
    ```

- `SpaceInsideBrackets` - 角括弧（bracket）の間には空白を入れない

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

- `SpaceAfterControlKeyword` - `if`などの後に空白を入れる

    ```ruby
    source_code_layout/bad/space_after.rb:7:1: C: Use space after control keywords.
    if(aaa)
        ^^
    ```

- `HashSyntax` - ハッシュキーが`symbol`の場合、Ruby1.8.xの記述をしない

    ```ruby
    source_code_layout/bad/hash_syntax.rb:1:10: C: Ruby 1.8 hash syntax detected
    hash = { :one => 1 }
             ^^^^^^^
    ```

    - このようにする

    ```ruby
    hash = { one: 1 }
    ```

- `EndOfLine` - 改行コードは`LF`を利用、`CRLF`を利用しない

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

- `DefWithParentheses` - メソッドの引数には丸括弧を利用する

    ```ruby
    source_code_layout/bad/def_parentheses.rb:1:10: C: Use def with parentheses when there are arguments.
    def test aaa, bbb
             ^^^^^^^^
    ```

- `DefWithoutParentheses` - メソッドに引数がない場合は丸括弧を利用しない

    ```ruby
    source_code_layout/bad/def_parentheses.rb:4:10: C: Omit the parentheses in defs when the method doesn't accept any arguments.
    def test2()
             ^
    ```

- `IfWithSelmicolon` - `if x;`は利用しない、三項演算子を利用する

    ```ruby
    source_code_layout/bad/if_with_semicolon.rb:1:1: C: Never use if x; Use the ternary operator instead.
    if aaa > 0; puts 'true' end
    ```
    
- `MultilineIfThen` - `if`/`unless`が複数行になる場合は`then`を利用しない

    ```ruby
    source_code_layout/bad/multiline_if_then.rb:2:1: C: Never use then for multi-line if/unless.
    if aaa > 2 then
        ^^^
    ```

- `OneLineConditional` - `if`/`then`/`else`/`end`の場合、三項演算子を利用する

    ```ruby
    source_code_layout/bad/one_line_conditional.rb:1:10: C: Favor the ternary operator (?:) over if/then/else/end constructs.
    result = if aaa > 5 then puts 'over' else puts 'under' end
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ```

- `Blocks` - 1行ブロックでは`{...}`を利用する（好む）

    ```ruby
    source_code_layout/bad/blocks.rb:3:12: C: Prefer {...} over do...end for single-line blocks.
    names.each do |name| puts name end
               ^^
    ```

- `Blocks` - 複数行ブロックでは`{...}`を利用しない（避ける）

    ```ruby
    source_code_layout/bad/blocks.rb:5:12: C: Avoid using {...} for multi-line blocks.
    names.each { |name|
               ^
    ```

- `ParameterLists` - メソッドに6個以上引数を設定しない（避ける）

    - 最大数は指定可能
    - キーワード引数を含めるか指定可能

    ```ruby
    ource_code_layout/bad/parameter_lists.rb:1:10: C: Avoid parameter lists longer than 5 parameters.
    def test (aaa, bbb, ccc, ddd, eee, fff)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ```

- `StringLeterals` - 特別な理由がない限り、`string`（リテラル）はシングルクォートを利用する（好む）

    ```ruby
    source_code_layout/bad/string_literals.rb:1:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    aaa = "bbb"
          ^^^^^
    ```

- `MultilineTernaryOperator` - 複数行の三項演算子を複数行にしない（避ける）

    ```ruby
    source_code_layout/bad/ternary_operator.rb:3:1: C: Avoid multi-line ?: (the ternary operator); use if/unless instead.
    aaa > 15 ?
    ^^^^^^^^^^^
    ```


- `NestedTernaryOperator` - 三項演算子をネストしない（好む）

    ```ruby
    source_code_layout/bad/ternary_operator.rb:1:19: C: Ternary operators must not be nested. Prefer if/else constructs instead.
    some_condition ? (1 ?  'a' : 'b') : somthing_else
                      ^^^^^^^^^^^^^^
    ```

- `UnlessElse` - `else`付きの`unless`は利用しない

    ```ruby
    source_code_layout/bad/unless_else.rb:1:1: C: Never use unless with else. Rewrite these with the positive case first.
    unless success?
    ^^^
    ```

- `AndOr` - `and`には`&&`、`or`には`||`を利用する

    ``` ruby
    source_code_layout/bad/and_or.rb:4:8: C: Use && instead of and.
    if aaa and bbb
               ^^^
    source_code_layout/bad/and_or.rb:8:8: C: Use || instead of or.
    if aaa or bbb
               ^^
    ```

- `WhenThen` - `when x;`は利用しない、代わりに`when x then`を利用する

    ```ruby
    source_code_layout/bad/when_then.rb:3:7: C: Never use "when x;". Use "when x then" instead.
    when 1;
          ^
    ```

- `IfUnlessModifier` - `if`/`unless`のボディが1行の場合、かっこよくする

    ```ruby
    source_code_layout/bad/favor_modifer.rb:2:1: C: Favor modifier if/unless usage when you have a single-line body. Another good alternative is the usage of control flow &&/||.
    if aaa == 1
        ^^^
    ```

- `WhileUntilModifier` - `while`/`until`のボディが1行の場合、かっこよくする

    ```ruby
    source_code_layout/bad/favor_modifer.rb:6:1: C: Favor modifier while/until usage when you have a single-line body.
    while aaa > 1
        ^^^
    ```

- `FavorUnlessOverNegatedIf` - `if`で負の条件チェックする場合は`unless`を利用する

    ```ruby
    source_code_layout/bad/favor_unless_over_negated_if.rb:3:1: C: Favor unless (or control flow or) over if for negative conditions.
    puts 'message' if !bbb
    ^^^^^^^^^^^^^^^^^^^^^^
    ```

- `FavorUntilOverNeatedWhile` - `while`を負の条件でチェックする場合は`until`を利用する

    ```ruby
    source_code_layout/bad/favor_unless_over_negated_if.rb:5:1: C: Favor until over while for negative conditions.
    puts 'message' while !bbb
    ^^^^^^^^^^^^^^^^^^^^^^^^^
    ```

- `SpaceAroundEqualsInParameterDefault` - メソッドのデフォルト値の=前後には空白を入れる

    ```ruby
    source_code_layout/bad/surrounding_space.rb:9:13: C: Surrounding space missing in default value assignment.
    def test (a =1)
                ^
    ```

- `Lambda` - 1行ブロックの場合はlambdaリテラル`->`を利用する

    ```ruby
    source_code_layout/bad/lambda.rb:1:5: C: Use the new lambda literal syntax ->(params) {...}.
    l = lambda { |a, b| a + b }
        ^^^^^^
    ```

- `Lambda` - 複数行ブロックのlambdaはlambdaメソッド`lambda`を利用する

    ```ruby
    source_code_layout/bad/lambda.rb:3:5: C: Use the lambda method for multi-line lambdas.
    l = ->(a, b) do
        ^^
    ```

- `ParenthesesAroundCondition` - `if`/`unless`/`while`/`until`の条件に`()`を利用しない

    ```ruby
    source_code_layout/bad/parentheses_around_condition.rb:1:4: C: Don't use parentheses around the condition of an if/unless/while/until
    if (x > 10)
       ^^^^^^^^
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

- `AvoidFor` - `for`ではなく`each`を利用する（好む）

    ```ruby
    source_code_layout/bad/avoid_for.rb:1:1: C: Prefer *each* over *for*.
    for elem in arr do
        ^^^
    ```

- `AvoidPerlisms` - Perlスタイルのグローバル変数を利用しない（好む）

    ```ruby
    source_code_layout/bad/avoid_perlisms.rb:1:6: C: Prefer $PROGRAM_NAME over $0.
    puts $0
         ^^
    ```

- `Semicolon` - 式や文をわける時にセミコロン`;`を利用しない

    ```ruby
    source_code_layout/bad/semicolon.rb:2:11: C: Do not use semicolons to terminate expressions.
    pust 'foo'; puts 'bar'
              ^
    ```

- `FavorSprintf` - `String#%`を利用しない、`sprinf`を利用する

    ```ruby
    source_code_layout/bad/favor_sprintf.rb:3:12: C: Favor sprintf over String#%.
    "aaa = %s" % aaa
               ^
    ```

- `FavorJoin` - `Array#*`を利用しない、`Array#join`を利用する

    ```ruby
    source_code_layout/bad/favor_join.rb:1:11: C: Favor Array#join over Array#*.
    [1, 2, 3] * ','
              ^
    ```

- `Alias` - `alias`を利用しない、`alias_method`を利用する

    ```ruby
    source_code_layout/bad/alias.rb:6:3: C: Use alias_method instead of alias.
      alias message test2
        ^^^^^
    ```

- `Not` - `not`を利用しない、`!`を利用する

    ```ruby
    source_code_layout/bad/not.rb:1:6: C: Use ! instead of not.
    x = (not aaa)
         ^^^
    ```

- `AsciiComments` - コメントにAscii文字以外を利用しない

    ```ruby
    source_code_layout/bad/ascii_comments.rb:1:1: C: Use only ascii symbols in comments.
    # 日本語
    ^^^^^^^^^^^
    ```

- `BlockComments` - ブロックコメントを利用しない

    ```ruby
    source_code_layout/bad/block_comments.rb:1:1: C: Do not use block comments.
    =begin
    ```


- `EmptyLiteral` - `Array.new`を利用しない、`[]`リテラルを利用する

    ```ruby
    source_code_layout/bad/empty_literal.rb:1:7: C: Use array literal [] instead of Array.new.
    arr = Array.new
    ^^^^^^^^^
    ```

- `EmptyLiteral` - `Hash.new`を利用しない、`{}`リテラルを利用する

    ```ruby
    source_code_layout/bad/empty_literal.rb:2:8: C: Use hash literal {} instead of Hash.new.
    hash = Hash.new
           ^^^^^^^^
    ```

- `EmptyLiteral` - `String.new`を利用しない、`''`リテラルを利用する

    ```ruby
    source_code_layout/bad/empty_literal.rb:3:7: C: Use string literal '' instead of String.new.
    str = String.new
          ^^^^^^^^^^
    ```

- `OpMethod` - `+/-/[]/[]=/<<`を再定義する場合、引数名は`other`にする

    ```ruby
    source_code_layout/bad/op_method.rb:1:7: C: When defining the + operator, name its argument *other*.
    def +(other2)
          ^^^^^^
    ```

- `ReduceArguments` - `reduce`メソッドの変数名は`a`、`e`を利用する

    ```ruby
    source_code_layout/bad/reduce_arguments.rb:3:6: C: Name reduce arguments |a, e| (accumulator, element).
    puts numbers.reduce { |sum, n| sum + n }
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ```

- `SingleLineMethods` -1行関数は利用しない（避ける）

    ```ruby
    source_code_layout/bad/single_line_methods.rb:1:1: C: Avoid single-line method definitions.
    def too_much; puts 'a'; puts 'b'; end
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ```

- `WordArray` - 文字列の配列は`%w`、`%W`を利用する

    ```ruby
    source_code_layout/bad/word_array.rb:1:5: C: Use %w or %W for array of words.
    a = ['aaa', 'bbb', 'ccc']
        ^^^^^^^^^^^^^^^^^^^^^
    ```

- `SpaceIndsideHashLiteralBraces` - ハッシュの波括弧`{`と`}`の間に空白を入れる

    - 設定で逆にもできる

    ```ruby
    source_code_layout/bad/surrounding_space.rb:13:7: C: Space inside hash literal braces missing.
    bbb = {aaa: 'ccc'}
          ^
    ```

- `LineContinuation` - `\`を利用した継続した行を避ける

    ```ruby
    source_code_layout/bad/line_continuation.rb:1:14: C: Avoid the use of the line continuation character(\).
    result = 1 - \
                 ^
    ```

- `TrivialAccessors` - `setter`、`getter`を利用しない、`attr_reader`、`attr_writer`を利用する

    ```ruby
    source_code_layout/bad/trivial_accessors.rb:6:3: C: Use attr_reader to define trivial reader methods.
    def name
    ^^^
    source_code_layout/bad/trivial_accessors.rb:10:3: C: Use attr_writer to define trivial writer methods.
    def set_name (name)
    ^^^
    ```

- `LeadingCommentSpace` - コメント`#`の後に1文字空白を入れる

    ```ruby
    source_code_layout/bad/leading_comment_space.rb:1:1: C: Missing space after #.
    #test
    ^^^^^
    ```

- `ColonMethodCall` - `::`を使ってメソッドを呼び出さない 

    ```ruby
    source_code_layout/bad/colon_method_class.rb:7:10: C: Do not use :: for method calls.
    SomeClass::some_method
             ^^
    ```

- `AvoidGlobalVars` - 自前のグローバル変数を利用しない（避ける）

    ```ruby
    source_code_layout/bad/avoid_global_vars.rb:1:1: C: Do not introduce global variables.
    $TEST = 'a'
    ^^^^^
    ```


- `SymbolName` - symbol（リテラル）はスネークケースを利用する

    ```ruby
    source_code_layout/bad/symbol_name.rb:1:10: C: Use snake_case for symbols.
    hash = { :hashKey => 'aaa' }
             ^^^^^^^^
    ```

- `ConstantName` - 定数は全て大文字のスネークケースを利用する

    ```ruby
    source_code_layout/bad/constant_name.rb:2:3: C: Use SCREAMING_SNAKE_CASE for constants.
    StatusError = 1
    ^^^^^^^^^^^
    ```
- `AccessControl` - `public`、`private`の後は1行改行する、`public`、`private`はdefと同じ階層のインデントにする

    ```ruby
    source_code_layout/bad/access_control.rb:3:3: C: Keep a blank line before and after public.
      public
      ^^^^^^
    source_code_layout/bad/access_control.rb:8:1: C: Indent private as deep as method definitions.
    private
    ^^^^^^^
    ```

- `BlockNesting` - `if`、`case`などのネストは3回以上しない（避ける）

    - ネスト回数は指定可能

    ```ruby
    source_code_layout/bad/block_nesting.rb:5:9: C: Avoid more than 3 levels of block nesting.
            if ddd > 3
            ^^^
    ```

- `CaseEquality` - `===`を利用しない（避ける）

    ```ruby
    source_code_layout/bad/case_equality.rb:3:5: C: Avoid the use of the case equality operator(===).
    aaa === 100
        ^^^
    ```

- `Documentation` - トップレベルの`module`、`class`にはドキュメントを作成する

    ```ruby
    source_code_layout/bad/documentation.rb:1:1: C: Missing top-level module documentation comment.
    module SomeModule
    ^^^^^^
    ```

- `MethodCallParentheses` - 引数のないメソッドを呼ぶときは`()`を利用しない

    ```ruby
    source_code_layout/bad/method_call_parentheses.rb:5:12: C: Do not use parentheses for method calls with no arguments.
    test_method()
               ^
    ```

- `WhileUntilDo` - `while`が複数行になる場合は`do`は利用しない

    ```ruby
    source_code_layout/bad/while_until_do.rb:1:13: C: Never use `do` with multi-line `while`.
    while x > 5 do
                ^^
    ```

- `CharacterLiteral` - 文字リテラル`?`を利用しない

    ```ruby
    source_code_layout/bad/character_literal.rb:1:8: C: Do not use the character literal - use string literal instead.
    char = ?c
           ^^
    ```

- `BeginBlock` - `BEGIN`ブロックを利用しない（避ける）

    ```ruby
    source_code_layout/bad/begin_block.rb:1:1: C: Avoid the use of BEGIN blocks.
    BEGIN {
    ^^^^^
    ```

- `EndBlock` - `END`ブロックを利用しない（避ける）、`Kernel#at_exit`を利用する

    ```ruby
    source_code_layout/bad/end_block.rb:1:1: C: Avoid the use of END blocks. Use `Kernel#at_exit` instead.
    END {
    ^^^
    ```

- `DotPosition` - メソッドチェーン時に改行する時は`.`を呼び出すメソッドと一緒に記述する

    - `.`の場所は指定可能

    ```ruby
    source_code_layout/bad/dot_position.rb:7:4: C: Place the . on the next line, together with the method name.
    aaa.
       ^
    ```

- `Attr` - `attr`は利用しない、`attr_reader`を利用する

    ```ruby
    source_code_layout/bad/attr.rb:2:3: C: Do not use `attr`. Use `attr_reader` instead.
      attr :name
      ^^^^
    ```

- `SymbolArray` - symbolの配列は`%i`を利用する

    - Ruby2.0.0対象、Ruby1.9.xはチェックしない

    ```ruby
    source_code_layout/bad/symbol_array.rb:1:7: C: Use %i or %I for array of symbols.
    arr = [:a, :b, :c]
          ^^^^^^^^^^^^
    ```

- `RescueModifier` - `rescue`はキャッチする例外を指定して利用する

    ```ruby
    source_code_layout/bad/rescue_modifier.rb:1:1: C: Avoid using rescue in its modifier form.
    read_file rescue handle_error($!)
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ```

- `AsciiIdentifiers` - symbolにはascii文字以外を利用しない

    ```ruby
    source_code_layout/bad/ascii_identifiers.rb:1:1: C: Use only ascii symbols in identifiers.
    変数 = 'a'
    ^^^^^^
    ```

- `VariableInterpolation` - 文字列内で式展開する場合、`#{}`を利用する

    ```ruby
    source_code_layout/bad/variable_interpolation.rb:2:9: C: Replace interpolated var @aaa with expression #{@aaa}.
    bbb = "#@aaa"
            ^^^^
    ```

- `Proc` - `Proc.new`を利用しない、`proc`を利用する
    
    ```ruby
    source_code_layout/bad/proc.rb:1:5: C: Use proc instead of Proc.new.
    p = Proc.new { |n| puts n }
        ^^^^^^^^
    ```

- `ClassMethods` - クラスメソッドは`self`を利用する（好む）

    ```ruby
    source_code_layout/bad/class_method.rb:2:7: C: Prefer self over class/module for class/module methods.
    def Test.test_method
        ^^^^
    ```

- `CollectionMethos` - `map`/`reduce`/`find`/`select`を利用する（好む）

    - PreferrredMethodsを指定しないとだめ

    ```ruby
    source_code_layout/bad/collection_methods.rb:2:3: C: Prefer map over collect.
    a.collect { |x| x * 10 }
      ^^^^^^^
    source_code_layout/bad/collection_methods.rb:4:3: C: Prefer reduce over inject.
    a.inject{ |sum, n| sum + n }
      ^^^^^^
    source_code_layout/bad/collection_methods.rb:6:3: C: Prefer find over detect.
    a.detect { |item| item > 3 }
      ^^^^^^
    source_code_layout/bad/collection_methods.rb:8:3: C: Prefer select over find_all.
    a.find_all { |item| item > 3 }
      ^^^^^^^^
    ```

- `AvoidClassVars` - クラス変数を利用しない、インスタンス変数を利用する

    ```ruby
    source_code_layout/bad/avoid_class_vars.rb:2:3: C: Replace class var @@aaa with a class instance var.
    @@aaa = 1
    ^^^^^
    ```

- `RegexpLiteral` - `%r`を利用する時はバックスラッシュ`/`が2個以上ある場合だけ利用する

    ```ruby
    source_code_layout/bad/regexp_literal.rb:1:1: C: Use %r only for regular expressions matching more than 1 '/' character.
    %r(\s+)
    ^^^^^^^
    ```

- `AvoidPerlBackrefs` - 正規表現でperlスタイルな`$1`などは利用しない

    ```ruby
    source_code_layout/bad/avoid_perl_backrefs.rb:3:6: C: Prefer the use of MatchData over $1.
    puts $1
         ^^
    ```

## Lint

- `EnsureReturn` - `ensure`ブロック内でreturnはしない

    ```ruby
    source_code_layout/bad/ensure_return.rb:5:5: W: Never return from an ensure block.
        return 'uooo'
        ^^^^^^^^^^^^^
    ```

- `HandleExceptions` - `resuce`で何もしないのはだめ

    ```ruby
    source_code_layout/bad/handle_exceptions.rb:3:1: W: Do not suppress exceptions.
    rescue SomeError
    ^^^^^^^^^^^^^^^^
    ```

- `AssignmentInCondition` - `if`/`while`/`until`での条件句hkに`=`を利用しない

    ```ruby
    source_code_layout/bad/assignment_in_condition.rb:3:6: W: Assignment in condition - you probably meant to use ==.
    if v = array.grep(/foo/)
         ^
    ```

- `EndAlignment` - `end`を正しくインデントする

    ```ruby
    source_code_layout/bad/end_alignment.rb:2:17: W: end at 2, 16 is not aligned with if at 1, 11
                    end
                    ^^^
    source_code_layout/bad/end_alignment.rb:6:12: W: end at 6, 11 is not aligned with variable = lambda do |i| at 4, 0
               end
               ^^^
    ```

- `Void` - 宣言だけして使わない変数や意味のない計算などしない
    
    ```ruby
    source_code_layout/bad/void.rb:3:3: W: Operator * used in void context.
    a * 5
      ^
    source_code_layout/bad/void.rb:4:1: W: Literal 'aaaa' used in void context
    'aaaa'
    ^^^^^^
    source_code_layout/bad/void.rb:7:3: W: Variable SOME_VAR used in void context.
    SOME_VAR
    ^^^^^^^^
    ```

- `UnreachlableCode` - 到達しないコードを作らない

    ```ruby
    source_code_layout/bad/unreachable_code.rb:3:3: W: Unreachable code detected.
      puts 'hello'
      ^^^^^^^^^^^^
    ```

- `UnusedLocalVariable` - 利用しないローカル変数を作らない

    ```ruby
    source_code_layout/bad/unused_local_variable.rb:2:3: W: Assigned but unused variable - b
      b = 1
      ^^^^^
    ```

- `ShadowingOuterLocalVariable` - ブロック内と外で同じローカル変数を利用しない

    ```ruby
    source_code_layout/bad/shadowing_outer_local_variable.rb:2:12: W: Shadowing outer local variable - x
    5.times { |x| puts x }
    ```

- `EndInMethod` - メソッド内で`END`を利用しない、`at_exit`を利用する

    ```ruby
    source_code_layout/bad/end_in_method.rb:2:3: W: END found in method definition. Use `at_exit` instead.
      END {
      ^^^
    ```

- `LiteralInCondition` - 条件にリテラルを利用しない

    ```ruby
    source_code_layout/bad/literal_in_condition.rb:1:5: W: Literal true appeared in a condition.
    if (true)
        ^^^^
    ```

- `Eval` - `eval`を利用しない

    ```ruby
    source_code_layout/bad/eval.rb:1:1: W: The use of eval is a serious security risk.
    eval '3 + 4'
    ^^^^
    ```

- `RescueException` - `resuce`で`Exception`をキャッチしない

    - exitとか処理できない

    ```ruby
    source_code_layout/bad/rescue_exception.rb:3:1: W: Avoid rescuing the Exception class.
    rescue Exception
    ^^^^^^^^^^^^^
    ```

- `Loop` - `begin`/`end`/`until`、`begin`/`end`/`while`を利用しない、`Kernel#loop`を利用する

    ```ruby
    source_code_layout/bad/loop.rb:4:5: W: Use Kernel#loop with break rather than begin/end/until(or while).
    end while val < 0
        ^^^^^
    ```

## Rails

- `Validation` - `validates_acceptance_of`など古いvalidationメソッドを利用しない
