//
//  NewsViewController.swift
//  Vote-Prototype
//
//  Created by Matthew Soto on 11/4/20.
//

import UIKit

class NewsViewController: UITableViewController {
    
    @IBOutlet weak var newsTable: UITableView!
    
    var candidate = "Trump"
    var selectedRow = 0
    
    let headers = [
        "x-rapidapi-key": ProcessInfo.processInfo.environment["BING_API_KEY"]!,
        "x-rapidapi-host": "microsoft-azure-bing-news-search-v1.p.rapidapi.com"
    ]
    var posts: [Post] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = post.name
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(posts[indexPath.row].name)
        selectedRow = indexPath.row
        performSegue(withIdentifier: "newsToWeb", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsToWeb" {
            let destinationVC = segue.destination as! WebView
            destinationVC.url = posts[selectedRow].url
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.dataSource = self
        newsTable.delegate = self
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://rapidapi.p.rapidapi.com/search?q=\(candidate)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
            print(error!)
            } else {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let results = try decoder.decode(Results.self, from: safeData)
                        self.posts = results.value
                        DispatchQueue.main.async {
                            self.newsTable.reloadData()
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            }
        })

        dataTask.resume()
    }

}
