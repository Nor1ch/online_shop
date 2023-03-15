//
//  ProfileVC.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit
import SnapKit

class ProfileVC: UIViewController {
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageUserView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = Constants.Color.gray
        view.layer.borderWidth = 1
        view.layer.borderColor = Constants.Color.violet_button?.cgColor
        view.layer.cornerRadius = 30
        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var changeButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.plain()
        let attr : [NSAttributedString.Key: Any] = [
            .font : Constants.Font.profileChangeButton8 as Any,
            .foregroundColor : Constants.Color.gray as Any
        ]
        let title = "Change photo"
        config.titleAlignment = .center
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer(attr))
        view.configuration = config

        return view
    }()
    private lazy var userNameProfile: UILabel = {
        let view = UILabel()
        view.text = "Cherepanin Ilia"
        view.textAlignment = .center
        view.font = Constants.Font.profileName15
        return view
    }()
    private lazy var uploadButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        let attr : [NSAttributedString.Key: Any] = [
            .font : Constants.Font.profileButton14 as Any,
            .foregroundColor : Constants.Color.white as Any
        ]
        let title = "Upload item"
        config.titleAlignment = .center
        config.baseBackgroundColor = Constants.Color.violet_button
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer(attr))
        config.background.cornerRadius = 15
        config.cornerStyle = .fixed
        config.image = Constants.Image.upload
        config.contentInsets.trailing = 40
        config.imagePadding = 40
        config.imagePlacement = .leading
        view.configuration = config

        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = Constants.Color.background_white
        view.rowHeight = 60
        view.separatorStyle = .none
        view.isScrollEnabled = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
    }
    
    private func setupViews(){
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.dataSource = self
        
        view.backgroundColor = Constants.Color.background_white
        view.addSubview(imageUserView)
        view.addSubview(changeButton)
        view.addSubview(userNameProfile)
        view.addSubview(uploadButton)
        view.addSubview(tableView)
    }
    private func makeConstraints(){
        imageUserView.snp.makeConstraints { make in
            make.width.equalTo(61)
            make.height.equalTo(61)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(52)
        }
        changeButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(10)
            make.centerX.equalToSuperview()
            make.top.equalTo(imageUserView.snp.bottom).offset(6)
        }
        userNameProfile.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(changeButton.snp.bottom).offset(18)
        }
        uploadButton.snp.makeConstraints { make in
            make.width.equalTo(260)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(userNameProfile.snp.bottom).offset(36)
        }
        tableView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(uploadButton.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
    }
}

extension ProfileVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cells.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier) as? ProfileTableViewCell
        let item = viewModel.cells[indexPath.row]
        cell?.setupCell(item: item)
        return cell ?? UITableViewCell()
    }
}

