//
//  ViewController.swift
//  study02
//
//  Created by 殿谷将人 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {
    
    //文字表示
    let titleLabel: UILabel = {
        let view = UILabel.init()
        view.text = "Wunder Welt!"
        //AutoLayoutをコードから利用するためにはautoresizingをoffにする必要があるため
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //ボタン表示
    lazy var button: UIButton = {
        let view = UIButton.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.setTitle("画面2へ", for: .normal)
        view.addTarget(self, action: #selector(openModal(_:)), for: .touchDown)
        return view
    }()
    
    //ボタン表示
    lazy var navButton: UIButton = {
        let view = UIButton.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.setTitle("画面3へ", for: .normal)
        view.addTarget(self, action: #selector(openNavigation(_:)), for: .touchDown)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(titleLabel)
        view.addSubview(button)
        view.addSubview(navButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10), // add
            navButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) // add
            
        ])
    }
    
    @objc func openModal(_ sender: UIButton) {
        let modalViewController = ModalViewController.init()
        present(modalViewController, animated: true, completion: nil)
    }
    
    @objc func openNavigation(_ sender: UIButton){
        let firstPageViewController = FirstPageViewController.init()
        let customNavigationViewController = UINavigationController.init(rootViewController: firstPageViewController)
        customNavigationViewController.modalPresentationStyle = .fullScreen //全画面表示
        present(customNavigationViewController, animated: true, completion: nil)
        
    }
    
    
}

