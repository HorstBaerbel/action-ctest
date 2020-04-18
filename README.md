# action-ctest - A GitHub action to run unit tests on a repository using CTest

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Builds a repository using [CMake](https://cmake.org/), then runs unit tests using [CTest](https://cmake.org/cmake/help/latest/manual/ctest.1.html).

If you find a bug or make an improvement your pull requests are appreciated.

## License

All of this is under the [MIT License](LICENSE).

## Usage

Create a new workflow file, e.g. ./github/workflows/test.yml:

```yaml
# Run unit tests using CTest
name: Tests

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  checkout-and-check-formatting:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Run unit tests
      uses: HorstBaerbel/action-ctest@1.0
      # These are optional (defaults displayed)
      with:
        sourcedir: '.'
        builddir: 'build'
        cmakeoptions: '--config Release'
        ctestoptions: ''
```

## Parameters (optional), see action.yml

* **sourcedir**: Directory with top-level CMakeLists.txt. MUST be realtive to you repository, thus '.' means root of repository.
* **builddir**: Directory to run CMake build in, e.g. 'build'. MUST be relative to sourcedir, thus 'build' means 'sourcedir/build'.
* **cmakeoptions**: Pass an additional option string to cmake (will call "cmake cmakeoptions sourcedir").
* **ctestoptions**: Pass an additional option string to CTest (will call "ctest --output-on-failure ctestoptions"). Add "--debug --extra-verbose" to get more debug output from tests.
