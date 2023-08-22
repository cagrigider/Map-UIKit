//
//  CustomAnnotation.swift
//  Map-UIKit
//
//  Created by Cagri Gider on 22.08.2023.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D

    init(latitude: Double, longitude: Double){
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
    }
}
