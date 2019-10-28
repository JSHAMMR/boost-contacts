//
//  DataProvider
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import RealmSwift
class ContactCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    
}
class DataProvider: NSObject, UITableViewDataSource , UITableViewDelegate {

    fileprivate var contacts:  Results<UserContact>!
    fileprivate var routerProvider:  IContactsRouter?

    
    
    
    override init() {
    }
    init(toItems items: Results<UserContact>, router:IContactsRouter) {
        contacts = items
        routerProvider = router

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell

        let item = contacts[indexPath.row]
        
        cell.lbName.text = "\(item.firstName) \(item.lastName)"

         return cell
    }
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = contacts[indexPath.row]

        
        routerProvider!.navigateToDetails(id: item.id,action: Action.update)
    }

}
