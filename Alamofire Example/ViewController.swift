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
	@IBAction func sendRequest(_ sender: UIButton) {
		Alamofire.request("https://jsonplaceholder.typicode.com/photos").responseJSON {
			response in
			guard response.result.isSuccess else {
				print("Ошибка при запросе данных \(String(describing: response.result.error))")
				return
			}
			print(response.value)
		}
	}
/*Alamofire.request("https://jsonplaceholder.typicode.com/photos").responseJSON { response in
guard response.result.isSuccess else {
print("Ошибка при запросе данных \(String(describing: response.result.error))")
return
}
print(response.value)
}
*/
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

