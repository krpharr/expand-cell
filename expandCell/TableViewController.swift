//
//  TableViewController.swift
//  expandCell
//
//  Created by Randall Pharr on 4/10/21.
//

import UIKit

class Note{
    var title: String!
    var createdAt: Date!
    var seen = Bool.random()
    
    init(title: String){
        self.title = title
        self.createdAt = Date()
    }
}

var notes = [Note(title: "Lorem ipsum dolor sit amet."),Note(title: "Lorem ipsum dolor sit."),Note(title: "Lorem ipsum"),Note(title: "Lorem ipsum dolor sit amet."),Note(title: "Lorem ipsum dolor sit."),Note(title: "Lorem"),Note(title: "Lorem ipsum dolor."),Note(title: "Lorem ipsum dolor sit amet."),Note(title: "Lorem ipsum dolor sit amet."),Note(title: "Lorem ipsum dolor sit.")]



class TableViewController: UITableViewController {
    

    var selectedIndex = -1
    var isCollasped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableView.automaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as? ListNotesTableViewCell {
            let n = notes[indexPath.row]
            cell.noteTitleLabel.text = n.title
            let dateFormatter = DateFormatter()
            cell.note = n
            cell.owner = self
            dateFormatter.dateFormat = "E, d MMM yyyy h:mm:ss a"
            cell.noteModificationTimeLabel.text = dateFormatter.string(from: n.createdAt)
            cell.seenImageView.image = n.seen ? cell.seenImage : cell.unseenImage
            return cell
        }
        return UITableViewCell()

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath.row && self.isCollasped {
//            self.isCollasped.toggle()
            return 166
        }else {
//            self.isCollasped.toggle()
            return 100
        }

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath: \(indexPath)  selectedIndex: \(selectedIndex)     isCollapsed: \(isCollasped)")
        self.tableView.deselectRow(at: indexPath, animated: true)
        if self.selectedIndex == indexPath.row {
            self.isCollasped.toggle()
        }else {
            self.isCollasped = true
        }
        self.selectedIndex = indexPath.row
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as? ListNotesTableViewCell {
//            cell.note = notes[indexPath.row]
//            cell.owner = self
//        }
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
