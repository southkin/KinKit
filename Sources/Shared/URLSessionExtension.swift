//
//  URLSessionExtension.swift
//  KinKit
//
//  Created by kin on 4/30/25.
//

public extension URLSession {
    func getData(for request: URLRequest) async throws -> (Data, URLResponse) {
        if #available(iOS 15, *) {
            return try await data(for: request)
        } else {
            return try await withCheckedThrowingContinuation { continuation in
                let task = self.dataTask(with: request) { data, response, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }
                    if let data = data, let response = response {
                        continuation.resume(returning: (data, response))
                    } else {
                        let error = URLError(.badServerResponse)
                        continuation.resume(throwing: error)
                    }
                }
                task.resume()
            }
        }
    }
}
