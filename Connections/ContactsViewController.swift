import UIKit

protocol ContactDelegate {
    func addNewContact(contact: Contact)
}

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ContactDelegate {

    @IBOutlet weak var ContactsTableView: UITableView!

    var contacts: [Contact] = []
    var contactsDictionary: [Character: [Contact]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactsTableView.delegate = self
        ContactsTableView.dataSource = self
        
        contacts.append(Contact(name: "Drake Graham", phone: "7320001111", email: "DrakeG@gmail.com", image: UIImage(named: "drake")!))
        contacts.append(Contact(name: "Mark Rober", phone: "7320001111", email: "MarkB@gmail.com", image: UIImage(named: "drake")!))
        contacts.append(Contact(name: "Brad Pitt", phone: "7320001111", email: "BradP@gmail.com", image: UIImage(named: "drake")!))
        contacts.append(Contact(name: "Bill Gates", phone: "7320001111", email: "BillG@gmail.com", image: UIImage(named: "drake")!))
        contacts.append(Contact(name: "Shawn Mendes", phone: "7320001111", email: "ShawnM@gmail.com", image: UIImage(named: "drake")!))
        contacts.append(Contact(name: "Danny Phantom", phone: "7320001111", email: "DannyP@gmail.com", image: UIImage(named: "drake")!))

        sortContactsIntoDictionary()
    }
    
    func sortContactsIntoDictionary(){
        for contact in contacts{
            addToContactsDictionary(insert: contact)
        }
    }
    
    func addToContactsDictionary(insert contact: Contact){
        let name = contact.name
        let firstChar = name[name.startIndex]
        var list = contactsDictionary[firstChar] ?? []
        list.append(contact)
        contactsDictionary[firstChar] = list
    }
    
    @IBAction func didTapContactAddButton(_ sender: Any) {
        performSegue(withIdentifier: "AddNewContactSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AddNewContactSegue"){
            let dest = segue.destination as! AddContactViewController
            dest.addContactDelegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionHeader = contactsDictionary.keys.sorted()[section].uppercased()
        return "\(sectionHeader)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let character = contactsDictionary.keys.sorted()[section]
        let list = contactsDictionary[character]!
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        let character = contactsDictionary.keys.sorted()[indexPath.section]
        let list = contactsDictionary[character]!
        let contact = list[indexPath.row]
        cell.setUpCell(contact: contact)
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func addNewContact(contact: Contact) {
        addToContactsDictionary(insert: contact)
        ContactsTableView.reloadData()
    }
    
    
}
