//
//  ModalViewController.swift
//  study02
//
//  Created by 殿谷将人 on 2021/07/14.
//

import UIKit

class ModalViewController: UIViewController {
    
    //文字表示
    let titleLabel: UILabel = {
        let view = UILabel.init()
        view.text = "Wunder Welt2"
        //AutoLayoutをコードから利用するためにはautoresizingをoffにする必要があるため
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        view.backgroundColor = .green
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
        ])
    }
}
