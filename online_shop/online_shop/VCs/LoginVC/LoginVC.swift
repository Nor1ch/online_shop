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
    private var user: UserModel?
    
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
        view.rightView = hiddeView
        view.rightViewMode = .always
        return view
    }()
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = Constants.Color.gray_textfield
        view.font = Constants.Font.signinTextField11
        view.placeholder = "Password"
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        view.isSecureTextEntry = true
        view.rightView = hiddenButton
        view.rightViewMode = .always
        return view
    }()
    private lazy var hiddeView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 24))
        return view
    }()
    private lazy var hiddenButton: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 24))
        let button = UIButton()
        button.frame = CGRect(x: -10, y: 0, width: 20, height: 24)
        button.setImage(Constants.Image.hidden, for: .normal)
        button.addTarget(self, action: #selector(hiddenTouched), for: .touchUpInside)
        view.addSubview(button)
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
    
    private lazy var errorValidate: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = Constants.Font.signinTextField11
        view.textColor = Constants.Color.red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        user = UDUser.loadUser()
    }
    
    private func setupViews(){
        view.backgroundColor = Constants.Color.background_white
        view.addSubview(titleLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(errorValidate)
        
        firstNameTextField.delegate = self
        passwordTextField.delegate = self
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
        errorValidate.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(25)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(1)
        }
    }
    
    private func validatePass(){
        errorValidate.text = "Incorrect login or password"
        errorValidate.isHidden = false
    }
    
    @objc private func hiddenTouched(){
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
    @objc private func loginTouched(){
        
        if let name = firstNameTextField.text, let password = passwordTextField.text {
            if name == user?.name && password == user?.password {
                viewModel.makeTabbar()
            } else {
                validatePass()
            }
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        errorValidate.isHidden = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
