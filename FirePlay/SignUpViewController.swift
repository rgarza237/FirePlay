
import UIKit

class SignUpViewController: UIViewController {
    
    var titleLabel: UILabel?
    var signInContainer : UIView?
    var emailTextField : UITextField?
    var nameTextField : UITextField?
    var passwordTextField : UITextField?
    var icon1 : UIImageView?
    let paddingLeft : CGFloat = 30
    var backButton : UIButton?
    var saveButton : UIButton?
    var width = UIScreen.main.bounds.width
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:114/255, green: 47/255, blue: 55/255, alpha: 1)
        initUI()
        titleLabel = UILabel(frame: CGRect(x: 0, y: 100, width: width , height: 60 ))
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = UIColor(red:245/255, green: 245/255, blue: 220/255, alpha: 1)
        titleLabel?.font = UIFont(name: "Marker Felt", size: 50)
        titleLabel?.text = "SIGN UP"
        view.addSubview(titleLabel!)
    }
    
    
    func initUI(){
        

        //Setting my UIView contrainer
        //signInContainer = UIView(frame: CGRect(x: 50, y: 150, width: 300, height: 150))
        signInContainer = UIView()
        signInContainer?.backgroundColor = UIColor(red:114/255, green: 47/255, blue: 55/255, alpha: 1)
        view.addSubview(signInContainer!)
        
        signInContainer?.translatesAutoresizingMaskIntoConstraints = false

        signInContainer?.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
       signInContainer?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
       signInContainer?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
       signInContainer?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400).isActive = true

        
//      nameTextField = UITextField(frame: CGRect(x: 40, y: 10, width: 230, height: 35))
        nameTextField = UITextField()
        nameTextField?.backgroundColor = .white
        nameTextField?.borderStyle = .roundedRect
        nameTextField?.placeholder = "  Add your name"
        nameTextField?.layer.cornerRadius = 5
        nameTextField?.layer.borderColor = UIColor.black.cgColor
        //signInContainer?.addSubview(nameTextField!)
        view.addSubview(nameTextField!)
        
        nameTextField?.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField?.topAnchor.constraint(equalTo: signInContainer!.topAnchor, constant: 150).isActive = true
        nameTextField?.leadingAnchor.constraint(equalTo: signInContainer!.leadingAnchor, constant: 55).isActive = true
        nameTextField?.trailingAnchor.constraint(equalTo: signInContainer!.trailingAnchor, constant: -45).isActive = true
        
        
//        nameTextField?.centerYAnchor.constraint(equalTo: signInContainer!.centerYAnchor, constant: 100).isActive = true
//        nameTextField?.centerXAnchor.constraint(equalTo: signInContainer!.centerXAnchor, constant: 100).isActive = true
//        nameTextField?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
//        nameTextField?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
//        nameTextField?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
//
      
        
        //emailTextField = UITextField(frame: CGRect(x: 40, y: 60, width: 230, height: 35))
        emailTextField = UITextField()
        emailTextField?.backgroundColor = .white
        emailTextField?.borderStyle = .roundedRect
        emailTextField?.placeholder = "Add your e-mail"
        emailTextField?.layer.cornerRadius = 5
        emailTextField?.layer.borderColor = UIColor.black.cgColor
        view.addSubview(emailTextField!)
        
        emailTextField?.translatesAutoresizingMaskIntoConstraints = false
        emailTextField?.topAnchor.constraint(equalTo: signInContainer!.topAnchor, constant: 200).isActive = true
        //emailTextField?.centerXAnchor.constraint(equalTo: nameTextField!.centerXAnchor, constant: 0).isActive = true
        emailTextField?.leadingAnchor.constraint(equalTo: signInContainer!.leadingAnchor, constant: 55).isActive = true
        emailTextField?.trailingAnchor.constraint(equalTo: signInContainer!.trailingAnchor, constant: -45).isActive = true
        
        
        passwordTextField = UITextField(frame: CGRect(x: 40, y: 110, width: 230, height: 35))
        passwordTextField?.backgroundColor = .white
        passwordTextField?.placeholder = "Add your password"
        passwordTextField?.layer.cornerRadius = 15
        passwordTextField?.borderStyle = .roundedRect
        passwordTextField?.layer.borderColor = UIColor.black.cgColor
        signInContainer?.addSubview(passwordTextField!)
        
        passwordTextField?.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField?.topAnchor.constraint(equalTo: signInContainer!.topAnchor, constant: 250).isActive = true
        //emailTextField?.centerXAnchor.constraint(equalTo: nameTextField!.centerXAnchor, constant: 0).isActive = true
        passwordTextField?.leadingAnchor.constraint(equalTo: signInContainer!.leadingAnchor, constant: 55).isActive = true
        
        icon1 = UIImageView(frame: CGRect(x: 5, y: 10, width: 35 , height: 35))
        //icon1?.image = UIImage(systemName: "person.badge.plus")
        icon1?.image = UIImage(named: "hombre")
        signInContainer?.addSubview(icon1!)
        
        let saveButton = UIButton(frame: .zero)
        saveButton.backgroundColor = UIColor(red:222/255, green: 184/255, blue: 135/255, alpha: 1)
        saveButton.setTitle("  Next ", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(saveButton)
        self.saveButton = saveButton
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let backButton = UIButton(frame: .zero)
        backButton.backgroundColor = UIColor(red:222/255, green: 184/255, blue: 135/255, alpha: 1)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(goBack),for:
                .touchUpInside)
        view.addSubview(backButton)
        self.backButton = backButton
        
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            backButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    @objc func goBack(){
        let backView = ViewController()
        backView.modalPresentationStyle = .fullScreen
        present(backView, animated: true, completion: nil)
    }
}
