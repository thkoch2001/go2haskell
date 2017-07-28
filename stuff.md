## Missing in Go

### Either

Go error handling is implemented by either returning a useful value or an error:

``` go
func provideAnswer(answer int) (question string, err error) {
  if answer = 42 {
    return "Answer to the Ultimate Question of Life, the Universe, and Everything"
  }
  return nil, fmt.Errorf("wrong answer")
}

question, err := provideAnswer(number)
if err != nil {

}
```

Unfortunately Go does not support Either. Either is a Sum Type

``` haskell
provideAnswer:: int -> Either String String
provideAnswer 42 = Right "Answer to the Ultimate Question of Life, the Universe, and Everything"
provideAnswer _ = Left "wrong answer"

case provideAnswer 41 of
  Right question = -- do something with question
  Left error = handle error
```

### Scope confusion

``` go
package main

import (
	"fmt"
)

func fail() error {
	return fmt.Errorf("error2")
}

func main() {
	err := fmt.Errorf("error1")
	if err := fail(); err != nil {
		fmt.Printf("Inside if %v\n", err)
	}
	fmt.Printf("Outside if %v\n", err)
}
```
