import UIKit

class FirstViewController: UIViewController {
    fileprivate var secondViewController : SecondViewController!
    
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController = storyboard?.instantiateViewController(withIdentifier: "Second") as? SecondViewController
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
    }

    @IBAction func switchViews(_ sender: Any) {
        secondBuilder()
        if let secondVC = secondViewController {
            UIView.transition(with: self.view, duration: 0.4, options: [.transitionFlipFromRight, .curveEaseInOut], animations: {
                self.switchViewController(to: secondVC)
            }, completion: nil)
        }
    }
}
