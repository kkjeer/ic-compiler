echo -e "\x1B[33mRunning Lexer Tests!\e[0m"
. runLexerTests.bash . c
echo ""
## echo -e '\x1B[35mBeginning pass tests...\e[0m' 
echo -e "\x1B[33mRunning Parser Tests!\e[0m"
. runParserTests.bash . c
