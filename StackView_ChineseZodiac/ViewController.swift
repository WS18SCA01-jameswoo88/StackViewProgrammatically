//
//  ViewController.swift
//  StackView_ChineseZodiac
//
//  Created by James Chun on 1/2/19.
//  Copyright © 2019 James Chun. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    let dictionary: [[String: Int]] = [
        ["rat": 2008,          "ox": 2009],
        ["tiger": 2010,    "rabbit": 2011],
        ["dragon": 2012,    "snake": 2013],
        ["horse": 2014,      "goat": 2015],
        ["monkey": 2016,  "rooster": 2017],
        ["dog": 2018,         "pig": 2019]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Do any additional setup after loading the view, typically from a nib.
        
        print("dictionary.count = \(dictionary.count)");             //2 because rows contains 2 columns.
        print("dictionary[0].count = \(dictionary[0].count)");       //6 because top row contains 6 rows.
        
        let bigVerticalStackView: UIStackView = UIStackView(); //will contain 3 horizontal stack views
        bigVerticalStackView.axis = .vertical;
        bigVerticalStackView.distribution = .fillEqually;
        bigVerticalStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        for rows in dictionary {
            let horizontalStackView: UIStackView = UIStackView();
            horizontalStackView.axis = .horizontal;
            horizontalStackView.distribution = .fillEqually;
            bigVerticalStackView.addArrangedSubview(horizontalStackView);
            
            let sorted: [(key: String, value: Int)] = rows.sorted {$0.value < $1.value} //sorting dictionary
            
            for (key, value) in sorted {
                guard let image: UIImage = UIImage(named: key) else {
                    return
                }
                let imageView: UIImageView = UIImageView(image: image);
                imageView.contentMode = .scaleAspectFit
                
                let label: UILabel = UILabel();
                label.backgroundColor = .white;
                label.textAlignment = .center;
                label.font = .systemFont(ofSize: 10);
                label.text = "Most recent year of the \(key): \(value)";
                label.layer.borderWidth = 0;
                
                let smallVerticalStackView: UIStackView = UIStackView()
                smallVerticalStackView.axis = .vertical
                smallVerticalStackView.distribution = .fillEqually
                smallVerticalStackView.addArrangedSubview(imageView)
                smallVerticalStackView.addArrangedSubview(label)
                horizontalStackView.addArrangedSubview(smallVerticalStackView);
            }
        }
        
        //Adding title
        
        let title: UILabel = UILabel()
        title.backgroundColor = .red
        title.textAlignment = .center
        title.font = UIFont(name: "Copperplate", size: 30)
        title.textColor = .white
        title.layer.borderWidth = 3
        title.layer.cornerRadius = 20
        title.layer.borderColor = UIColor.red.cgColor
        title.layer.masksToBounds = true
		title.frame = CGRect(x: 50, y: 80, width: 250, height: 40)
        title.center.x = self.view.center.x
        title.text = "Chinese Zodiac"
        view.addSubview(title)

        //Setting stackView contraints to 300.

        let widthConstraint: NSLayoutConstraint = bigVerticalStackView.widthAnchor.constraint(equalToConstant: 400);
        widthConstraint.isActive = true;

        let heightConstraint: NSLayoutConstraint = bigVerticalStackView.heightAnchor.constraint(equalToConstant: 700);
        heightConstraint.isActive = true;
        
        //Center the verticalStackView in the big, white view.

        view.addSubview(bigVerticalStackView);

        let horizontalConstraint: NSLayoutConstraint = bigVerticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor);
        horizontalConstraint.isActive = true;

        let verticalConstraint: NSLayoutConstraint = bigVerticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50);
        verticalConstraint.isActive = true;
    }

}

