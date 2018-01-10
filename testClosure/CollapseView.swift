//
//  CollapseView.swift
//  testClosure
//
//  Created by Ragaie alfy on 1/3/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

class CollapseView: UIViewController,UITableViewDelegate ,UITableViewDataSource
{
   
    var dataSource = [3,4,5,2,6,4]

    @IBOutlet weak var tableViewContent: UITableView!
    
    var open : [Bool]! = [false,false,false,false,false,false]
    var tapGusture : [ExtentUITapGestureRecognizer]! = []
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewContent.dataSource = self
        tableViewContent.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        cell.textLabel?.text = "hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if  tapGusture.count == 0{
            
            return 0
            
        }
        else if tapGusture[section].open == false {
            
            return 0
            
        }
        return dataSource[section]
    }

    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return "welcome"
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        
        var headerCell =  tableView.dequeueReusableCell(withIdentifier: "headerID")?.contentView //as! UITableView
        
        
        let singleTap: ExtentUITapGestureRecognizer = ExtentUITapGestureRecognizer(target: self, action: #selector(CollapseView.clickheader(_:)))
        
        singleTap.numberOfTapsRequired = 1
        singleTap.row = section
        headerCell?.addGestureRecognizer(singleTap)
        
        tapGusture.append(singleTap)
        return headerCell
        
        

    }

    @objc func clickheader(_ sender : ExtentUITapGestureRecognizer){

        
        if tapGusture[sender.row].open == true {
            
            
            tapGusture[sender.row].open = false
            //open[sender.row] = false
            tableViewContent.reloadSections([sender.row], with: .automatic)

        }
        else{
            tapGusture[sender.row].open = true
           //open[sender.row] = true

            tableViewContent.reloadSections([sender.row], with: .automatic)

            
        }
        
       print("Clicked")
        
    }
    
}
