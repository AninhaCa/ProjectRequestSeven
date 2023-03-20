//
//  PriceViewController.swift
//  ProjectRequestSeven
//
//  Created by Ana Paula Silva de Sousa on 19/03/23.
//

import UIKit

class PriceViewController: UIViewController {

    @IBOutlet var labelName: UILabel!
    @IBOutlet var imagePrice: UIImageView!
    @IBOutlet var labelPriceM: UILabel!
    @IBOutlet var labelPriceG: UILabel!
    @IBOutlet var labelPriceP: UILabel!
    
    var pricePizza: PizzaElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func follow(_ sender: Any) {
    }
    
    @IBAction func back(_ sender: Any) {
    }
}
