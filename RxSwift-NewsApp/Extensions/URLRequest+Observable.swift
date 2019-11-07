//
//  URLRequest+Observable.swift
//  RxSwift-NewsApp
//
//  Created by kawaharadai on 2019/11/08.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5.0)
                return URLSession.shared.rx.data(request: request)
        }.map { data -> T? in
            return try? JSONDecoder().decode(T.self, from: data)
        }.asObservable()
    }
}
