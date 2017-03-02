//
//  AttractionDetailViewController.swift
//  PeekandPop
//
//  Created by Apple28 on 3/2/17.
//  Copyright © 2017 Apple28. All rights reserved.
//

import UIKit

class AttractionDetailViewController: UIViewController {

   
    var webSite: String?
    @IBOutlet weak var webAttraction: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let address = webSite {
            let webURL = URL(string: address)
            let urlRequest = URLRequest(url: webURL!)
            webAttraction.loadRequest(urlRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
