//
//  FirstPageViewController.swift
//  study02
//
//  Created by 殿谷将人 on 2021/07/14.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    lazy var button: UIButton = {
        let view = UIButton.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.setTitle("次のページ", for: .normal)
        view.addTarget(self, action: #selector(nextPage(_:)), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func nextPage(_ sender: UIButton) {
        let secondPageViewController = SecondPageViewController.init()
        //let listViewController = ListViewController.init()
        navigationController?.pushViewController(secondPageViewController, animated: true)
        //navigationController?.pushViewController(listViewController, animated: true)
        
    }
    
}
