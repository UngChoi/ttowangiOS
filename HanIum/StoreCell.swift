import UIKit

class StoreCell: UITableViewCell {
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var storeAddress: UILabel!
    @IBOutlet weak var storeKind: UIImageView!
    @IBOutlet weak var storeArea: UILabel!
    
    var onOff:Bool = false
    var index:Int = -1
    @IBAction func onOffAction(sender: AnyObject) {
        self.onOff = !self.onOff
        if self.onOff == true{
            
            if  let image = UIImage(named:"heart"){
                self.heartButton.setImage(image, forState: .Normal)
                if index != -1 {
                    stores[index].heart = true
                }
                
            }
        }
        else{
            if  let image = UIImage(named: "Hearts-50"){
                self.heartButton.setImage(image, forState: .Normal)
                
                if index != -1{
                    stores[index].heart = false
                }
            }
        }
    }
}
