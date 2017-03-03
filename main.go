package main

import (
	"flag"
	"fmt"
	"log"
	"os"
)

const usage = `fitton

A command line program that demonstrates the sounds from http://www.fittonmusic.com/resources.html

Usage:
fitton [Options]

Options:
-h                       Print this help message
`

func main() {
	var (
		fs = flag.NewFlagSet("fitton", flag.ExitOnError)
	)
	fs.Usage = func() {
		fmt.Println(usage)
	}
	if err := fs.Parse(os.Args[1:]); err != nil {
		log.Fatal(err)
	}
}
