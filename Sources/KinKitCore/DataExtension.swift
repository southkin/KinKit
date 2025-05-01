//
//  DataExtension.swift
//  KinKit
//
//  Created by kin on 4/30/25.
//


public extension Data {
    func makeObj<T:Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
    func makeObj<T:Decodable>(type:T.Type) -> T? {
        return makeObj()
    }
    var dict:[String:Any]? {
        return try? JSONSerialization.jsonObject(with: self) as? [String:Any]
    }
    func string(encoding:String.Encoding = .utf8) -> String {
        return String(data: self, encoding: encoding) ?? ""
    }
}
