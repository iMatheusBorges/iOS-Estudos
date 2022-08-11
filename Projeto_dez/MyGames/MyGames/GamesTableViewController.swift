
import CoreData
import UIKit

class GamesTableViewController: UITableViewController {
    
    var fetchdResultController: NSFetchedResultsController<Game>!
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Você não tem jogos cadastrados"
        label.textAlignment = .center
        
        loadGames()
    }
    
    func loadGames() {
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        let sortDescritor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescritor]
        
        fetchdResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchdResultController.delegate = self
        
        do{
            try fetchdResultController.performFetch()
        }catch {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = fetchdResultController.fetchedObjects?.count ?? 0
        
        tableView.backgroundView = count == 0 ? label: nil
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GameTableViewCell
        
        guard let game = fetchdResultController.fetchedObjects?[indexPath.row] else {
            return cell
        }

        cell.prepare(with: game)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GamesTableViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            break
        default:
            tableView.reloadData()
        }
    }
}
