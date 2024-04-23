//
//  SecondViewController.swift
//  ikid
//
//  Created by Michaelangelo Labrador on 4/23/24.
//

import UIKit

class SecondViewController: UIViewController {
    fileprivate var firstViewController : FirstViewController!
    
    fileprivate func firstBuilder() {
        if firstViewController == nil {
            firstViewController = storyboard?.instantiateViewController(withIdentifier: "First") as? FirstViewController
        }
    }
    fileprivate func switchViewController(to newViewController: UIViewController?) {
        if let newVC = newViewController {
            // Remove the current child view controller if it exists
            children.forEach {
                $0.willMove(toParent: nil)
                $0.view.removeFromSuperview()
                $0.removeFromParent()
            }
            
            // Add the new child view controller
            addChild(newVC)
            newVC.view.frame = view.bounds  // Ensure it fills the entire parent view
            view.addSubview(newVC.view)
            newVC.didMove(toParent: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func switchView(_ sender: Any) {
        firstBuilder()
        if let secondVC = firstViewController {
            UIView.transition(with: self.view, duration: 0.4, options: [.transitionFlipFromLeft, .curveEaseInOut], animations: {
                self.switchViewController(to: secondVC)
            }, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
