
import UIKit

class ViewController: UIViewController {

    var firePlayImage : UIImageView?
    var newLabel : UILabel?
    var signInButton : UIButton?
    var signUpButton : UIButton?
    var newImage : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBrownColor
        initElements()
        
    }
    
    func initElements(){
        
/*
        //Step 1 : inicializar variable
        newLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 250, height: 250))
        //Step 2: config de atributos
        newLabel?.textColor = .white
        newLabel?.text = "FIREPLAY :) "
        newLabel?.font = UIFont(name: "Arial Bold", size: 28)
        // Step 3: agregar ala vista
        view.addSubview(newLabel!)
 
        Este UILabel sera remplazado por el UIImageView de abajo :)
 
*/
        firePlayImage = UIImageView()//  (frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        firePlayImage?.image = UIImage(named: "appName")
        firePlayImage?.layer.masksToBounds = true
        firePlayImage?.contentMode = .scaleAspectFit
        view.addSubview(firePlayImage!)
        
        firePlayImage?.translatesAutoresizingMaskIntoConstraints = false
        firePlayImage?.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        firePlayImage?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        firePlayImage?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        
        
        signUpButton = UIButton(frame: CGRect(x: Constants.leftPadding, y: 350, width: 200, height: 50))
        signUpButton?.backgroundColor = UIColor.backgroundYellowColor
        signUpButton?.layer.cornerRadius = 10
        signInButton?.setTitleColor(.brown, for: .normal)
        signUpButton?.setTitle("Sign up", for: .normal)
        signUpButton?.addTarget(self, action: #selector(goToSingUpScreen), for: .touchUpInside)
        view.addSubview(signUpButton!)
        
        
        
        signInButton = UIButton(frame: CGRect(x: Constants.leftPadding, y: 450, width: 200, height: 50))
        signInButton?.backgroundColor = .black
        signInButton?.layer.cornerRadius = 10
        signInButton?.setTitle("Sign in", for: .normal)
        signInButton?.addTarget(self, action: #selector(goToSignInScreen), for: .touchUpInside)
       // signInButton?.setImage(UIImage(named: "image1"), for: .normal)
        view.addSubview(signInButton!)

        
        newImage = UIImageView(frame: CGRect(x: 100, y: 550, width: 200, height: 200))
        newImage?.image = UIImage(named: "logo")
        newImage?.layer.masksToBounds = true
        newImage?.contentMode = .scaleAspectFit
        view.addSubview(newImage!)
        
    }
    
   @objc func goToSignInScreen(){
        print("signInButton pressed")
       let signInVC = LogInViewController()
       signInVC.modalPresentationStyle = .fullScreen
       present(signInVC, animated: true)
       
    }
    
    @objc func goToSingUpScreen(){
        print("you are going to Sign Up Screen")
        let didGoToMovies = SignUpViewController()
        didGoToMovies.modalPresentationStyle = .fullScreen
        present(didGoToMovies, animated: true, completion: nil)
        
        
    }
}
