//
//  SettingViewController.swift
//  SimpleGame
//
//  Created by Angie Kim on 2/28/23.
//

import UIKit

protocol SettingDelegate {
    func getBallsCount(ballsCount: Int)
}


class SettingViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    var SettingDelegate: SettingDelegate?
    var defaultInputText = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        guard let ballsStr = self.inputTextField.text, let balls = Int(ballsStr) else {
            self.SettingDelegate?.getBallsCount(ballsCount: self.defaultInputText)
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.SettingDelegate?.getBallsCount(ballsCount: Int(balls))
    }
}
