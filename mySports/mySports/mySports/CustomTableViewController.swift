//
//  CustomTableViewController.swift
//  mySports
//
//  Created by ALOC SP05816 on 06/12/2017.
//  Copyright © 2017 Philipe Alves de Oliveira e SIlva. All rights reserved.
//

import UIKit
import mySportsData

class CustomTableViewController: UITableViewController {

    var activityRecords = [Int: [ActivityRecord]]()
    var activityRecordDetail = [Int: [ActivityRecordDetail]]()
    var activityRecordSelected: ActivityRecordDetail?
    
    override func viewDidLoad() {
        self.activityRecords = generateActivityRecord(withMaxSections: 2, andMaxRows: 10)
        self.activityRecordDetail = generateActivityRecord(withActivities: self.activityRecords)
        tableView.estimatedRowHeight = 60 // Tamanho aproximado da célula
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.activityRecords.count == 0 ? 1 : self.activityRecords.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activityRecords[section]?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row >= (self.activityRecords[indexPath.section]?.count)! {
            return tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        }
        
        guard let content = self.activityRecords[indexPath.section]?[indexPath.row] else {
            return tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        }
        
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.lblDistance.text = content.distance
        cell.lblDuration.text = content.duration
        cell.lblDate.text = content.date
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.activityRecordSelected = self.activityRecordDetail[indexPath.section]![indexPath.row]
        self.tableView.deselectRow(at: indexPath, animated: false)
        self.performSegue(withIdentifier: "activityDetailSegue", sender: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ActivityRecordDetailViewController {
            dest.activityRecord = self.activityRecordSelected
        }
    }

}
