//
//  SecondViewController.swift
//  Caloric Calculator
//
//  Created by 박연주 on 2022/06/19.
//

import UIKit

class SecondViewController: UIViewController {
    var receivedText: String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            textLabel.text = receivedText
        }

}
