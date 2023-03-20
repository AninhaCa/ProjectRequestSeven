//
//  ViewController.swift
//  ProjectRequestSeven
//
//  Created by Ana Paula Silva de Sousa on 19/03/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var arrayPizza: Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        requestPizza()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyCustomXIBCell", bundle: nil), forCellReuseIdentifier: "cellXIB")
    }
    
    func requestPizza() {
        AF.request("https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/pizza", method: .get).response { response in
            let pizza = try? JSONDecoder().decode(Pizza.self, from: response.data ?? Data())
            self.arrayPizza = pizza
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPizza?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellXIB", for: indexPath) as? MyCustomXIBCell {
            cell.setupXIB(pizzaElement: arrayPizza?[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let price = self.storyboard?.instantiateViewController(identifier: "price") as? PriceViewController {
            price.pricePizza = self.arrayPizza?[indexPath.row]
            self.present(price, animated: true)
        }
    }
}
