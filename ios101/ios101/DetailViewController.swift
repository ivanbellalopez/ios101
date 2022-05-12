//
//  ViewController.swift
//  ios101
//
//  Created by Ivan Bella on 12/5/22.
//

import UIKit

final class DetailViewController: UIViewController {

    private lazy var textField = UITextField(frame: .zero)
    private lazy var label = UILabel(frame: .zero)
    private lazy var printButton = UIButton(type: .roundedRect)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detail"
        setupView()
    }
}

private extension DetailViewController {
    func setupView() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissView))
        navigationItem.rightBarButtonItem = closeButton

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Type here..."
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Output goes here"
        label.textAlignment = .center

        printButton.translatesAutoresizingMaskIntoConstraints = false
        printButton.setTitle("Print", for: .normal)
        printButton.addTarget(self, action: #selector(printText), for: .touchUpInside)

        let verticalStackView = UIStackView(arrangedSubviews: [textField, printButton, label])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually

        view.addSubview(verticalStackView)
        view.addConstraints([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc func printText() {
        label.text = textField.text
    }

    @objc func dismissView() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
