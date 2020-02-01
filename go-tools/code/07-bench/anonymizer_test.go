package anonymizer

import "testing"

func BenchmarkAnonymizerShortString(b *testing.B) {
	for n := 0; n < b.N; n++ {
		Anonymizer("This is a secret message with my private email john@gmail.com")
	}
}

func BenchmarkAnonymizerLongString(b *testing.B) {
	for n := 0; n < b.N; n++ {
		Anonymizer("This is a secret message with my private emails: john@gmail.com, john@gmail.com, john@gmail.com, john@gmail.com, john@gmail.com, john@gmail.com, john@gmail.com.")
	}
}
