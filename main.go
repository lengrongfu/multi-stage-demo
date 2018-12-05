package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"net/http"
	"strconv"
	"test/multi-stage-demo/controller"
)

type Config struct {
	Port int `json:"port"`
}

var conf Config
var filePath *string

func init() {
	filePath = flag.String("conf", "/config.json", "config file path")
	flag.Parse()
}

func main() {
	fmt.Println("config file path is:", *filePath)

	data, err := ioutil.ReadFile(*filePath)
	if err != nil {
		panic(err)
	}
	err = json.Unmarshal(data, &conf)
	if err != nil {
		panic(err)
	}

	fmt.Println("hello world!")
	http.HandleFunc("/demo", controller.Demo)
	http.ListenAndServe(":"+strconv.Itoa(conf.Port), nil)

}
