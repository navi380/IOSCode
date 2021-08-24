//
//  DetailViewController.swift
//  FirstApp
//
//  Created by Navi on 8/3/21.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var postData : Postmodel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = postData?.title
        self.bodyLabel.text = postData?.body
        // Do any additional setup after loading the view.
    }
    
    
}

