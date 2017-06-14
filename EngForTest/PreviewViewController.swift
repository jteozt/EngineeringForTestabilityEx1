//
//  ViewController.swift
//  EngForTest
//
//  Created by Jason Teo on 14/6/17.
//  Copyright © 2017 Jason Teo. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var document: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.document = Document(identifier: "test identifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openTapped(_ sender: Any) {
        let mode: String
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mode = "view"
        case 1:
            mode = "edit"
        default:
            fatalError("Impossible Case")
        }
        
        let url = URL(string: "myappscheme://open?id=\(document!.identifier)&mode=\(mode)")!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("url error")
        }
    }

}











