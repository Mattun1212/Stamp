//
//  ViewController.swift
//  Stamp
//
//  Created by Koutaro Matsushita on 2021/08/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationBarDelegate, UINavigationControllerDelegate {
    
    var ImageNameArray: [String] = ["hana","hoshi","onpu","shitumon"]
    var imageIndex: Int = 0
    @IBOutlet var haikeiImageView: UIImageView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectedFirst(){
        imageIndex = 1
        print(imageIndex)
    }

    @IBAction func selectedSecond(){
        imageIndex = 2
        print(imageIndex)
    }

    @IBAction func selectedThird(){
        imageIndex = 3
    }

    @IBAction func selectedFourth(){
        imageIndex = 4
    }
    
    @IBAction func back() {
        self.imageView.removeFromSuperview()
    }
    
    @IBAction func selectBackground() {
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func save() {
        let rect:CGRect = CGRect(x: 0, y: 0, width: 414, height: 708)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        if imageIndex != 0 {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            let image: UIImage = UIImage(named: ImageNameArray[imageIndex - 1])!
            imageView.image = image
            
            imageView.center = CGPoint(x: location.x, y: location.y)
            
            self.view.addSubview(imageView)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        haikeiImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }

}

