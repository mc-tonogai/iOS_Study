//
//  ThirdViewController.swift
//  study03
//
//  Created by 殿谷将人 on 2021/09/22.
//

import UIKit

class ThirdViewController: UIViewController, ToPassDataProtocol {
    
    var result:Double = -1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //画面再表示のタイミングでresultの値を判定し、リザルト画面を表示
    //viewWillAppearは画面表示の直前に呼ばれるメソッド
    //画面初期表示の時にも、戻ってきた時にも実行される
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        if result != -1.0 {
//            performSegue(withIdentifier: "QuizToResult", sender: nil)
//        }
//    }
    
    //Protocolを準拠させる
    func dataSend(data: Double) {
        print(result)
        result = data
        if result != -1.0 {
            performSegue(withIdentifier: "QuizToResult", sender: nil)
        }
    }
    
    //結果画面へ値を渡す
    //performSegue()は内部にてprepare()を呼ぶので、結果画面への遷移時にこれが呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面で結果を表示
        if let resultVC = segue.destination as? ResultViewController {
            resultVC.result = result
            //渡したら値はリセット
            result = -1.0
        }
    }
    
    @IBAction func backToTitle(sender: UIStoryboardSegue){
        
    }
}




// Protocolを準拠させる
//extension ThirdViewController: ToPassDataProtocol {
//    
//    func dataSend(data: Double) {
//        result = data
//        if result != -1.0 {
//            performSegue(withIdentifier: "QuizToResult", sender: nil)
//        }
//    }
//    
//}
