import Foundation

import UIKit

class MenuViewController : UIViewController {
    
    @IBOutlet weak var menuStart: UIBarButtonItem!
    @IBOutlet weak var seleccionaLabel: UILabel!
    @IBOutlet weak var imagenButton: UIButton!
    @IBOutlet weak var imagen2Button: UIButton!
    @IBOutlet weak var imagen3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuStart.target = self.revealViewController()
            menuStart.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            seleccionaLabel.font = UIFont(name: mTheme.fontName, size: 18)
            seleccionaLabel.textColor = UIColor.redColor()
            seleccionaLabel.layer.shadowColor = UIColor.grayColor().CGColor
            seleccionaLabel.layer.shadowOffset = CGSizeMake(5, 5)
            seleccionaLabel.layer.shadowRadius = 5
            seleccionaLabel.layer.shadowOpacity = 0.7
            
            imagenButton.layer.shadowColor = UIColor.grayColor().CGColor
            imagenButton.layer.shadowOffset = CGSizeMake(5, 5)
            imagenButton.layer.shadowRadius = 5
            imagenButton.layer.shadowOpacity = 1.0
            
            imagen2Button.layer.shadowColor = UIColor.grayColor().CGColor
            imagen2Button.layer.shadowOffset = CGSizeMake(5, 5)
            imagen2Button.layer.shadowRadius = 5
            imagen2Button.layer.shadowOpacity = 1.0
            
            imagen3Button.layer.shadowColor = UIColor.grayColor().CGColor
            imagen3Button.layer.shadowOffset = CGSizeMake(5, 5)
            imagen3Button.layer.shadowRadius = 5
            imagen3Button.layer.shadowOpacity = 1.0
            
        }
        
        title = "Menu"
        
    }
}