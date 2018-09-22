//
//  ViewController.swift
//  API Requests
//
//  Created by Prashant G on 9/19/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

// URL - https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA05982_hires.jpg

class ViewController: UIViewController {

    @IBOutlet weak var imageContainer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imageDownloadAction(_ sender: Any) {
        
        let imageUrl = URL(string: "https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA05982_hires.jpg")!
        
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            
            if error == nil {
                let imageFromData = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageContainer.image = imageFromData
                }
            }
        }
        task.resume()
        
    }
    


}

