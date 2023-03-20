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
        let urlImage = URL(string: pricePizza?.imageURL ?? "")
        imagePrice.sd_setImage(with: urlImage)
        labelPriceP.text = "PEQUENA - R$ \(pricePizza?.priceP ?? 0)"
        labelPriceM.text = "MÉDIA - R$ \(pricePizza?.priceM ?? 0)"
        labelPriceG.text = "GRANDE - R$ \(pricePizza?.priceG ?? 0)"
        labelName.text = pricePizza?.name
    }
    
    @IBAction func follow(_ sender: Any) {
        if let rating = self.storyboard?.instantiateViewController(identifier: "rating") as? RatingViewController {
            rating.ratingPizza = self.pricePizza
            self.present(rating, animated: true)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
}
