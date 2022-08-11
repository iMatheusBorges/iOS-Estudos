


import CoreData

class ConsolesManager  {
    static let shared = ConsolesManager()
    var consoles: [Console] = []
    
    func loadConsoles(with context: NSManagedObjectContext ) {
        let fetchRequest: NSFetchRequest<Console> = Console.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do{
            consoles = try context.fetch(fetchRequest)
        }catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteConsole(index: Int, context: NSManagedObjectContext) {
        let console = consoles[index]
        context.delete(console)
        do{
            try context.save()
        }catch {
            print(error.localizedDescription)
        }
    }
    
    private init() {
        
    }
}



