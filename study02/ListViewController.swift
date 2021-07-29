//
//  ListViewController.swift
//  study02
//
//  Created by 殿谷将人 on 2021/07/14.
//

import UIKit

class ListViewController: UITableViewController {
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 100
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "row \(indexPath.row)"
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.label.text = "row \(indexPath.row)"
        navigationController?.pushViewController(vc, animated: true)
    }
}

class DetailViewController: UIViewController {
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        label.textAlignment = .center
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = view.bounds
    }
}
