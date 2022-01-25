# HTTPClient


<img src="https://img.shields.io/badge/platform-iOS%20%7C%20iPadOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20Linux%20%7C%20Windows-lightgrey" alt="Support Platform for iOS macOS watchOS tvOS Linux Windows" />

<a href="https://github.com/apple/swift-package-manager" alt="HTTPClient on Swift Package Manager" title="HTTPClient on Swift Package Manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" /></a>

## Ex. Search Repository

```swift
import HTTPClient

let url: URL = .init(string: "https://api.github.com/search/repositories")!

let queries = [
  "q": "zunda_pixel"
]

let (data, htttpResponse) = try await HTTPClient.get(url: url, queries: queries)

print(String(data: data, encoding: .utf8)!)
```


## Ex. Create Repositry

```swift
import HTTPClient

let url:URL = .init(string: "https://api.github.com/user/repos")!

let headers = [
  "Authorization": "Bearer AAAAAAAAAAAAdfklsajflksjadflkasdjflk",
]

let body = [
  "name": "blog"
]

let bodyData = try JSONEncoder().encode(body)

let (data, urlResponse) = try await HTTPClient.post(url: url, headers: headers, body: bodyData)

print(String(data: data, encoding: .utf8)!)
```


## Ex. Delete Repository

```swift
import HTTPClient

let userID = "zunda_pixel"
let repositoryName = "HTTPClient"
let url:URL = .init(string: "https://api.github.com/repos/\(userID)/\(repositoryName)")!

let headers = [
  "Authorization": "Bearer AAAAAAAAAAAAdfklsajflksjadflkasdjflk",
]

let (data, urlResponse) = try await HTTPClient.delete(url: url, headers: headers)

print(String(data: data, encoding: .utf8)!)
```


## Ex. Update Repository

```swift
import HTTPClient

let userID = "zunda_pixel"
let repositoryName = "HTTPClient"
let url:URL = .init(string: "https://api.github.com/repos/\(userID)/\(repositoryName)")!

let headers = [
  "Authorization": "Bearer AAAAAAAAAAAAdfklsajflksjadflkasdjflk",
]

let body = [
  "name": "newName"
]

let bodyData = try JSONEncoder().encode(body)
let (data, urlResponse) = try await HTTPClient.patch(url: url, headers: headers, body: bodyData)

print(String(data: data, encoding: .utf8)!)
```
