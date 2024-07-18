import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rulerView = PZXSlidingRulerView(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 150))
        rulerView.maxValue = 200
        rulerView.unitValue = 1
        
        self.view.addSubview(rulerView)
    }
}
