//
//  TestViewController.swift
//  ioscocapodsample
//
//  Created by Altamash on 29/04/17.
//  Copyright © 2017 Altamash. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

     var stringPassed: String?
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnTest: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        //For modally opened
        self.dismiss(animated: true, completion: nil)
        
        //For Push-Open opened
        _ = navigationController?.popViewController(animated: true)

    }

    @IBAction func showData(_ sender: Any) {
        lblResult.text=stringPassed
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
