import Foundation

import UIKit

class MenuViewController : UIViewController {
    
    @IBOutlet weak var menuStart: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuStart.target = self.revealViewController()
            menuStart.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        title = "Menu"
        
    }
}