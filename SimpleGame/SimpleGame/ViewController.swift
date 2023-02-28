//
//  ViewController.swift
//  SimpleGame
//
//  Created by Angie Kim on 2/28/23.
//

/*
 1. press start -> generate random number btw 1-10
 2. user bet their balls, choosing btw even or odd
 3. show result
 */

import UIKit

class ViewController: UIViewController, SettingDelegate{

    @IBOutlet weak var computerBallCountLbl: UILabel!
    @IBOutlet weak var userBallCountLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var firstImage: UIImageView!
    
    
    var comBallsCount: Int = 20
    var userBallsCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        computerBallCountLbl.text = String(comBallsCount)
        userBallCountLbl.text = String(userBallsCount)
        self.imageContainer.isHidden = true
    }

    @IBAction func gameStartPressed(_ sender: Any) {
        print("Game Started!")
        print("Random number: \(self.getRandom())")
        
        self.imageContainer.isHidden = false
        
        UIView.animate(withDuration: 1.0) {
            self.firstImage.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.firstImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in
            self.imageContainer.isHidden = true
            self.showAlert()
        }
        
    }
    
    @IBAction func settingBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingVC = storyboard.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        settingVC.SettingDelegate = self
        settingVC.modalPresentationStyle = .fullScreen
        self.present(settingVC, animated: true, completion: nil)
    }
    
    
    
    func showAlert() {
        let alert = UIAlertController.init(title: "Game Start", message: "Odd or Even?", preferredStyle: .alert)
        let oddBtn = UIAlertAction(title: "Odd", style: .default) { _ in
            print("Odd Confirmed")
            
            guard let input = alert.textFields?.first?.text else {
                return
            }
            
            print("User bet \(input) to Odd.")
            
            guard let value = Int(input) else {
                return
            }
                    
            self.getWinner(count: value, select: "Odd")
            
        }
        
        let evenBtn = UIAlertAction(title: "Even", style: .default) { _ in
            print("Even Confirmed")
            
            guard let input = alert.textFields?.first?.text else {
                return
            }
            
            guard let value = Int(input) else {
                return
            }
            
            print("User bet \(input) to Even.")
            self.getWinner(count: value, select: "Even")
        }
        
        alert.addTextField { textField in
            textField.placeholder = "How many balls will you bet?"
        }
        
        alert.addAction(oddBtn)
        alert.addAction(evenBtn)
        
        self.present(alert, animated: true) {
            print("odd even selection screen poped")
        }
    }
    
    func getWinner(count: Int, select: String) {
        
        let com = self.getRandom()
        let comType = com % 2 == 0 ? "Even" : "Odd"
//        self.resultLbl.text = comType
        var result = comType
        
        if comType == select {
            print("User won!")
            result = "It was " + result + "! You Won!"
            self.resultLbl.text = result
            self.calculateBalls(winner: "user", count: count)
        } else {
            print("User lost!")
            result = "It was " + result + "! You lost!"
            self.resultLbl.text = result
            self.calculateBalls(winner: "com", count: count)
        }
    }
    
    //if balls == 0; true, else; false
    func checkAccountEmpty(balls: Int) -> Bool {
        return balls == 0
    }
    
    func calculateBalls(winner: String, count: Int) {
        if winner == "com" {
            self.userBallsCount = self.userBallsCount - count
            self.comBallsCount = self.comBallsCount + count
            if self.checkAccountEmpty(balls: self.userBallsCount){
                self.resultLbl.text = "You lost all your balls. RIP"
            }
        } else {
            self.userBallsCount = self.userBallsCount + count
            self.comBallsCount = self.comBallsCount - count
            if self.checkAccountEmpty(balls: self.comBallsCount){
                self.resultLbl.text = "You won all the balls. Yay!"
            }
        }
        
        self.userBallCountLbl.text = "\(self.userBallsCount)"
        self.computerBallCountLbl.text = "\(self.comBallsCount)"
        
    }
    
    
    func getRandom() -> Int {
        return Int(arc4random_uniform(10) + 1)
    }
    
    func getBallsCount(ballsCount: Int) {
        self.userBallCountLbl.text = "\(ballsCount)"
        self.computerBallCountLbl.text = "\(ballsCount)"
    }
}

