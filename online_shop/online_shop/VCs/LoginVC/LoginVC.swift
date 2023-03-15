//
//  LoginVC.swift
//  online_shop
//
//  Created by Nor1 on 14.03.2023.
//

import Foundation
import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Sign in"
        view.textAlignment = .center
        view.font = Constants.Font.signinTitle26
        return view
    }()
    
    private lazy var firstNameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = Constants.Color.gray_textfield
        view.font = Constants.Font.signinTextField11
        view.placeholder = "First name"
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        return view
    }()
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = Constants.Color.gray_textfield
        view.font = Constants.Font.signinTextField11
        view.placeholder = "Password"
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        return view
    }()
    private lazy var loginButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        let attr : [NSAttributedString.Key: Any] = [
            .font : Constants.Font.signinButton14 as Any,
            .foregroundColor : Constants.Color.white as Any
        ]
        let title = "Login"
        config.titleAlignment = .center
        config.baseBackgroundColor = Constants.Color.violet_button
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer(attr))
        config.background.cornerRadius = 15
        config.cornerStyle = .fixed
        view.configuration = config
        view.addTarget(self, action: #selector(loginTouched), for: .touchUpInside)

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
    }
    
    private func setupViews(){
        view.backgroundColor = Constants.Color.background_white
        view.addSubview(titleLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    private func makeConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        firstNameTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(290)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
        }
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(290)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstNameTextField.snp.bottom).offset(35)
        }
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(289)
            make.height.equalTo(46)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(100)
        }
    }
    
    @objc private func loginTouched(){
        viewModel.makeTabbar()
    }
}
