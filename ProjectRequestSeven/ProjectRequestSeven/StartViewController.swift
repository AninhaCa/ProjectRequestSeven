//
//  StartViewController.swift
//  ProjectRequestSeven
//
//  Created by Ana Paula Silva de Sousa on 19/03/23.
//

import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func start(_ sender: Any) {
        if let table = self.storyboard?.instantiateViewController(identifier: "table") {
            self.present(table, animated: true)
        }
    }
}
