package main

import (
	"encoding/json"
	"fmt"
)

func main() {
	pactlRawOutput := Exec("pactl list cards")
	pactlJSON := parser(pactlRawOutput)

	var pactl map[string]interface{}
	json.Unmarshal([]byte(pactlJSON), &pactl)

	a := pactl["Card #0"]

	fmt.Println(a.(map[string]interface{})["Name"])
	// fmt.Println(pactlJSON)
}
