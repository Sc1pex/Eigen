# Eigen

A build.zig for [Eigen](https://libeigen.gitlab.io/). Intended for C++ projects using Zig as a build tool.

## Usage 

```sh
zig fetch --save https://github.com/Sc1pex/Eigen/archive/refs/tags/v5.0.1.tar.gz
```

Then, in your `build.zig`:

```zig
const eigen_dep = b.dependency("eigen", .{});
const eigen_lib = eigen_dep.artifact("eigen");

exe.linkLibrary(eigen_lib);
```

After that, you can use eigen in C++:

```cpp
#include <Eigen/Core>
#include <iostream>

int main() {
    Eigen::MatrixXd m(2, 2);
    m(0, 0) = 3;
    m(1, 0) = 2.5;
    m(0, 1) = -1;
    m(1, 1) = m(1, 0) + m(0, 1);
    
    std::cout << m << std::endl;
    return 0;
}
```

