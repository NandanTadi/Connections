import Foundation
import UIKit

class Contact{
    var name: String
    var phone: String
    var email: String
    var image: UIImage
    
    
    init(name: String, phone: String, email: String, image: UIImage) {
        self.email = email
        self.name = name
        self.phone = phone
        self.image = image
    }
}
