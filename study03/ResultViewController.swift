//
//  ResultViewController.swift
//  study03
//
//  Created by 殿谷将人 on 2021/09/27.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result = 0.0
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //roundで結果を四捨五入している
        resultLabel.text = "\(round(result))"
        
        //正解数に応じたメッセージへ分岐
        if result < 50 {
            messageLabel.text = "もう少し頑張ってください"
        } else if result < 80 {
            messageLabel.text = "ナイス！"
        } else {
            messageLabel.text = "ぐれーと！"
        }

    }
    

}
