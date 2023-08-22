//
//  CustomAnnotationView.swift
//  Map-UIKit
//
//  Created by Cagri Gider on 22.08.2023.
//

import UIKit
import MapKit

class CustomAnnotationView: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleWidth])
        self.frame = view.frame
        addSubview(view)
    }
}
