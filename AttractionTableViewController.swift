//
//  AttractionTableViewController.swift
//  PeekandPop
//
//  Created by Apple28 on 3/2/17.
//  Copyright © 2017 Apple28. All rights reserved.
//

import UIKit

extension AttractionTableViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = tableView.indexPathForRow(at: location),
            let cell = tableView.cellForRow(at: indexPath) else {return nil}
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "AttractionDetailViewController") as? AttractionDetailViewController else {return nil}
        
        detailVC.webSite = webAddresses[indexPath.row]
        detailVC.preferredContentSize = CGSize(width: 0.0, height: 600)
        
        previewingContext.sourceRect = cell.frame
        
        return detailVC

    }
}

class AttractionTableViewController: UITableViewController {
    
    var attractionImages = [String] ()
    var attractionNames = [String] ()
    var webAddresses = [ String] ()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        attractionNames = ["Bukingham Palace", "The Eiffel Tower", "The Grand Canyon", "Windsor Castle", "Empire State Building"]
        webAddresses = ["https://en.wikipedia.org/wiki/Buckingham_Palace", "https://en.wikipedia.org/wiki/Eiffel_Tower", "https://en.wikipedia.org/wiki/Grand_Canyon",
        "https://en.wikipedia.org/wiki/Windsor_Castel", "https://en.wikipedia.org/wiki/Empire_State_Building"]
        attractionImages = ["buckingham_palace.jpg", "eiffel_tower.jpg", "grand_canyon.jpg", "windsor_castle.jpg", "empire_state_building.jpg"]
        tableView.estimatedRowHeight = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return attractionNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttractionIdentifier", for: indexPath) as! AttractionTableViewCell

        let row = indexPath.row
        cell.lblAttraction.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.lblAttraction.text = attractionNames[row]
        cell.imgAttraction.image = UIImage(named: attractionImages[row])
        
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
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
         //Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowDetails" {
            let detailVC = segue.destination as! AttractionDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailVC.webSite = webAddresses[row]
        }
    }
    

}
