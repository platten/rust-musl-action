# GitHub Action for Rust and MUSL

Action provides a build environment with MUSL and x86_64-unknown-linux-musl target.

## Usage

To compile a rust binary/library with x86_64-unknown-linux-musl target:
Example include also the way to upload the final binary as artifact.

```yaml
name: Rust-static-build
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
env:
  BUILD_TARGET: x86_64-unknown-linux-musl
  TOOLCHAIN: stable
  BINARY_NAME: <binary_name>
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Build-musl
      uses: platten/rust-musl-action@main
      with:
        args: cargo build --target ${{ env.BUILD_TARGET }} --release
      env:
        TOOLCHAIN: ${{ env.TOOLCHAIN }} 
        TARGET: ${{ env.BUILD_TARGET }} 
    - uses: actions/upload-artifact@v2
      with:
        name: ${{ env.BINARY_NAME }}
        path: target/${{ env.BUILD_TARGET }}/release/${{ env.BINARY_NAME }}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

