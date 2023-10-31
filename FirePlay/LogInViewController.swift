
import UIKit

class LogInViewController: UIViewController {
    
    var titleLabel: UILabel?
    var emailTextField : UITextField?
    var password : UITextField?
    var buttonSignIn : UIButton?
    var backButton : UIButton?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:114/255, green: 47/255, blue: 55/255, alpha: 1) //.backgroundBrownColor
        setupUI()
    }
    
    func setupUI(){
        titleLabel = UILabel(frame: CGRect(x: 0, y: 100, width: width , height: 60 ))
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = UIColor(red:245/255, green: 245/255, blue: 220/255, alpha: 1)
        titleLabel?.font = UIFont(name: "Marker Felt", size: 50)
        titleLabel?.text = "LOG IN"
        view.addSubview(titleLabel!)
        

        emailTextField = UITextField(frame: CGRect(x: 50, y: 200, width: 200 , height: 40 ))
        emailTextField?.placeholder = "here email"
        emailTextField?.backgroundColor = .white
        emailTextField?.layer.cornerRadius = 5
        emailTextField?.layer.borderColor = UIColor.black.cgColor
        view.addSubview(emailTextField!)
        
        emailTextField = UITextField(frame: CGRect(x: 50, y: 300, width: 200 , height: 40 ))
        emailTextField?.placeholder = "here password"
        emailTextField?.backgroundColor = .white
        emailTextField?.layer.cornerRadius = 5
        emailTextField?.layer.borderColor = UIColor.black.cgColor
        view.addSubview(emailTextField!)
        
        let buttonSignIn = UIButton(frame: .zero)
        buttonSignIn.backgroundColor = UIColor(red:222/255, green: 184/255, blue: 135/255, alpha: 1)
        buttonSignIn.setTitle("   Next   ", for: .normal)
        buttonSignIn.setTitleColor(.white, for: .normal)
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        buttonSignIn.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        view.addSubview(buttonSignIn)
        self.buttonSignIn = buttonSignIn
        
        NSLayoutConstraint.activate([
            buttonSignIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSignIn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
    
    
    @objc func goToNext() {
        let nextView = MoviesViewController()
        nextView.modalPresentationStyle = .fullScreen
        present(nextView, animated: true, completion: nil)
    }
            
    @objc func goBack(){
        dismiss(animated: true)
    }
}
