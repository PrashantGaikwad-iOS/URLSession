//
//  ViewControllerTwo.swift
//  API Requests
//
//  Created by Prashant G on 9/19/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

class ViewControllerTwo: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let jsonUrl = URL(string: "https://api.myjson.com/bins/cvupo") else {
            return
        }
        URLSession.shared.dataTask(with: jsonUrl) { (data, response, error) in
            guard let data = data else {return}
            guard let jsonString = String(data: data, encoding: .utf8) else {return}
            print(jsonString)
        }.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func downloadAndParseAction(_ sender: Any) {
        
        guard  let jsonUrl = URL(string: "https://api.myjson.com/bins/cvupo") else {return}
        
        URLSession.shared.dataTask(with: jsonUrl) { (data, response, error) in
            guard let data = data else {return}
            do {
                let response = try JSONDecoder().decode(ResponseModel.self, from:data)
                print("first name - \(response.firstName)")
                print("last name - \(response.lastName)")
            }
            catch let error {
                print(error)
            }
        }.resume()
        
    }
    

}













