//
//  ViewController.swift
//  SimpleParallaxScroll
//
//  Created by Suryakant Sharma on 01/09/15.
//  Copyright (c) 2015 Suryakant Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var headerView : UIView!
    @IBOutlet weak var mainView   : UIView!

    @IBOutlet weak var label1     : UILabel!
    @IBOutlet weak var label2     : UILabel!
    
    var listOfTemple : Array<String>!
    
    @IBOutlet weak var listTableView : UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize = CGSizeMake(600, 600+450);
        scrollView.delegate = self;
        headerView.hidden = true;
        listTableView.dataSource = self;
        
        listOfTemple = ["Golden Temple", "Amararama", "Tirupati Balaji", "Mahakal", "Vaishno Devi", "Salkanpur", "Ksheerarama","Manakamana","Draksharama","Amararama", "Tirupati Balaji", "Mahakal", "Vaishno Devi","Ksheerarama","Manakamana","Draksharama","Amararama", "Tirupati Balaji", "Mahakal", "Vaishno Devi","Golden Temple", "Amararama", "Tirupati Balaji", "Mahakal", "Vaishno Devi", "Salkanpur", "Ksheerarama","Manakamana","Draksharama","Amararama", "Tirupati Balaji", "Mahakal", "Vaishno Devi","Ksheerarama","Manakamana","Draksharama","Amararama", "Tirupati Balaji", "Mahakal", "Vaishno Devi"];
        
        listTableView.scrollEnabled = false;
        
//        scrollView.layer.borderColor = UIColor.redColor().CGColor;
//        scrollView.layer.borderWidth = 1.0;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        NSLog(NSStringFromCGPoint(scrollView.contentOffset));
        if(scrollView.contentOffset.y >= 210) {
            headerView.hidden = false;
            view.bringSubviewToFront(headerView);
            label2.hidden = true;
            listTableView.scrollEnabled = true;

            NSLog("Header View Should visible")
        }
        else {
            headerView.hidden = true;
            label2.hidden = false;
            NSLog("Header View should hidden")
            listTableView.scrollEnabled = false;

        }
    }
    
    //MARK: - TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfTemple.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell  = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell;
        cell.textLabel?.text = listOfTemple[indexPath.row];
        cell.imageView?.image = UIImage(named:"temple");
        return cell;
    }

}

