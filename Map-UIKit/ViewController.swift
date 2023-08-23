//
//  ViewController.swift
//  Map-UIKit
//
//  Created by Cagri Gider on 22.08.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet private weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView()
        addExamplePoints()
    }

    private func setupMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = false

        mapView.register(
            CustomAnnotationView.self,
            forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier
        )
        mapView.register(
            CustomClusterAnnotationView.self,
            forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier
        )

        let region = MKCoordinateRegion(center: .init(latitude: 35.278259, longitude: -119.5), latitudinalMeters: 500000, longitudinalMeters: 500000)
        mapView.setRegion(region, animated: false)
    }

    private func addExamplePoints() {
        /// Removing existing annotations before adding new ones
        let oldAnnotations = self.mapView.annotations
        mapView.removeAnnotations(oldAnnotations)

        /// Generating and adding new annotations to the map
        let points = generateExamplePoints(40)
        mapView.addAnnotations(points)
    }

    private func generateExamplePoints(_ pointsCount: Int) -> [CustomAnnotation] {
        var points: [CustomAnnotation] = []

        /// Generating sample points based on the given count
        for _ in 0..<pointsCount {
            let latitude = Double.random(in: 34.0 ... 36.0)
            let longitude = Double.random(in: -121.0 ... -119.0)
            let annotation = CustomAnnotation(latitude: latitude, longitude: longitude)
            points.append(annotation)
        }

        return points
    }
}
