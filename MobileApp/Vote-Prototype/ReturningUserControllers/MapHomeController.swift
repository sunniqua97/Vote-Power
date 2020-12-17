//
//  MapHomeController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/22/20.
//

import UIKit
import MapKit
class MapHomeController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var ElectionName: UILabel!
    let baseURL = "https://civicinfo.googleapis.com/civicinfo/v2/voterinfo?address="


    let civicApiKey = ProcessInfo.processInfo.environment["CIVIC_API_KEY2"]
    let defaults = UserDefaults.standard //access user name and address
    var electionName = ""
    var electionDate = ""
    var pollLocationTitle = ""
    var pollLocationLatitude = 0.0
    var pollLocationLongitude = 0.0
    var annotationLocations: [[String:Any]] = [[:]]
    var locationLatLong = CLLocation(latitude: 33.4147414, longitude: -82.3196378) //default coordinate
    let distanceSpan:CLLocationDistance = 50000
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        mapView.delegate = self

        parseJSON()
    }
    
    func parseJSON() {
        let urlString = "\(baseURL)\(defaults.string(forKey: "userAddress")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")&returnAllAvailableData=true&key=\(civicApiKey!)"
        print(urlString)
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(VoterData.self, from: safeData)
                        self.electionName = decodedData.election.name
                        self.electionDate = decodedData.election.electionDay
                        for pollingLocation in decodedData.pollingLocations {
                            self.addPollingLocation(pollLoc: pollingLocation)
                        }
                        
                        //we can also access polling hours for early vote sites
                        //but I haven't included that
                        for earlyVoteSite in decodedData.earlyVoteSites {
                            self.addEarlyVoteSite(earlyVote: earlyVoteSite)
                        }
                        
                        DispatchQueue.main.async {
                            self.locationLatLong = CLLocation(latitude: self.annotationLocations[0]["latitude"] as! CLLocationDegrees, longitude: self.annotationLocations[0]["longitude"] as! CLLocationDegrees)
                            self.createAnnotations(locations: self.annotationLocations)
                            self.zoomLevel(location: self.locationLatLong)
                            self.ElectionName.text = self.electionName
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
    func addPollingLocation(pollLoc: PollingLocationStruct) {
        var locationArray: [String: Any] = [:]
        locationArray["title"] = pollLoc.address.locationName
        locationArray["latitude"] = pollLoc.latitude
        locationArray["longitude"] = pollLoc.longitude
        if (self.annotationLocations[0]["title"] == nil) {
            self.annotationLocations[0] = locationArray
        }
        else {
            self.annotationLocations.append(locationArray)
        }
    }
    
    func addEarlyVoteSite(earlyVote: EarlyVoteSitesStruct) {
        var locationArray: [String: Any] = [:]
        locationArray["title"] = earlyVote.address.locationName
        locationArray["latitude"] = earlyVote.latitude
        locationArray["longitude"] = earlyVote.longitude
        if (self.annotationLocations[0]["title"] == nil) {
            self.annotationLocations[0] = locationArray
        }
        else {
            self.annotationLocations.append(locationArray)
        }
    }
    
    func zoomLevel(location:CLLocation){
        let mapCoordinates = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: distanceSpan,longitudinalMeters: distanceSpan)
        mapView.setRegion(mapCoordinates, animated: true)
    }
    
    func createAnnotations(locations:[[String : Any]]){
        
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            mapView.addAnnotation(annotations)
        }
        
    }

    // MARK: - Navigation

}
extension MapHomeController: MKMapViewDelegate {
  // 1
  func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    // 2
    
    // 3
    let identifier = "artwork"
    var view: MKMarkerAnnotationView
    // 4
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      // 5
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
}

