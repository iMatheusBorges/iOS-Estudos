
import UIKit
import CoreData

extension UIViewController {
    
    var context: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
