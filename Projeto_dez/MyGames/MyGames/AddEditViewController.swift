
import UIKit

class AddEditViewController: UIViewController {
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfConsole: UITextField!
    @IBOutlet weak var dateReleaseDate: UIDatePicker!
    @IBOutlet weak var dtAddEdit: UIButton!
    @IBOutlet weak var brCover: UIButton!
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    @IBAction func addEditCover(_ sender: UIButton) {
    }
    
    @IBAction func addEditGame(_ sender: UIButton) {
        if game == nil {
            game = Game (context: context)
        }
        game.title = tfTitle.text
        game.releaseDate = dateReleaseDate.date
        
        do{
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
