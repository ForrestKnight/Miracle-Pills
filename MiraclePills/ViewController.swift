//
//  ViewController.swift
//  MiraclePills
//
//  Created by Abdurrahman on 9/24/16.
//  Copyright © 2016 AR Ehsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var statesPickerView: UIPickerView!
	@IBOutlet weak var stateLabel: UILabel!
	@IBOutlet weak var choose: UIButton!
	
	// Textfields
	@IBOutlet weak var nameTxt: UITextField!
	@IBOutlet weak var addressTxt: UITextField!
	@IBOutlet weak var zipcodeTxt: UITextField!
	@IBOutlet weak var cityTxt: UITextField!
	@IBOutlet weak var countryTxt: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.statesPickerView.delegate = self
		self.statesPickerView.dataSource = self
	}
	
	@IBAction func chooseBtnPressed(_ sender: AnyObject) {
		statesPickerView.isHidden = false
		appearance(hide: true)
	}
	
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
	func appearance(hide: Bool) {
		if hide {
			nameTxt.isHidden = true
			addressTxt.isHidden = true
			zipcodeTxt.isHidden = true
			cityTxt.isHidden = true
			countryTxt.isHidden = true
		} else {
			nameTxt.isHidden = false
			addressTxt.isHidden = false
			zipcodeTxt.isHidden = false
			cityTxt.isHidden = false
			countryTxt.isHidden = false
		}
	}
	
	func checkTextFields() -> Bool {
		if nameTxt.text != "" && addressTxt.text != "" && zipcodeTxt.text != "" && cityTxt.text != "" && countryTxt.text != "" {
			return true
		} else {
			return false
		}
	}
	
	func clearTextFields() {
		nameTxt.text = ""
		addressTxt.text = ""
		zipcodeTxt.text = ""
		cityTxt.text = ""
		countryTxt.text = ""
	}
	
	@IBAction func buy(_ sender: AnyObject) {
		if checkTextFields() {
			let successVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "success") as! SuccessViewController
			self.addChildViewController(successVC)
			successVC.view.frame = self.view.frame
			self.view.addSubview(successVC.view)
			successVC.didMove(toParentViewController: self)
			self.view.endEditing(true)
			clearTextFields()
		} else {
			let errorVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "error") as! ErrorViewController
			self.addChildViewController(errorVC)
			errorVC.view.frame = self.view.frame
			self.view.addSubview(errorVC.view)
			errorVC.didMove(toParentViewController: self)
		}
	}
	
	@IBAction func infoBtnPressed(_ sender: AnyObject) {
		let infoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "info") as! InfoViewController
		self.addChildViewController(infoVC)
		infoVC.view.frame = self.view.frame
		self.view.addSubview(infoVC.view)
		infoVC.didMove(toParentViewController: self)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	override func resignFirstResponder() -> Bool {
		self.view.endEditing(true)
		return true
	}
	
}

extension ViewController : UIPickerViewDelegate {
	
}

extension ViewController : UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return states.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return states[row]
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		stateLabel.text = states[row]
		statesPickerView.isHidden = true
		appearance(hide: false)
	}
}





