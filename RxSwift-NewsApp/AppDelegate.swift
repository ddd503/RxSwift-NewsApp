//
//  AppDelegate.swift
//  RxSwift-NewsApp
//
//  Created by kawaharadai on 2019/11/05.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNavigationBarLayoutForiOS13(backgroundColor: .systemOrange, titleColor: .white, largeTitleColor: .white)
        return true
    }

    /// iOS13以降のナビゲーションバーのレイアウト調整（didFinishLaunchingWithOptionsで呼ぶ）
    func setupNavigationBarLayoutForiOS13(backgroundColor: UIColor, titleColor: UIColor, largeTitleColor: UIColor) {
        // iOS13専用
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        // 背景
        coloredAppearance.backgroundColor = backgroundColor
        // 通常時の属性
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        // largetitle時の属性
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]

        // 通常のナビバーの見た目
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        // largeTitle等でナビバーが伸びた時の見た目
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

