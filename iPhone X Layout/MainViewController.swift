//
//  MainViewController.swift
//  iPhone X Layout
//
//  Created by Yariv on 11/15/17.
//  Copyright © 2017 SwiftCoders. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet var bottomBar: UIVisualEffectView!
    @IBOutlet var bottomBarBottom: NSLayoutConstraint!

    var capitalsViewController: CapitalsViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        capitalsViewController?.tableView.contentInset.bottom = isBottomBarHidden ? 0 : bottomBar.frame.height
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? CapitalsViewController {
            capitalsViewController = viewController
        }
    }

    @IBAction func randomize(sender: UIButton) {
        capitalsViewController?.selectRandomCapital()
    }

    private var isBottomBarHidden: Bool {
        return bottomBarBottom.constant != 0
    }

    @IBAction func hideShowBottomBar(_ sender: UIBarButtonItem) {
        if isBottomBarHidden {
            sender.title = "Hide"
            bottomBarBottom.constant = 0
        } else {
            sender.title = "Show"
            bottomBarBottom.constant = -bottomBar.frame.height
        }
        view.setNeedsLayout()

        UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.7) {
            self.view.layoutIfNeeded()
        }.startAnimation()
    }
}
