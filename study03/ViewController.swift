//
//  ViewController.swift
//  study03
//
//  Created by 殿谷将人 on 2021/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLabel: UILabel!
    
    @IBAction func buttonTapped(sender: UIButton){
        myLabel.text = "tapped!!!"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

