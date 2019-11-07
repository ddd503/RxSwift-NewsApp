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

let apiKey = RxSwiftNewsAppKeys().apiKey

class NewsTableViewController: UITableViewController {

    private var disposeBag = DisposeBag()
    private var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        populateNews()
    }

    func populateNews() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=\(apiKey)")!
        Observable.just(url)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5.0)
                return URLSession.shared.rx.data(request: request)
        }.map { (data) -> [Article] in
            return (try? JSONDecoder().decode(APIResponse.self, from: data).articles) ?? []
        }.subscribe(onNext: { [weak self] articles in
            // dataSource更新
            self?.articles = articles
            DispatchQueue.main.async {
                print(articles)
//                self?.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
