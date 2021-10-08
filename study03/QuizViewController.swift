//
//  QuizViewController.swift
//  study03
//
//  Created by 殿谷将人 on 2021/09/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    let total = 10 //問題数
    var correct = 0 //正解数
    var questionIndex = 0 //問題番号
    var answerIndex = 0 //正解番号
    var answerIndexSet:[Int] = [] //正解番号配列
    
    //delegateを定義
    weak var delegate: ToPassDataProtocol?
    
    @IBOutlet var leftNumberLabel: UILabel!
    @IBOutlet var centerNumberLabel: UILabel!
    @IBOutlet var rightNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestions()
    }
    
    //結果画面へ値を渡す
    //performSegue()は内部にてprepare()を呼ぶので、結果画面への遷移時にこれが呼ばれる
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //segue.destinationで次の画面のViewControllerへアクセスしている
//        //segue.destinationがViewControllerの型を持っている
//        //サブクラスのResultViewControllerの型を認識するためにasがついている
//        //次の画面で結果を表示
////        if let resultVC = segue.destination as? ResultViewController {
////            resultVC.result = Double(correct) / Double(total) * 100.0
////        }
//
//        //一つ前の画面で結果を表示
//        let preNC = self.navigationController!
//        //let preNC = self.presentingViewController as! UINavigationController
//        let preVC = preNC.viewControllers[preNC.viewControllers.count - 2] as! ThirdViewController
//        preVC.result = Double(correct) / Double(total) * 100.0  //ここで値渡し
//
//    }
    
    //ボタンタップ時の処理
    @IBAction func tapped(sender: UIButton){
        //ボタンに設定したタグと正解番号が一致していれば正解数を加算
        if sender.tag - 1 == answerIndex  {
            correct += 1
        }
        
        //問題番号を加算
        questionIndex += 1
        
        //問題番号が問題数以上になったら結果画面へ遷移
        if questionIndex >= total {
            let result: Double = Double(correct) / Double(total) * 100.0 // delegateに渡す定数を用意
            delegate?.dataSend(data: result) // ここで値を渡す
            //print(result)
            //ホームまで戻る場合
            //self.navigationController?.popToRootViewController(animated: true)
            //任意の階層まで戻る場合
            //self.navigationController?.popToViewController(navigationController!.viewControllers[1], animated: true)
            //一つ戻る場合
            self.navigationController?.popViewController(animated: true)
            //次の画面へ進む場合
            //performSegue(withIdentifier: "BackTitle", sender: nil)
        } else {
            //問題番号が問題数未満の場合、次のクイズへ移行
            setQuestions()
        }
    }
    
    //クイズの内容を設定する
    func setQuestions() {
        //arc4random_uniformで0〜括弧内の数値がランダムで設定される
        let leftNum = Int(arc4random_uniform(10))
        var centerNum = Int(arc4random_uniform(10))
        answerIndex = Int(arc4random_uniform(4))
        
        //クイズを分岐
        //TODO:複数の正解が存在する場合の対応を追加
        switch answerIndex {
        case 0:
            rightNumberLabel.text = "\(leftNum + centerNum)"
        case 1:
            rightNumberLabel.text = "\(leftNum - centerNum)"
        case 2:
            rightNumberLabel.text = "\(leftNum * centerNum)"
        default:
            if centerNum == 0 {
                centerNum = 1
            }
            rightNumberLabel.text = "\(leftNum / centerNum)"
        }
        
        //クイズの答えを分岐
        //実装途中
//        if answerIndex == 0 {
//            rightNumberLabel.text = "\(leftNum + centerNum)"
//            answerIndexSet += [answerIndex]
//            //answerIndexSet.append(answerIndex)でも可
//
//        } else if answerIndex == 1 {
//            rightNumberLabel.text = "\(leftNum - centerNum)"
//            answerIndexSet += [answerIndex]
//
//        } else if answerIndex == 2 {
//            rightNumberLabel.text = "\(leftNum * centerNum)"
//            answerIndexSet += [answerIndex]
//
//        } else {
//            if centerNum == 0 {
//                centerNum = 1
//            }
//            rightNumberLabel.text = "\(leftNum / centerNum)"
//            answerIndexSet += [answerIndex]
//
//        }
        
        leftNumberLabel.text = "\(leftNum)"
        centerNumberLabel.text = "\(centerNum)"
    }


}
