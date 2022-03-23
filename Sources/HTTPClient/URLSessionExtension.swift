//
//  URLSessionExtension.swift
//  
//
//  Created by zunda on 2022/01/24.
//

import Foundation

@available(macOS, deprecated: 12.0, message: "Use the built-in API instead")
@available(iOS, introduced: 13.0, deprecated: 15.0, message: "Use the built-in API instead")
extension URLSession {
  func data(from url: URL, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
    try await withCheckedThrowingContinuation { continuation in
      self.dataTask(with: url) { data, response, error in
        if let error = error {
          return continuation.resume(throwing: error)
        }
        guard let data = data, let response = response else {
          return continuation.resume(throwing: URLError(.badServerResponse))
        }
        continuation.resume(returning: (data, response))
      }.resume()
    }
  }
  
  func data(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
    try await withCheckedThrowingContinuation { continuation in
      self.dataTask(with: request) { data, response, error in
        if let error = error {
          return continuation.resume(throwing: error)
        }
        guard let data = data, let response = response else {
          return continuation.resume(throwing: URLError(.badServerResponse))
        }
        continuation.resume(returning: (data, response))
      }.resume()
    }
  }
}
