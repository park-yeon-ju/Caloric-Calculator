//
//  FirstViewController.swift
//  Caloric Calculator
//
//  Created by 박연주 on 2022/06/19.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let nextViewController = segue.destination as? SecondViewController else {
                return
            }
            nextViewController.receivedText = textField.text
        }

}
