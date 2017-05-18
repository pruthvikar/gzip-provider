// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "gzip-provider",
    dependencies: [
      .Package(url: "https://github.com/pruthvikar/GZIP.git", "1.0.0-beta.1"),
      .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2)
  ]
)
