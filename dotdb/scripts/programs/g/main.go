package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
	"sync"
)

func Exec(command string) string {
	out, _ := exec.Command("bash", "-c", command).Output()
	return string(out)
}

func createCMD(mindepth int, maxdepth int, args ...string) string {
	cmd := "find "
	for _, arg := range args {
		cmd += arg
		cmd += " "
	}
	cmd += "-mindepth "
	cmd += fmt.Sprint(mindepth)
	cmd += " -maxdepth "
	cmd += fmt.Sprint(maxdepth)
	cmd += " -type d"
	return cmd
}

func main() {
	// recive una lista de
	paths := os.Args[1:]
	// depth := flag.Int("depth", 1, "Number of recursion steps")
	var wg sync.WaitGroup
	result := Exec(createCMD(1, 1, paths...))
	lines := strings.Split(result, "\n")
	var response string
	for i := 0; i < len(lines)-1; i++ {
		wg.Add(1)
		go func(i int) {
			response = Exec(createCMD(1, 3, lines[i]))
			response = strings.TrimSuffix(response, "\n")
			fmt.Println(response)
			wg.Done()
		}(i)
	}
	wg.Wait()
}
