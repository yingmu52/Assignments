# Basic Idea

Use `signum` function to measure adjacent changes. A `Peak` changes from `-1` to `+1`. A `Valley` changes from `+1` to `-1`. `0` means reach either `Peak` or `Valley`


# Run test cases

> In order to run test cases, install `Testify` using `go get github.com/stretchr/testify`

In side `Castle` folder, run `go test ./...`, the test cases are in `castle_test.go`
