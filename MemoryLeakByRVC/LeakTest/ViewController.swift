//
//  ViewController.swift
//  LeakTest
//
//  Created by Toshihiro Morimoto on 8/5/16.
//  Copyright © 2016 Toshihiro Morimoto. All rights reserved.
//

import UIKit

class MainViewController: UIViewController { }
class MainModalViewController: UIViewController {
    @IBAction func buttonTapped(_ sender: UIButton) {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: false, completion: nil) // コメントアウトするとメモリリークする
        UIApplication.shared.keyWindow?.rootViewController = storyboard!.instantiateViewController(withIdentifier: "SubViewController")
    }
}
class SubViewController: UIViewController { }
class SubPushedViewController: UIViewController {
    @IBAction func buttonTapped(_ sender: UIButton) {
        UIApplication.shared.keyWindow?.rootViewController = storyboard!.instantiateInitialViewController()
    }
}
