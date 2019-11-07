//
//  Article.swift
//  RxSwift-NewsApp
//
//  Created by kawaharadai on 2019/11/07.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import Foundation

struct APIResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
