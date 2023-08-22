//
//  CustomClusterAnnotationView.swift
//  Map-UIKit
//
//  Created by Cagri Gider on 22.08.2023.
//

import UIKit
import MapKit

class CustomClusterAnnotationView: MKAnnotationView {
    @IBOutlet private weak var countLabel: UILabel!

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let clusterAnnotation = annotation as? MKClusterAnnotation
        commonInit()
        setUI(with: clusterAnnotation)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleWidth])
        self.frame = view.frame
        addSubview(view)
    }

    private func setUI(with clusterAnnotation: MKClusterAnnotation?) {
        if let count = clusterAnnotation?.memberAnnotations.count {
            countLabel.text = count.description
        } else {
            countLabel.text = nil
            countLabel.isHidden = true
        }
    }
}
