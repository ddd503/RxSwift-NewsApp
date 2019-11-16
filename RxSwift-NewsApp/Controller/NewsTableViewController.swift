//
//  NewsTableViewController.swift
//  RxSwift-NewsApp
//
//  Created by kawaharadai on 2019/11/06.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Keys

class NewsTableViewController: UITableViewController {

    private var disposeBag = DisposeBag()
    private var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        populateNews()
    }

    func populateNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=\(RxSwiftNewsAppKeys().apiKey)") else {
            return
        }

        // 非同期処理をRxで同期的に
        // extension側でURLリクエスト結果を購読してここでハンドル
        let resource = Resource<APIResponse>(url: url)
        URLRequest.load(resource: resource).subscribe(onNext: { [weak self] result in
            self?.articles = result.articles
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
        let article = articles[indexPath.row]
        cell.setInfo(article: article)
        return cell
    }
}
