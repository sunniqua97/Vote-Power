import UIKit
import MapKit

class SearchViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var welcomeUser: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    @IBOutlet weak var searchResultsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchBar.layer.cornerRadius = 20
        searchCompleter.delegate = self
        welcomeUser.text = "Hello \(defaults.string(forKey: "userName") ?? "none")"
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchCompleter.queryFragment = searchText
    }
}

extension SearchViewController: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        searchResultsTableView.reloadData()
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // handle error
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let completion = searchResults[indexPath.row]
        
        let searchRequest = MKLocalSearch.Request(completion: completion)
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            let coordinate = response?.mapItems[0].placemark.coordinate
            //print(String(describing: coordinate))
            var address = String(response?.mapItems[0].placemark.title ?? "none")
            var addressState = String(response?.mapItems[0].placemark.administrativeArea ?? "none")
            print("HELLO")
            print("\(addressState)")
            print("\(address)")
            self.defaults.set(addressState, forKey: "userAddressState")
            self.defaults.set(address, forKey: "userAddress")
        }
        if(defaults.bool(forKey: "firstTime") == false){
            print("false")
            self.performSegue(withIdentifier: "goToHomeAddress", sender: self)
        }
        
        
        else{
            //defaults.set(true, forKey: "firstTime")
            print("TRUE")
            self.performSegue(withIdentifier: "goToGettingStartedFour", sender: self)
        }
        
    }
}
