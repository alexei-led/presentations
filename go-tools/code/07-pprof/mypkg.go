package mypkg

import (
	"log"
	"regexp"
	"strings"
)

var (
	s   = "The quick brown fox"
	r   = "^The.*$"
	pat = "The"
)

var re *regexp.Regexp

func BeginsWithCompiledRegex(s, r string) bool {
	if re == nil {
		re = regexp.MustCompile(r)
	}
	return re.MatchString(s)
}

func BeginsWithRegex(s, r string) bool {
	ok, err := regexp.MatchString(r, s)
	if err != nil {
		log.Println(err)
	}
	return ok
}
func BeginsWithString(s, pat string) bool {
	return strings.HasPrefix(s, pat)
}

func main() {}
