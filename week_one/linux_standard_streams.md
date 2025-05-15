# Understanding Standard Input, Output, and Error in Linux

In Linux and Unix-like operating systems, there are three fundamental I/O streams that form the backbone of command-line operations. These are known as "standard streams":

## The Three Standard Streams

| Stream | Name | File Descriptor | Default Connection | Purpose |
|--------|------|----------------|-------------------|---------|
| stdin  | Standard Input | 0 | Keyboard | Data fed into programs |
| stdout | Standard Output | 1 | Terminal | Normal program output |
| stderr | Standard Error | 2 | Terminal | Error messages |

## Standard Input (stdin)

Standard input is the stream from which a program reads its input data. By default, this comes from the keyboard when running commands in a terminal.

### Examples:

1. **Using keyboard input with `cat`**:
   ```bash
   cat
   # Type something and press Enter
   # The text is echoed back
   # Press Ctrl+D to end input
   ```

2. **Using a file as stdin with `<`**:
   ```bash
   sort < unsorted.txt
   ```

3. **Using a pipe to feed stdin**:
   ```bash
   echo "hello world" | grep "hello"
   ```

## Standard Output (stdout)

Standard output is where programs write their normal output. By default, this is displayed in the terminal.

### Examples:

1. **Basic command output**:
   ```bash
   ls -l
   # Lists files with details to the terminal
   ```

2. **Redirecting stdout to a file with `>`**:
   ```bash
   ls -l > file_list.txt
   # Output goes to file instead of terminal
   ```

3. **Appending stdout to a file with `>>`**:
   ```bash
   echo "New line" >> notes.txt
   # Adds text to the end of the file
   ```

## Standard Error (stderr)

Standard error is a separate output stream specifically for error messages and diagnostics. By default, it also displays in the terminal (mixed with stdout).

### Examples:

1. **Command producing an error**:
   ```bash
   ls /nonexistent_directory
   # Outputs error to terminal: "No such file or directory"
   ```

2. **Redirecting only stderr to a file with `2>`**:
   ```bash
   ls /nonexistent_directory 2> errors.log
   # Error messages go to errors.log file
   ```

3. **Redirecting stderr to stdout with `2>&1`**:
   ```bash
   ls /nonexistent_directory > output.log 2>&1
   # Both normal output and errors go to output.log
   ```

## Advanced Redirection Examples

1. **Redirect stdout to one file and stderr to another**:
   ```bash
   command > output.log 2> errors.log
   ```

2. **Discard stderr, keep stdout**:
   ```bash
   command 2>/dev/null
   ```

3. **Discard stdout, keep stderr**:
   ```bash
   command >/dev/null
   ```

4. **Discard both stdout and stderr**:
   ```bash
   command >/dev/null 2>&1
   ```

5. **Feed a file to stdin, save stdout to a file, and stderr to another file**:
   ```bash
   command < input.txt > output.log 2> errors.log
   ```

6. **Use stdout from one command as stdin for another (pipe)**:
   ```bash
   cat file.txt | grep "pattern" | sort
   ```

## Practical Use Cases

### Text Processing Pipeline
```bash
cat data.txt | grep "important" | sort | uniq > results.txt
```
This reads data.txt, filters lines containing "important", sorts them, removes duplicates, and saves to results.txt.

### Error Logging in Scripts
```bash
./backup_script.sh > backup.log 2> backup_errors.log
```
Normal output goes to backup.log, errors to backup_errors.log.

### Background Process with No Output
```bash
long_running_process >/dev/null 2>&1 &
```
Run process in background, discarding all output.

### Capturing Both stdout and stderr Together
```bash
command &> all_output.log
```
This is shorthand for `command > all_output.log 2>&1`

### Using Here Documents (Advanced stdin)
```bash
cat << EOF > config.ini
[settings]
mode=production
debug=false
EOF
```
Creates a file with the specified content without needing a separate source file.

## Understanding the Concepts

- Standard streams allow for flexible command composition through pipes and redirections
- They enable separating normal output from error messages
- The numbering (0, 1, 2) comes from the underlying file descriptors
- Nearly all Linux/Unix commands follow these conventions
