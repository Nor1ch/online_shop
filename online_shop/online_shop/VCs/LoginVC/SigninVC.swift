//
//  SigninVC.swift
//  online_shop
//
//  Created by Nor1 on 14.03.2023.
//

import Foundation
import UIKit
import SnapKit

class SigninVC: UIViewController {
    
    private let viewModel: SigninViewModel
    
    init(viewModel: SigninViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var firstNameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = Constants.Color.gray_textfield
        view.font = Constants.Font.signinTextField11
        view.placeholder = "First name"
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        return view
    }()
    private lazy var lastNameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = Constants.Color.gray_textfield
        view.font = Constants.Font.signinTextField11
        view.placeholder = "Last name"
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        return view
    }()
    private lazy var emailTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = Constants.Color.gray_textfield
        view.font = Constants.Font.signinTextField11
        view.placeholder = "Email"
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        return view
    }()
    private lazy var loginLabel: UILabel = {
        let view = UILabel()
        view.text = "Already have an account?"
        view.font = Constants.Font.signinText
        view.textColor = Constants.Color.gray
        view.textAlignment = .right
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Sign in"
        view.textAlignment = .center
        view.font = Constants.Font.signinTitle26
        return view
    }()
    
    private lazy var signinButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        let attr : [NSAttributedString.Key: Any] = [
            .font : Constants.Font.signinButton14 as Any,
            .foregroundColor : Constants.Color.white as Any
        ]
        let title = "Sign in"
        config.titleAlignment = .center
        config.baseBackgroundColor = Constants.Color.violet_button
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer(attr))
        config.background.cornerRadius = 15
        config.cornerStyle = .fixed
        view.configuration = config
        view.addTarget(self, action: #selector(signinTouched), for: .touchUpInside)

        return view
    }()
    private lazy var loginButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.plain()
        let attr : [NSAttributedString.Key: Any] = [
            .font : Constants.Font.signinText as Any,
            .foregroundColor : Constants.Color.violet_button as Any
        ]
        let title = "Log in"
        config.titleAlignment = .center
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer(attr))
        view.configuration = config
        view.addTarget(self, action: #selector(loginTouched), for: .touchUpInside)

        return view
    }()
    private lazy var googleButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.plain()
        let attr : [NSAttributedString.Key: Any] = [
            .font : Constants.Font.signinButtonsVIA12 as Any,
            .foregroundColor : Constants.Color.black as Any
        ]
        let title = "Sign in with Google"
        config.titleAlignment = .center
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer(attr))
        config.imagePlacement = .leading
        config.imagePadding = 11
        config.image = Constants.Image.google
        view.configuration = config

        return view
    }()
    private lazy var appleButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.plain()
        let attr : [NSAttributedString.Key: Any] = [
            .font : Constants.Font.signinButtonsVIA12 as Any,
            .foregroundColor : Constants.Color.black as Any
        ]
        let title = "Sign in with Apple"
        config.titleAlignment = .center
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer(attr))
        config.imagePlacement = .leading
        config.imagePadding = 11
        config.image = Constants.Image.apple
        view.configuration = config

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
        view.addSubview(lastNameTextField)
        view.addSubview(emailTextField)
        view.addSubview(signinButton)
        view.addSubview(loginLabel)
        view.addSubview(loginButton)
        view.addSubview(googleButton)
        view.addSubview(appleButton)
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
        lastNameTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(290)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstNameTextField.snp.bottom).offset(35)
        }
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(290)
            make.centerX.equalToSuperview()
            make.top.equalTo(lastNameTextField.snp.bottom).offset(35)
        }
        signinButton.snp.makeConstraints { make in
            make.width.equalTo(289)
            make.height.equalTo(46)
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(35)
        }
        loginLabel.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.height.equalTo(16)
            make.top.equalTo(signinButton.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(42)
        }
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(15)
            make.left.equalTo(loginLabel.snp.right).inset(3)
            make.top.equalTo(signinButton.snp.bottom).offset(16)
        }
        googleButton.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(220)
            make.centerX.equalToSuperview()
            make.top.equalTo(signinButton.snp.bottom).offset(101)
        }
        appleButton.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(220)
            make.centerX.equalToSuperview()
            make.top.equalTo(googleButton.snp.bottom).offset(30)
        }
    }
    
    @objc private func signinTouched(){
        viewModel.openLogin()
    }
    @objc private func loginTouched(){
        viewModel.openLogin()
    }
}
