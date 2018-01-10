//
//  TestCollapseViewController.swift
//  CollapesTableView
//
//  Created by Ragaie alfy on 1/8/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

class TestCollapseViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
  
    
// cell id ----->  cellIDTest
    @IBOutlet weak var tableViewData: CollapseTableChtarView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewData.collapseDelegate = self

        
        tableViewData.collapseDataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellIDTest", for: indexPath)
        
        cell.textLabel?.text = "hello"
        return cell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //headerID
        
       return tableView.dequeueReusableCell(withIdentifier: "headerID")?.contentView
    }

}
