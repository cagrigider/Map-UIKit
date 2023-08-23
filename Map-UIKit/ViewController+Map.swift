//
//  ViewController+Map.swift
//  Map-UIKit
//
//  Created by Cagri Gider on 23.08.2023.
//

import MapKit

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
