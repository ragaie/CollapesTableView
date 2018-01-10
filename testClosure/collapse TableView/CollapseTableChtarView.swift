//
//  CollapseTableChtarView.swift
//  CollapesTableView
//
//  Created by Ragaie alfy on 1/8/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit


class CollapseTableChtarView: UITableView,UITableViewDelegate,UITableViewDataSource {


    
    
 
    var  collapseDataSource : UITableViewDataSource!
  
    var collapseDelegate : UITableViewDelegate!
    var sectionsStates : NSMutableArray! = []
    var tapGusture : [ExtentUITapGestureRecognizer]! = []

   

    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
       // super.delegate = self
        //super.dataSource = self
       // fatalError("init(coder:) has not been implemented")
        
        super.addObserver(self, forKeyPath:  #keyPath(UITableView.delegate), options: [.old, .new], context: nil)
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(UITableView.delegate) {
            // Update Time Label
            //timeLabel.text = configurationManager.updatedAt
  
        print("value changed ")
        }
    }
//    override func draw(_ rect: CGRect) {
//
//        super.superview?.draw(rect)
//       // super.delegate = self
//        //super.dataSource = self
//    }
//
//    override init(frame: CGRect, style: UITableViewStyle) {
//
//        super.init(frame: frame, style: style)
//
//        super.delegate = self
//        super.dataSource = self
//
//    }


    
    func setDelegate(newDelegate : UITableViewDelegate){
        
        self.collapseDelegate = newDelegate
        super.delegate = self.collapseDelegate
        
    }
 
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        
        if self.collapseDataSource.responds(to: aSelector){
            
            return self.collapseDataSource
            
        }
        
        if self.collapseDelegate.responds(to: aSelector){
            
            return self.collapseDelegate
            
        }
        return nil
    }
    
    override func responds(to aSelector: Selector!) -> Bool {
        
        if sel_isEqual(aSelector, #selector(tableView(_:viewForHeaderInSection:))){
            return self.collapseDelegate.responds(to: aSelector)
            
        }
        return true
      //  return super.responds(to: aSelector) || self.collapseDataSource.responds(to:aSelector) || self.collapseDelegate.responds(to:aSelector)
    }
    
    
    /// delegate
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if  sectionsStates.count == 0{
//
//            return 0
//
//        }
//        else if (sectionsStates[section] as! Bool) == false {
//
//            return 0
//
//        }
        
        
        if  tapGusture.count == 0{
            
            return 0
            
        }
        else if tapGusture[section].open == false {
            
            return 0
            
        }
        
        
       // return [self.collapseDataSource tableView:tableView numberOfRowsInSection:section];
      return  self.collapseDataSource.tableView(tableView, numberOfRowsInSection: section)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell : UITableViewCell =  self.collapseDataSource.tableView(tableView, cellForRowAt: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       // UIView* view = [self.collapseDelegate tableView:tableView viewForHeaderInSection:section];

        
        var view : UIView! = self.collapseDelegate.tableView!(tableView, viewForHeaderInSection: section)
        
        
        
      //  #selector(controller.singleTapAction(withSender:)
        let singleTap: ExtentUITapGestureRecognizer = ExtentUITapGestureRecognizer(target: self, action: #selector(self.clickheader(withSender:)))
        
        singleTap.numberOfTapsRequired = 1
        singleTap.row = section
        view.addGestureRecognizer(singleTap)
        
        tapGusture.append(singleTap)
        return view
    }
   
    
    @objc func clickheader(withSender sender : ExtentUITapGestureRecognizer){
        
        
        if tapGusture[sender.row].open == true {
            
            
            tapGusture[sender.row].open = false
            //open[sender.row] = false
            self.reloadSections([sender.row], with: .automatic)
            
        }
        else{
            tapGusture[sender.row].open = true
            //open[sender.row] = true
            
            self.reloadSections([sender.row], with: .automatic)
            
            
        }
        
        print("Clicked")
        
    }
    
    
}
