//
//  ProfileVC.swift
//  online_shop
//
//  Created by Nor1 on 15.03.2023.
//

import Foundation
import UIKit
import SnapKit
import PhotosUI

class ProfileVC: UIViewController {
    private let viewModel: ProfileViewModel
    private var user: UserModel? = nil
    
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
        view.image = Constants.Image.profileimage
        view.clipsToBounds = true
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
        view.addTarget(self, action: #selector(changePhoto), for: .touchUpInside)

        return view
    }()
    private lazy var userNameProfile: UILabel = {
        let view = UILabel()
        view.text = "Satria Adhi Pradana"
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
    
    private lazy var navLabel: UILabel = {
        let view = UILabel()
        view.text = "Profile"
        view.font = Constants.Font.navigationTitle
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
        tableView.delegate = self
        
        view.backgroundColor = Constants.Color.background_white
        view.addSubview(imageUserView)
        view.addSubview(changeButton)
        view.addSubview(userNameProfile)
        view.addSubview(uploadButton)
        view.addSubview(tableView)
        
        navigationItem.titleView = navLabel
        user = UDUser.loadUser()
        if let user = user {
            imageUserView.image = UIImage(data: user.image ?? Data()) ?? Constants.Image.profileimage
            userNameProfile.text = user.name + " " +  user.last_name
        }
    }
    private func makeConstraints(){
        imageUserView.snp.makeConstraints { make in
            make.width.equalTo(61)
            make.height.equalTo(61)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
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
    
    @objc private func changePhoto(){
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
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

extension ProfileVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.cells[indexPath.row]
        if item.type == .logout {
            viewModel.openSignin()
        }
    }
}

extension ProfileVC: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { result, error in
                guard let image = result as? UIImage, error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    UDUser.saveImage(image_data: image.jpegData(compressionQuality: 0) ?? Data())
                    self.imageUserView.image = image
                }
            }
        }
    }
    
    
}

