//
//  ViewControllerThree.swift
//  API Requests
//
//  Created by Prashant G on 9/19/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

var accessKey = "bbaa1bd243622c7316b64b71a29c368f082ebb37351ae7877fec6844c07eb056"
var secretKey = "f0cee78f038af9d7f3bf6d7f896ac2b4fc87dc61ca34dc6ee6fdb1cbe4c030bc"

class ViewControllerThree: UIViewController {

    @IBOutlet weak var imageContainer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func downloadUnsplashDataAction(_ sender: Any) {
        
        guard let jsonUrl = URL.with(string: "photos/random") else {
            return
        }
        
        var urlRequest = URLRequest(url: jsonUrl)
        
        urlRequest.setValue("Client-ID bbaa1bd243622c7316b64b71a29c368f082ebb37351ae7877fec6844c07eb056", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let data = data else {return}
            
//            let jsonString = String(data:data, encoding: .utf8)
//            print(jsonString ?? "No data")
            
            do {
                let response = try JSONDecoder().decode(UnsplashResponseModel.self, from: data)
                print("id - \(response.id)")
                print("color - \(response.color)")
                print("image urls - \(response.urls.thumb)")
                
                let url = URL(string:response.urls.regular)
                let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async() {    // execute on main thread
                        self.imageContainer.image = UIImage(data: data)
                    }
                }
                task.resume()
                
            }
            catch let error{
                print(error)
            }
        }.resume()
    }
    

}


/*
 
 // POST Call using URLSession
 
 func loginWS(parameters:[String:String], completionHandler: @escaping (Any?) -> Swift.Void) {
 
 guard let gitUrl = URL(string: BASE_URL+ACTION_URL) else { return }
 print(gitUrl)
 
 let request = NSMutableURLRequest(url: gitUrl)
 //  uncomment this and add auth token, if your project needs.
 //  let config = URLSessionConfiguration.default
 //  let authString = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxMywiUGFzc3dvcmQiOiIkMmEkMTAkYVhpVm9wU3JSLjBPYmdMMUk2RU5zdU9LQzlFR0ZqNzEzay5ta1pDcENpMTI3MG1VLzR3SUsiLCJpYXQiOjE1MTczOTc5MjV9.JaSh3FvpAxFxbq8z_aZ_4OhrWO-ytBQNu6A-Fw4pZBY"
 //  config.httpAdditionalHeaders = ["Authorization" : authString]
 
 let session = URLSession.shared
 request.httpMethod = "POST"
 request.addValue("application/json", forHTTPHeaderField: "Content-Type")
 request.addValue("application/json", forHTTPHeaderField: "Accept")
 request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])

 let task = session.dataTask(with: request as URLRequest) { data, response, error in
 
 guard let data = data else { return }
 do {
 //  let decoder = JSONDecoder()
 //  here replace LoginData with your codable structure.
 let gitData = try JSONDecoder().decode(LoginData.self, from: data)
 print("response data:", gitData)
 completionHandler(gitData)
 } catch let err {
 print("Err", err)
 }
 }.resume()
 }
 
*/










