//
//  ViewController.swift
//  ios101
//
//  Created by Ivan Bella on 12/5/22.
//

import UIKit

final class ViewController: UIViewController {

    private lazy var helloWorld = UILabel(frame: .zero)
    private lazy var detailButton = UIButton(type: .roundedRect)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "iOS 101"
        setupView()
    }
}

private extension ViewController {
    func setupView() {
        helloWorld.translatesAutoresizingMaskIntoConstraints = false
        helloWorld.text = "Hello world!"
        helloWorld.textAlignment = .center

        detailButton.translatesAutoresizingMaskIntoConstraints = false
        detailButton.setTitle("Go to Detail", for: .normal)
        detailButton.addTarget(self, action: #selector(goToDetail), for: .touchUpInside)

        let verticalStackView = UIStackView(arrangedSubviews: [helloWorld, detailButton])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical

        view.addSubview(verticalStackView)
        view.addConstraints([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        // TO DO. Create a new UIViewController file called DetailViewController
        // 1. Create a UIStackView with a UITextField, UIButton and a UILabel
        // 2. Tapping the button prints the text in UITextField in the UILabel
        // 1. Add a close button in the navigation bar
        // 2. Implement the function to go dismiss itself

        // TO DO (here). Show modally the DetailViewController when tapping `detailButton`
    }

    @objc func goToDetail() {
        let detailNavigation = UINavigationController(rootViewController: DetailViewController())
        navigationController?.present(detailNavigation, animated: true, completion: nil)
    }
}
