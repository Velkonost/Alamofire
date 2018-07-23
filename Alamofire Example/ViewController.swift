//
//  ViewController.swift
//  Alamofire Example
//
//  Created by Artem Klimenko on 23.07.18.
//  Copyright © 2018 velkonost. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
	fileprivate var items = [Item]()
	@IBOutlet weak var tableView: UITableView!
	
	@IBAction func sendRequest(_ sender: UIButton) {
		Alamofire.request("https://jsonplaceholder.typicode.com/photos").responseJSON {
			response in
			guard response.result.isSuccess else {
				print("Ошибка при запросе данных \(String(describing: response.result.error))")
				return
			}
			
			guard let arrayOfItems = response.result.value as? [[String: AnyObject]] else {
				return
			}
			
			for itm in arrayOfItems {
				let item = Item(albumId: itm["albumId"] as! Int, id: itm["id"] as! Int, title: itm["title"] as! String, url: itm["url"] as! String)
				self.items.append(item)
			}
			
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

class ItemCell: UITableViewCell {
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var urlLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var albumIdLabel: UILabel!
	
}

struct Item {
	let albumId: Int
	let id: Int
	let title: String
	let url: String
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ItemCell
		configureCell(cell: cell, for: indexPath)
		
		return cell
	}
	
	private func configureCell(cell: ItemCell, for indexPath: IndexPath) {
		let item = items[indexPath.row]
		cell.idLabel.text = "\(item.id)"
		cell.albumIdLabel.text = "\(item.albumId)"
		cell.urlLabel.text = "\(item.url)"
		cell.titleLabel.text = "\(item.title)"
	}
}








