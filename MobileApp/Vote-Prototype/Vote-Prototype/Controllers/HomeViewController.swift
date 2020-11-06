//
//  ViewController.swift
//  Vote-Prototype
//
//  Created by Sunniyatul Quaderin on 9/30/20.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var goodMorning: UILabel!
    
    let defaults = UserDefaults.standard
    var locationMan = CLLocationManager()
    let locationLatLong = CLLocation(latitude: 40.621810,longitude: -73.994050)
    let distanceSpan: CLLocationDistance = 50000
    let annotationLocations = [ //locations to plot
        ["title":"Point A", "latitude":40.621810, "longitude":-73.994050],
        ["title":"Point B", "latitude":40.668830, "longitude":-73.721640],
        ["title":"Point C", "latitude":40.7143528, "longitude":-74.0059731],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goodMorning.text = "Good Morning \(defaults.string(forKey: "userName") ?? "bitch")"
        createAnnotations(locations:annotationLocations)
        zoomLevel(location: locationLatLong)

    }
    
    func zoomLevel(location:CLLocation){
        
        let mapCoordinates = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
        mapView.setRegion(mapCoordinates, animated:true)
        
    }
    
    func createAnnotations(locations:[[String : Any]]){
        for location in locations{
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            mapView.addAnnotation(annotations)
        }
        
        /*locationMan.delegate = self
        locationMan.desiredAccuracy = kCLLocationAccuracyBest
        locationMan.requestAlwaysAuthorization()
        locationMan.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view.
        

        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 40.621810, longitude: -73.994050)
        mapView.addAnnotation(annontation)*/
        
    }
 
}
