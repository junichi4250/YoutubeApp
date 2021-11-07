//
//  BaseTabBarViewController.swift
//  YoutubeApp
//
//  Created by kato junichi on 2021/11/05.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    enum ControllerName: Int {
        case home, search, channel, library
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        viewControllers?.enumerated().forEach({ (index, viewController) in
            if let name = ControllerName.init(rawValue: index) {
                switch name {
                case .home:
                    setTabbarInfo(viewController, selectedImageName: "home-icon-selected", unselectedImageName: "home-icon-unselected", title: "ホーム")
                case .search:
                    setTabbarInfo(viewController, selectedImageName: "search-icon-selected", unselectedImageName: "search-icon-unselected", title: "検索")
                case .channel:
                    setTabbarInfo(viewController, selectedImageName: "channel-icon-selected", unselectedImageName: "channel-icon-unselected", title: "登録チャンネル")
                case .library:
                    setTabbarInfo(viewController, selectedImageName: "library-icon-selected", unselectedImageName: "library-icon-unselected", title: "ライブラリ")
                }
            }
        })
    }
    
    private func setTabbarInfo(_ viewController: UIViewController, selectedImageName: String, unselectedImageName: String, title: String) {
        viewController.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.resize(size: .init(width: 20, height: 20))?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.image = UIImage(named: unselectedImageName)?.resize(size: .init(width: 20, height: 20))?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.title = title
    }
    
}
