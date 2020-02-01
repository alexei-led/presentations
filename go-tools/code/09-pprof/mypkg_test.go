package mypkg

import "testing"

func Benchmark_BeginsWithRegex(b *testing.B) {
	for n := 0; n < b.N; n++ {
		BeginsWithRegex(s, r)
	}
}

func Benchmark_BeginsWithCompiledRegex(b *testing.B) {
	for n := 0; n < b.N; n++ {
		BeginsWithCompiledRegex(s, r)
	}
}

func Benchmark_BeginsWithString(b *testing.B) {
	for n := 0; n < b.N; n++ {
		BeginsWithString(s, pat)
	}
}
