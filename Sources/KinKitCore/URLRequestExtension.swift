//
//  URLRequestExtension.swift
//  KinKit
//
//  Created by kin on 4/30/25.
//


public extension URLRequest {
    var curlString: String {
        guard let url = self.url else { return "" }
        var baseCommand = "curl \"\(url.absoluteString)\""
        if self.httpMethod == "HEAD" {
            baseCommand += " --head"
        }
        var command = [baseCommand]
        if let method = self.httpMethod, method != "GET" && method != "HEAD" {
            command.append("-X \(method)")
        }
        if let headers = self.allHTTPHeaderFields {
            for (header, value) in headers where header != "Content-Type" {
                let escapedHeader = header.replacingOccurrences(of: "\"", with: "\\\"")
                let escapedValue = value.replacingOccurrences(of: "\"", with: "\\\"")
                command.append("-H \"\(escapedHeader): \(escapedValue)\"")
            }
        }
        if let bodyData = self.httpBody, let bodyString = String(data: bodyData, encoding: .utf8) {
            let escapedBody = bodyString.replacingOccurrences(of: "\"", with: "\\\"")
            command.append("-d \"\(escapedBody)\"")
        }
        return command.joined(separator: " ")
    }
}
