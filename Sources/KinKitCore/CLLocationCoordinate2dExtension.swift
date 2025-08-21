//
//  CLLocationCoordinate2dExtension.swift
//  KinKit
//
//  Created by kin on 8/21/25.
//

import CoreLocation

extension CLLocationCoordinate2D {
    func distance(from other: CLLocationCoordinate2D) -> CLLocationDistance {
        CLLocation(latitude: latitude, longitude: longitude)
            .distance(from: .init(latitude: other.latitude, longitude: other.longitude))
    }
}
