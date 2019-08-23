//
//  ViewController.swift
//  ioscocapodsample
//
//  Created by Altamash on 29/04/17.
//  Copyright © 2017 Altamash. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var txtSetUserDeafult: UITextField!
    @IBOutlet weak var lblDisplayOutput: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func openViaProgramatically(_ sender: Any) {
        let svc=self.storyboard!.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        
        svc.stringPassed="Daniyal"
        
        self.navigationController?.pushViewController(svc, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "modallySague" {
//            // push wala code
//            let vc = segue.destination as! TestViewController
//            vc.stringPassed = "Yogesh"
//        }
//        else if segue.identifier == "pushSegue" {
//            // model wala code
//            let vc = segue.destination as! TestViewController
//            vc.stringPassed = "Yogesh1"
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modallySague" {
            let vc=segue.destination as! TestViewController
            vc.stringPassed="Called From modallySague"
        }
        else if segue.identifier == "pushSegue" {
            let vc=segue.destination as! TestViewController
            vc.stringPassed="Called from pushSegue"
        }
    }
    
    
    @IBAction func setUserDefault(_ sender: Any) {
        let defaults=UserDefaults.standard
        defaults.set(txtSetUserDeafult.text, forKey: "data")
    }
    
    @IBAction func getUserDefault(_ sender: Any) {
        let defaults=UserDefaults.standard
        let age = defaults.string(forKey: "data")
        lblDisplayOutput.text=age

    }
    
    
}

