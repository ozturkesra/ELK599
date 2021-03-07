//
//  BeaconScannerViewController.swift
//  EnerjiHarvesterBeacon
//
//  Created by Esra ÖZTÜRK on 19.01.2021.
//

import UIKit
import Lottie
import CoreLocation


class BeaconScannerViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var lblStatusMessage: UILabel!
    
    
    let BEACON_ID : String = "47415445-494F-5F4E-414E-5F4D45594552"
    var beaconRegion: CLBeaconRegion?
    let locationManager: CLLocationManager = CLLocationManager()
    var beaconRegionConstraints: CLBeaconIdentityConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLottieView()
        checkLocationServiceEnableAndAllowed()
    }
    
    private func setupLottieView() {
        animationView.animation = Animation.named("beacon")
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func setupLocationManager() {
        let uuid = UUID(uuidString: self.BEACON_ID)
        beaconRegionConstraints = CLBeaconIdentityConstraint(uuid: uuid!)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        beaconRegion = CLBeaconRegion(proximityUUID: uuid!, identifier: "iBeacon")
        locationManager.startMonitoring(for: beaconRegion!)
        locationManager.startRangingBeacons(satisfying: beaconRegionConstraints)
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        
        locationManager.stopMonitoring(for: beaconRegion!)
        locationManager.stopRangingBeacons(satisfying: beaconRegionConstraints)
        
        
        for beacon in beacons {
            if(beacon.accuracy != -1) {
                lblStatusMessage.text = "Beacon Bulundu.\n  Major: \(beacon.major) Minor: \(beacon.minor) \n Yaklaşık Mesafe : \(beacon.accuracy.floatingOneDigitRoundString) m \n RSSI : \(beacon.rssi) dBm"
                let foundBeacon = Beacon(uid: self.BEACON_ID, major: beacon.major.intValue, minor: beacon.minor.intValue, rssi: beacon.rssi, distance: beacon.accuracy.floatingOneDigitRoundString)
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(foundBeacon)
                let json = String(data: jsonData, encoding: String.Encoding.utf8)
                MQTTUtils.shared.publishBeacon(payload: json!)
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
            self.lblStatusMessage.text = "iBeacon Aranıyor..."
            self.locationManager.startMonitoring(for: self.beaconRegion!)
            self.locationManager.startRangingBeacons(satisfying: self.beaconRegionConstraints)
        }
    }
    
    func checkLocationServiceEnableAndAllowed() {
            if CLLocationManager.locationServicesEnabled() {
                switch CLLocationManager.authorizationStatus() {
                case .denied , .restricted:
                    DialogUtil.showDialog(viewController: self, title: "error".localized(), message: "check_location_services".localized(), buttonTitle: "button_ok".localized(), completion: { _ in
                        UIApplication.shared.systemSettingsForApplication()
                    })
                    break
                case .authorizedAlways , .authorizedWhenInUse:
                    setupLocationManager()
                    break
                case .notDetermined:
                    locationManager.delegate = self
                    locationManager.requestWhenInUseAuthorization()
                    break
                }
            } else {
                print("Not Enabled")
            }
        }
}
