## Bash Scripting

Basic Syntax

# Variables

Variables in bash are defined using the syntax variable_name=value. To access the value of a variable, use the $ symbol before the variable name.
```
#!/bin/bash
greeting="Hello"
name="Tux"
echo $greeting $name
```

# Arithmetic Expressions

Bash supports basic arithmetic operations. Use the syntax var=$((expression)) for calculations.

```
#!/bin/bash
var=$((3+9))
echo $var
```
# User Input

You can read user input using the read command.

```
#!/bin/bash
read -p "Enter your age: " age
echo "You entered: $age"
```

# Conditional Statements

Bash supports if-else statements for decision making.

```
#!/bin/bash
read -p "Enter a number: " num
if [ $num -gt 10 ]; then
echo "Number is greater than 10"
else
echo "Number is 10 or less"
fi
```
# Loops

Bash supports for and while loops for iteration.

```
#!/bin/bash
for i in {1..5}; do
echo $i
done
```

# Functions

Functions in bash allow you to group commands and reuse them.

```
#!/bin/bash
myFunction() {
echo "Hello from function"
}
myFunction
```
