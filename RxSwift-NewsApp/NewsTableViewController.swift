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

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
