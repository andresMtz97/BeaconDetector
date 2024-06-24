//
//  Detector.swift
//  BeaconDetector
//
//  Created by DISMOV on 14/06/24.
//

import Foundation
import CoreBluetooth
import CoreLocation

class Detector: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    @Published var beaconsArray = [CLBeacon]()
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startScanBeacons() {
        if let uuid = UUID(uuidString: " 2F234454-CF6D-4AOF-ADF2-F4911BA9FFA6") {
            let constraint = CLBeaconIdentityConstraint(uuid: uuid)
            let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "mi android")
            locationManager.startMonitoring(for: beaconRegion)
            locationManager.startRangingBeacons(satisfying: constraint)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanBeacons()
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        beaconsArray = beacons
    }
}
