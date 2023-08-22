//
//  LocationManager.swift
//  Map-UIKit
//
//  Created by Cagri Gider on 22.08.2023.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {

    static let shared = LocationManager()

    private var locationManager: CLLocationManager!

    private override init() {
        super.init()

        locationManager = CLLocationManager()
        locationManager.delegate = self
    }

    func checkAndRequestLocationPermission() {
        let authorizationStatus = locationManager.authorizationStatus

        switch authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            // Location permission already granted
            break
        case .notDetermined:
            // Request permission
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            // Location permission denied or restricted
            // You can show an alert here to guide the user to settings
            break
        @unknown default:
            // Handle potential future cases
            break
        }
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Handle authorization status changes if needed
    }
}
