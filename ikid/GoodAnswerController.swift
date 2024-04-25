//
//  GoodAnswerController.swift
//  ikid
//
//  Created by Michaelangelo Labrador on 4/23/24.
//

import UIKit

class GoodAnswerController: UIViewController {

    
    private var currentChildViewController: UIViewController?
    private var secondViewController: GoodJokeController?

   
    
    private func switchViewController(to newViewController: UIViewController) {
        // Remove the old child view controller if it exists
        if let existingChild = currentChildViewController {
            existingChild.willMove(toParent: nil)
            existingChild.view.removeFromSuperview()
            existingChild.removeFromParent()
        }

        // Add the new child view controller
        addChild(newViewController)
        newViewController.view.frame = view.bounds  // Ensure it fills the entire parent view
        view.addSubview(newViewController.view)
        newViewController.didMove(toParent: self)
        
        // Update the current child reference
        currentChildViewController = newViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        secondViewController = instantiate(id: "Good Joke")
    }

    @IBAction func switchViews(_ sender: Any) {
        if let secondVC = secondViewController {
            UIView.transition(with: self.view, duration: 0.4, options: [.transitionFlipFromRight, .curveEaseInOut], animations: {
                self.switchViewController(to: secondVC)
            }, completion: nil)
        }
    }

    private func instantiate<T: UIViewController>(id: String) -> T? {
        return storyboard?.instantiateViewController(withIdentifier: id) as? T
    }

}
