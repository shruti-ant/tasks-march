//
//  ViewController.swift
//

/*
 source - https://www.hackingwithswift.com/read/6/overview
 */

import UIKit

class ViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		let label1 = UILabel()
		label1.translatesAutoresizingMaskIntoConstraints = false
		label1.backgroundColor = UIColor.red
		label1.text = "THESE"

		let label2 = UILabel()
		label2.translatesAutoresizingMaskIntoConstraints = false
		label2.backgroundColor = UIColor.cyan
		label2.text = "ARE"

		let label3 = UILabel()
		label3.translatesAutoresizingMaskIntoConstraints = false
		label3.backgroundColor = UIColor.yellow
		label3.text = "SOME"

		let label4 = UILabel()
		label4.translatesAutoresizingMaskIntoConstraints = false
		label4.backgroundColor = UIColor.green
		label4.text = "AWESOME"

		let label5 = UILabel()
		label5.translatesAutoresizingMaskIntoConstraints = false
		label5.backgroundColor = UIColor.orange
		label5.text = "LABELS"

		view.addSubview(label1)
		view.addSubview(label2)
		view.addSubview(label3)
		view.addSubview(label4)
		view.addSubview(label5)

		var previous: UILabel?

		for label in [label1, label2, label3, label4, label5] {
			label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
			label.heightAnchor.constraint(equalToConstant: 88).isActive = true

			if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
			} else {
                // this is the first label
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
            }
            
			previous = label
		}
	}

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

