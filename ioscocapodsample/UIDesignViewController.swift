//
//  UIDesignViewController.swift
//  ioscocapodsample
//
//  Created by Altamash on 17/05/17.
//  Copyright © 2017 Altamash. All rights reserved.
//

import UIKit
import AlamofireImage
import SideMenu
import TTGSnackbar


class UIDesignViewController: UIViewController {
    
//    var price: Int?

    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageDisplay: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDisplay.image=UIImage(named: "noProductFound")
        let url = URL(string: "https://httpbin.org/image/png")!
        
//        if price !=nil
//            lbl.text=price!
//        
//        
//        if let value = price {
//            lbl.text=value
//        }
        
        
        imageDisplay.af_setImage(withURL: url)
        
        let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "SideMenu") as! UISideMenuNavigationController
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController

        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMenu(_ sender: Any) {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
        
        // Similarly, to dismiss a menu programmatically, you would do this:
        //dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Hey you just clicked me", preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func animate(_ sender: Any) {
        self.imageHeightConstraint.constant = 300
        UIView.animate(withDuration: 2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func snackbar(_ sender: Any) {
//        https://github.com/zekunyan/TTGSnackbar
//        let snackbar = TTGSnackbar.init(message: "Hey I am snackbar", duration: .long)
//        snackbar.show()
        
        let snackbar: TTGSnackbar = TTGSnackbar.init(message: "Two actions !", duration: .long)
        
        // Action 1
        snackbar.actionText = "Yes"
        snackbar.actionTextColor = UIColor.gray
        snackbar.actionBlock = { (snackbar) in NSLog("Click Yes !") }
        
        // Action 2
        snackbar.secondActionText = "No"
        snackbar.secondActionTextColor = UIColor.green
        snackbar.secondActionBlock = { (snackbar) in NSLog("Click No !") }
        
        snackbar.show()
        
//        let snackbar = TTGSnackbar.init(message: "Message", duration: .middle, actionText: "Action")
//        { (snackbar) -> Void in
//            NSLog("Click action!")
//        }
//        snackbar.show()

    }

}
