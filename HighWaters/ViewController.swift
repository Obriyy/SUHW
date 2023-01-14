//
//  ViewController.swift
//  HighWaters
//
//  Created by Artem Kosheliev on 13.01.2023.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseCore

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapKit: MKMapView!

    private var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self

        locationManager.requestWhenInUseAuthorization()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone

        mapKit.showsUserLocation = true
        mapKit.delegate = self

        locationManager.startUpdatingLocation()

        setupUI()
    }

    private func setupUI() {
        let addButton = UIButton(frame: CGRect.zero)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        let plusImage = UIImage(systemName: "plus.circle.fill")?.withConfiguration(largeConfig)
        addButton.setImage(plusImage, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonAnnotation), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(addButton)

        addButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true


    }

    @objc func addButtonAnnotation(sender: Any) {
        if let location = locationManager.location {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            mapKit.addAnnotation(annotation)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let coordinate = location.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapKit.setRegion(region, animated: true)
        }
    }

}

