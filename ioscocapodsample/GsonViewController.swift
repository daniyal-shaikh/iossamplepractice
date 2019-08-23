//
//  GsonViewController.swift
//  ioscocapodsample
//
//  Created by Daniyal Shaikh on 23/08/19.
//  Copyright © 2019 Altamash. All rights reserved.
//

import UIKit
import Alamofire

class GsonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
        
    }
    
    
    func callApi() -> Void {
        
        Alamofire.request("http://elite.rupeeboss.com/api/view-otp").responseData { (resData) -> Void in
            let decoder = JSONDecoder()
//            let encoder = JSONEncoder()
//            let data = try encoder.encode(resData.result.value!)
            
            print(resData.result)
            let person = try! decoder.decode(ContactsData.self, from : resData.result.value!)
            let Data = person.Data
            print(Data)
            print(resData.result.value!)
//            let strOutput = String(data : resData.result.value!, encoding : String.Encoding.utf8)
//            print(strOutput)
        }
        print("Hello")
        
    }
    
    struct ContactsData : Codable {
        let message,status : String
        var Data : [DataFields]
    }
    
    struct DataFields : Codable {
        let mobile : String
        let otp : Int
        
    }


}
