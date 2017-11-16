//
//  LaunchViewController.swift
//  iPhone X Layout
//
//  Created by Yariv on 11/15/17.
//  Copyright © 2017 SwiftCoders. All rights reserved.
//

import UIKit

final class LaunchViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
