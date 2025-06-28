//
//  DateExtension.swift
//  KinKit
//
//  Created by kin on 6/28/25.
//

import Foundation

/// 더하고 싶은 날짜 단위 + 값
public enum DateComponentOffset {
    case year(_ value: Int)
    case month(_ value: Int)
    case day(_ value: Int)
    case hour(_ value: Int)
    case minute(_ value: Int)
    case second(_ value: Int)
}

public extension Date {
    /// 하나의 컴포넌트 오프셋을 더한 새 Date를 반환
    func add(_ offset: DateComponentOffset, calendar: Calendar = .current) -> Date {
        switch offset {
        case .year(let v):
            return calendar.date(byAdding: .year,  value: v, to: self) ?? self
        case .month(let v):
            return calendar.date(byAdding: .month, value: v, to: self) ?? self
        case .day(let v):
            return calendar.date(byAdding: .day,   value: v, to: self) ?? self
        case .hour(let v):
            return calendar.date(byAdding: .hour,  value: v, to: self) ?? self
        case .minute(let v):
            return calendar.date(byAdding: .minute,value: v, to: self) ?? self
        case .second(let v):
            return calendar.date(byAdding: .second,value: v, to: self) ?? self
        }
    }
    
    /// 여러 오프셋을 차례대로 적용
    func add(_ offsets: DateComponentOffset..., calendar: Calendar = .current) -> Date {
        offsets.reduce(self) { date, offset in
            date.add(offset, calendar: calendar)
        }
    }
}
