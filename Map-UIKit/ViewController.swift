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

        LocationManager.shared.checkAndRequestLocationPermission()
        setupMapView()
        addExamplePoints()
    }

    func setupMapView() {
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

    func addExamplePoints() {
        /// Removing existing annotations before adding new ones
        let oldAnnotations = self.mapView.annotations
        mapView.removeAnnotations(oldAnnotations)

        /// Generating and adding new annotations to the map
        let points = generateExamplePoints(40)
        mapView.addAnnotations(points)
    }

    func generateExamplePoints(_ pointsCount: Int) -> [CustomAnnotation] {
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

    @IBAction private func refreshMap() {
        addExamplePoints()
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }

        if annotation is CustomAnnotation {
            guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? CustomAnnotationView else {
                return CustomAnnotationView(annotation: annotation, reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            }
            annotationView.annotation = annotation
            annotationView.clusteringIdentifier  = MKMapViewDefaultClusterAnnotationViewReuseIdentifier
            return annotationView
        } else if annotation is MKClusterAnnotation {
            return CustomClusterAnnotationView(annotation: annotation, reuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        } else {
            return MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        }
    }
}
