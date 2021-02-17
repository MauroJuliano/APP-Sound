//
//  ViewController.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func nextView(_ sender: Any) {
        if let storyboard = UIStoryboard(name: "Player", bundle: nil).instantiateInitialViewController() as? PlayerViewController {
            storyboard.modalPresentationStyle = .fullScreen
            self.present(storyboard, animated: true, completion: nil)
        }
    }
    

}
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

