package main

import (
	"bufio"
	"os/exec"
	"regexp"
	"strings"
)

func Exec(command string) string {
	out, _ := exec.Command("bash", "-c", command).Output()
	return string(out)
}

func startsBlanck(s string) (out bool) {
	if len(s) > 0 {
		return s[0] == byte('\t')
	}
	return false
}

func clearFirsChar(lines []string) (out []string) {
	for _, line := range lines {
		if len(line) > 0 {
			out = append(out, line[1:])
		}
	}
	return out
}

func isKey(lines []string, p int) (out bool) {
	if p >= len(lines)-1 {
		return false
	}
	if !startsBlanck(lines[p]) && startsBlanck(lines[p+1]) {
		return true
	}
	return out
}

func parse(lines []string) (out string) {
	// recursive parser

	// the key-value pair of each line could be separated by ": " or " = "
	// the keys might terminate in ":" so it's has less priority
	re := regexp.MustCompile(": | = |:")

	for i, line := range lines {
		keyValue := re.Split(line, 2)
		key := strings.ReplaceAll(keyValue[0], "\"", "")

		if isKey(lines, i) {
			// when a new key is founded we need to get the corresponding lines
			// that will compose its sub-section
			var scope []string

			// iterate the indented lines following the key
			// this lines are the scope of 'key'
			j := i + 1
			for len(lines) > j && startsBlanck(lines[j]) {
				scope = append(scope, lines[j])
				j++
			}

			// add the key inside quotes to output
			out += "\"" + key + "\" : "

			// remove the first indentation level from the scope lines
			scope = clearFirsChar(scope)

			// add the parsed scope as the body of the 'key'
			out += "{\n " + parse(scope) + " }"

			// add next object comma if the next line is no longer inside
			// the scope of 'key', that's true if the next line has less indentation
			if len(lines) > j && !startsBlanck(lines[j]) {
				out += ","
			}
			out += "\n"
		}
		if !isKey(lines, i) && !startsBlanck(line) && len(line) > 0 {
			// some lines have quotes, we want to add quotes to all
			// key-value pairs so we first remove the existing quotes
			// and add them to all key-value pairs
			value := strings.ReplaceAll(keyValue[1], "\"", "")
			out += "\"" + key + "\" : " + "\"" + value + "\""

			// add next object comma only if the next line is inside the
			// current scope
			if i+1 < len(lines) && !startsBlanck(lines[i+1]) {
				out += ","
			}
			out += "\n"
		}

	}
	return out
}

func parser(s string) (out string) {
	var lines []string

	// convert string to individual lines
	scanner := bufio.NewScanner(strings.NewReader(s))
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	out = "{"
	out += parse(lines)

	// remove trailing comma
	out = out[:len(out)-1]
	out += "}"
	return out
}
