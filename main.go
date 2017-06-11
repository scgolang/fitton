package main

import (
	"flag"
	"fmt"
	"log"
	"os"

	"github.com/scgolang/play"
)

const usage = `fitton

A command line program that demonstrates the sounds from http://www.fittonmusic.com/resources.html

Usage:
fitton [Options]

Options:
-h              Print this help message
-l              List the available sounds.
-s SOUND        Play SOUND.
`

var (
	app *play.App
	fs  *flag.FlagSet
)

func main() {
	if err := fs.Parse(os.Args[1:]); err != nil {
		log.Fatal(err)
	}
	if err := app.Run(fs.Args()); err != nil {
		log.Fatal(err)
	}
}

func init() {
	fs = flag.NewFlagSet("fitton", flag.ExitOnError)
	fs.Usage = func() {
		fmt.Println(usage)
	}
	app = play.New(fs)
	app.Add("bell", bell)
	app.Add("bubbles", bubbles)
}
