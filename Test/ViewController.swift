import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var foreground: UIImageView!
    @IBOutlet var menubutton: UIButton!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menubutton.layer.cornerRadius = menubutton.frame.size.width / 2
        applyMotionEffect(toView: imageView, magnitude: 15)
        applyMotionEffect(toView: foreground, magnitude: -10)
        applyMotionEffect(toView: menubutton, magnitude: -10)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menubutton.center
        transition.circleColor = menubutton.backgroundColor!
        
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menubutton.center
        
        return transition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func applyMotionEffect (toView view:UIView, magnitude:Float){
        let xmotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xmotion.minimumRelativeValue = -magnitude
        xmotion.maximumRelativeValue = magnitude
        
        let ymotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        ymotion.minimumRelativeValue = -magnitude
        ymotion.maximumRelativeValue = magnitude
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xmotion, ymotion]
            
        view.addMotionEffect(group)
    }


}

