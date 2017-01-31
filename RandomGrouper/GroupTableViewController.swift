//
//  GroupTableViewController.swift
//  RandomGrouper
//
//  Created by Lydia Ho on 1/26/17.
//  Copyright © 2017 lydwho. All rights reserved.
//

import UIKit

class GroupTableViewController: UITableViewController {
    //MARK: Properties
    
    var groups = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the sample data
        loadSampleGroups()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "GroupTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GroupTableViewCell else {
            fatalError("The dequeued cell is not an instance of GroupTableViewCell")
        }
        
        // Fetches the appropriate group for the data source layout
        let group = groups[indexPath.row]
        cell.groupLabel.text = group.name
        cell.photoImageView.image = group.photo
        cell.ratingControl.rating = group.rating
        
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
    
    //MARK: Private Methods
    private func loadSampleGroups() {
        let photo1 = UIImage(named: "group1")
        let photo2 = UIImage(named: "group2")
        let photo3 = UIImage(named: "group3")
        
        guard let person1 = Person(name: "Hien", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate group1")
        }
        guard let person2 = Person(name: "Aidan", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate group2")
        }
        
        guard let person3 = Person(name: "Roger", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate group3")
        }
        
        groups += [person1, person2, person3]
    }
    
    //MARK: Actions
    @IBAction func unwindToGroupList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as?
            GroupViewController, group = sourceViewController.group {
            // Add a new group 
            let newIndexPath = IndexPath(row: groups.count, section: 0)
            groups.append(group)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}
