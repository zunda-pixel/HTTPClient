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

extension URLSession {
  public static let timeout: Double = 60.0
  
  public static func request(method: HTTPMethod, url: URL, queries: [String: String?] = [:], headers: [String: String] = [:], body: Data? = nil,  timeout: Double = timeout) async throws -> (Data, URLResponse) {
    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!

    if !queries.isEmpty {
      urlComponents.queryItems = queries.map { .init(name: $0, value: $1) }
    }
    
    var request: URLRequest = .init(url: urlComponents.url!)
    request.httpMethod = method.rawValue
    request.allHTTPHeaderFields = headers
    request.httpBody = body
    request.timeoutInterval = timeout
    
    return try await URLSession.shared.data(for: request)
  }
  
  public static func get(url: URL, body: Data? = nil, headers: [String: String] = [:], queries: [String: String?] = [:], timeout: Double = timeout) async throws -> (Data, URLResponse) {
    return try await request(method: .get, url: url, queries: queries, headers: headers, body: body, timeout: timeout)
  }
  
  public static func post(url: URL, body: Data? = nil , headers: [String: String] = [:], queries: [String: String?] = [:], timeout: Double = timeout) async throws -> (Data, URLResponse) {
    return try await request(method: .post, url: url, queries: queries, headers: headers, body: body, timeout: timeout)
  }
  
  public static func put(url: URL, body: Data? = nil , headers: [String: String] = [:], queries: [String: String?] = [:], timeout: Double = timeout) async throws -> (Data, URLResponse) {
    return try await request(method: .put, url: url, queries: queries, headers: headers, body: body, timeout: timeout)
  }
  
  public static func delete(url: URL, body: Data? = nil , headers: [String: String] = [:], queries: [String: String?] = [:], timeout: Double = timeout) async throws -> (Data, URLResponse) {
    return try await request(method: .delete, url: url, queries: queries, headers: headers, body: body, timeout: timeout)
  }
  
  public static func connect(url: URL, body: Data? = nil , headers: [String: String] = [:], queries: [String: String?] = [:], timeout: Double = timeout) async throws -> (Data, URLResponse) {
    return try await request(method: .connect, url: url, queries: queries, headers: headers, body: body, timeout: timeout)
  }
  
  public static func head(url: URL, body: Data? = nil , headers: [String: String] = [:], queries: [String: String?] = [:], timeout: Double = timeout) async throws -> (Data, URLResponse) {
    return try await request(method: .head, url: url, queries: queries, headers: headers, body: body, timeout: timeout)
  }
  
  public static func options(url: URL, body: Data? = nil , headers: [String: String] = [:], queries: [String: String?] = [:], timeout: Double = timeout) async throws -> (Data, URLResponse) {
    return try await request(method: .options, url: url, queries: queries, headers: headers, body: body, timeout: timeout)
  }
  
  public static func patch(url: URL, body: Data? = nil , headers: [String: String] = [:], queries: [String: String?] = [:], timeout: Double = timeout) async throws -> (Data, URLResponse) {
    return try await request(method: .patch, url: url, queries: queries, headers: headers, body: body, timeout: timeout)
  }
  
  public static func trace(url: URL, body: Data? = nil , headers: [String: String] = [:], queries: [String: String?] = [:], timeout: Double = timeout) async throws -> (Data, URLResponse) {
    return try await request(method: .trace, url: url, queries: queries, headers: headers, body: body, timeout: timeout)
  }
}
