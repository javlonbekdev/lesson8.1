//
//  ViewController.swift
//  lesson8.1
//
//  Created by Javlonbek on 15/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    
//    let blogPost: BlogPost = try! JSONDecoder().decode(BlogPost.self, from: jsonData)

    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var locate: UILabel!
    @IBOutlet weak var bio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.github.com/users/javlonbekiosdev")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: ", error)
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
            DispatchQueue.main.async {
                self.login.text = json["login"] as? String
                self.name.text = json["name"] as? String
                self.locate.text = json["location"] as? String
                self.bio.text = json["bio"] as? String
            }
        }
        task.resume()
        
    }

}

//struct BlogPost: Decodable {
//    let title: String
//}
