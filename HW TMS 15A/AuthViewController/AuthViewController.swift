import UIKit

final class AuthViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
  
    @IBAction func loginButtonAction(_ sender: Any) {
        if let name = nameTextField.text, !name.isEmpty {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let controller = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
                
                UserDefaults.standard.set(true, forKey: UserDefaults.authKey)
                
                let navigation = UINavigationController(rootViewController: controller)
                navigation.modalPresentationStyle = .fullScreen
                present(navigation, animated: true, completion: nil)
            }
        
        } else {
            nameTextField.layer.borderColor = UIColor.red.cgColor
            nameTextField.layer.borderWidth = 2
        }
    }
}
