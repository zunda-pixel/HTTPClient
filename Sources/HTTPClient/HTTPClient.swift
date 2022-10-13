//
//  HTTPClient.swift
//
//
//  Created by zunda on 2022/01/24.
//

import Foundation
import HTTPMethod

#if os(Linux) || os(Windows)
  import FoundationNetworking
#endif

extension URLRequest {
  static public func request(
    method: HTTPMethod, url: URL, queries: [String: String?] = [:], headers: [String: String] = [:],
    body: Data? = nil
  ) -> Self {
    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!

    if !queries.isEmpty {
      urlComponents.queryItems = queries.map { .init(name: $0, value: $1) }
    }

    var request: URLRequest = .init(url: urlComponents.url!)
    request.httpMethod = method.rawValue
    request.allHTTPHeaderFields = headers
    request.httpBody = body

    return request
  }

  static public func get(
    url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:]
  ) -> Self {
    return request(method: .get, url: url, queries: queries, headers: headers, body: body)
  }

  static public func post(
    url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:]
  ) -> Self {
    return request(method: .post, url: url, queries: queries, headers: headers, body: body)
  }

  static public func put(
    url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:]
  ) -> Self {
    return request(method: .put, url: url, queries: queries, headers: headers, body: body)
  }

  static public func delete(
    url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:]
  ) -> Self {
    return request(method: .delete, url: url, queries: queries, headers: headers, body: body)
  }

  static public func connect(
    url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:]
  ) -> Self {
    return request(method: .connect, url: url, queries: queries, headers: headers, body: body)
  }

  static public func head(
    url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:]
  ) -> Self {
    return request(method: .head, url: url, queries: queries, headers: headers, body: body)
  }

  static public func options(
    url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:]
  ) -> Self {
    return request(method: .options, url: url, queries: queries, headers: headers, body: body)
  }

  static public func patch(
    url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:]
  ) -> Self {
    return request(method: .patch, url: url, queries: queries, headers: headers, body: body)
  }

  static public func trace(
    url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:]
  ) -> Self {
    return request(method: .trace, url: url, queries: queries, headers: headers, body: body)
  }
}
