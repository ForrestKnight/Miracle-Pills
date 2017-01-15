//
//  ErrorViewController.swift
//  MiraclePills
//
//  Created by Abdurrahman on 9/27/16.
//  Copyright © 2016 AR Ehsan. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
		self.showAnimate()
	}
	
	@IBAction func close(_ sender: AnyObject) {
		self.removeAnimate()
	}
	
	func showAnimate() {
		self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
		self.view.alpha = 0.0;
		UIView.animate(withDuration: 0.2, animations: {
			self.view.alpha = 1.0
			self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		})
	}
	
	func removeAnimate() {
		UIView.animate(withDuration: 0.2, animations: {
			self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
			self.view.alpha = 0.0;
			}, completion:{(finished : Bool)  in
				if (finished)
				{
					self.view.removeFromSuperview()
				}
		})
	}

}
