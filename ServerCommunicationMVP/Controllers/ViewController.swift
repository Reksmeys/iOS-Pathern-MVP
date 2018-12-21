//
//  ViewController.swift
//  ServerCommunicationMVP
//
//  Created by Reksmey on 12/21/18.
//  Copyright © 2018 Raksmey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var article: [Article]?
    var articlePresenter: ArticlePresenter?
    
    
    @IBOutlet weak var articleTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        article = [Article]()
        articlePresenter = ArticlePresenter()
        articlePresenter?.delegate = self
        articlePresenter?.getArticle(withPage: 1, withLimitation: 15)
        articleTableView.delegate = self
        articleTableView.dataSource = self
        
 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        article = []
        articlePresenter?.getArticle(withPage: 1, withLimitation: 15)
//        articleTableView.reloadData()
    }
    


}

extension ViewController: ArticlePresenterProtocol{
    func didResponseArticle(article: [Article]) {
        self.article = self.article! + article
        articleTableView.reloadData()
    }
    
    func didResponseMessage(msg: String) {
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (article?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "article") as! ArticleCell
        
        cell.titleLabel.text = article![indexPath.row].title
        
        return cell
    }
    
    
}

