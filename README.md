# [rubocop](https://github.com/bbatsov/rubocop)

- [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide)に従ってコーディングチェックしてくれる

## Style

### `Encoding` - 文字コードはUTF-8にする

- 実際の文字コードをチェックしているわけではなく、1行目の`# coding: utf-8`を確認
- Ruby1.9.x対象、Ruby2.0.0以降はチェックしない

```ruby
source_code_layout/bad/utf8.rb:1:1: C: Missing utf-8 encoding comment.
# coding: euc-jp
^
```

### `LingLength` - 1行に80文字までにする

- 文字数は変更可能

```ruby
source_code_layout/bad/line_length.rb:1:80: C: Line is too long. [81/79]
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa = 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
                                                                               ^^
```

### `MethoLength` - // TODO

### `Tab` - インデントにはspaceを利用、tabを利用しない

```ruby
source_code_layout/bad/tab.rb:2:1: C: Tab detected.
	puts 'hello'
^^^^^^^^
```

### `TrailingWhitespace` - 行末にspaceを利用しない

```ruby
source_code_layout/bad/trailing_whitespace.rb:1:10: C: Trailing whitespace detected.
puts 'cc'
         ^
```

### whenとcaseは同じインデントにする

```ruby
source_code_layout/bad/case_indentation.rb:3:3: C: Indent when as deep as case.
  when 1
    ^^^^
```

### メソッドとメソッドの間に空白行あける

```ruby
source_code_layout/bad/empty_line_between_defs.rb:4:1: C: Use empty lines between defs.
def test2
^^^
```

### 2行以上空白行をあけない

```ruby
source_code_layout/bad/empty_lines.rb:5:1: C: Extra blank line detected.
```

### オペレーターの前後には空白をいれる

```
source_code_layout/bad/surrounding_space.rb:1:3: C: Surrounding space missing for operator '='.
a =2
  ^
```

### 波括弧（brace）の前後には空白を入れる

```ruby
source_code_layout/bad/surrounding_space.rb:3:14: C: Space inside hash literal braces missing.
aaa = { aaa: 'bbb'}
             ^^^^^
```

### 丸括弧（paren）の後には空白を入れない

```ruby
source_code_layout/bad/surrounding_space.rb:7:3: C: Space inside parentheses detected.
(1 ).lengh
  ^
```

### 角括弧（bracket）の後には空白を入れない

```ruby
source_code_layout/bad/surrounding_space.rb:5:2: C: Space inside square brackets detected.
[ 1, 2, 3].length
 ^
```

### カンマの後に空白を入れる

```ruby
source_code_layout/bad/space_after.rb:1:2: C: Space missing after comma.
a,b = 1, 2
 ^
```

### セミコロンの後に空白を入れる

```ruby
source_code_layout/bad/space_after.rb:5:21: C: Space missing after semicolon.
1 > 2 ? true : false;puts 'Hi'
                    ^
```

### コロンの後に空白を入れる

```ruby
source_code_layout/bad/space_after.rb:3:13: C: Space missing after colon.
1 > 2 ? true:false
            ^
```

### ifなどの後に空白を入れる

```ruby
source_code_layout/bad/space_after.rb:7:1: C: Use space after control keywords.
if(aaa)
    ^^
```

### HashSyntax

### 改行コードはLFを利用、CRLFを利用しない

```ruby
source_code_layout/bad/end_of_line.rb:1:11: C: Carriage return character detected.
puts 'aaa'
          ^
```

### 6桁を超える数値（リテラル）を扱う場合、アンダースコアを利用する

```ruby
source_code_layout/a.rb:1:6: C: Add underscores to large numeric literals to improve their readability.
puts 100000
     ^^^^^^
```

### # Align the parameters of a method call if they span more than one line.

### defの引数には丸括弧を利用する

```ruby
source_code_layout/bad/def_parentheses.rb:1:10: C: Use def with parentheses when there are arguments.
def test aaa, bbb
         ^^^^^^^^
```

### defに引数がない場合は丸括弧を利用しない

```ruby
source_code_layout/bad/def_parentheses.rb:4:10: C: Omit the parentheses in defs when the method doesn't accept any arguments.
def test2()
         ^
```

### if x;の場合は三項演算子を利用する // TODO

```ruby
source_code_layout/bad/if_with_semicolon.rb:1:1: C: Never use if x; Use the ternary operator instead.
if aaa > 0; puts 'true' end
```

### if/unlessが複数行になる場合はthenを利用しない

```ruby
source_code_layout/bad/multiline_if_then.rb:2:1: C: Never use then for multi-line if/unless.
if aaa > 2 then
    ^^^
```

### if/then/else/endの場合、三項演算子を利用する // TODO

```ruby
source_code_layout/bad/one_line_conditional.rb:1:10: C: Favor the ternary operator (?:) over if/then/else/end constructs.
result = if aaa > 5 then puts 'over' else puts 'under' end
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

### 1行ブロックでは{...}を利用する

```ruby
source_code_layout/bad/blocks.rb:3:12: C: Prefer {...} over do...end for single-line blocks.
names.each do |name| puts name end
           ^^
```

### 複数行ブロックでは{...}を利用しない

```ruby
source_code_layout/bad/blocks.rb:5:12: C: Avoid using {...} for multi-line blocks.
names.each { |name|
           ^
```

### メソッドに6個以上引数を設定しない

- 最大数は設定可能

```ruby
ource_code_layout/bad/parameter_lists.rb:1:10: C: Avoid parameter lists longer than 5 parameters.
def test (aaa, bbb, ccc, ddd, eee, fff)
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

### 特別な理由がない限り、string（リテラル）はシングルクォートを利用する

```ruby
source_code_layout/bad/string_literals.rb:1:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
aaa = "bbb"
      ^^^^^
```

### 式や文をわける時にセミコロン「;」を利用しない

```ruby
source_code_layout/bad/semicolon.rb:2:11: C: Do not use semicolons to terminate expressions.
pust 'foo'; puts 'bar'
          ^
```

### Prefer a single-line format for class difinitions with no body.

### 1行関数は避ける

```ruby
source_code_layout/bad/single_line_methods.rb:1:1: C: Avoid single-line method definitions.
def too_much; puts 'a'; puts 'b'; end
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
