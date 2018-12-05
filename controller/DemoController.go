package controller

import (
	"net/http"
)

func Demo(w http.ResponseWriter, r *http.Request) {
	//log.LOG.Infof("this is request ip is:", r.RemoteAddr)
	w.Write([]byte("this is demo request."))
	return
}
