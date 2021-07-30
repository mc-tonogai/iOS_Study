//
//  SecondPageViewController.swift
//  study02
//
//  Created by 殿谷将人 on 2021/07/14.
//

import UIKit
import Alamofire

class SecondPageViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    fileprivate var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // AlamofireでAPIリクエストをする
        AF.request("https://qiita.com/api/v2/items")
            // レスポンスをJSON形式で受け取る
            .responseJSON { response in
                let decoder: JSONDecoder = JSONDecoder()
                do {
                    // decode関数の引数にはJSONからマッピングさせたいクラスと実際のデータを指定する
                    let articles: [Article] = try decoder.decode([Article].self, from: response.data!)
                    print(articles)
                    //self.articles = articles
                    
                    //let users: [User] = try decoder.decode([User].self, from: response.data!)
                    //print(users)
                } catch {
                    // JSONの形式とクラスのプロパティが異なっている場合には失敗する
                    print("failed")
                    print(error.localizedDescription)
                }
        }
        
        let titleLists: UITableView = UITableView(frame: CGRect(x: 0, y: 0 , width: 300, height: 500))
        titleLists.register(UITableViewCell.self, forCellReuseIdentifier: "data")
        titleLists.dataSource = self
        titleLists.delegate = self
        self.view.addSubview(titleLists)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let article = articles[indexPath.row]
        //cell.textLabel?.text = article.title
        cell.textLabel?.text = "row \(indexPath.row)"
        //cell.detailTextLabel?.text = article.user.name
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}

/*
extension SecondPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        //cell.detailTextLabel?.text = article.user.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
}

*/
