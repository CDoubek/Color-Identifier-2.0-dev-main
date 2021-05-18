//
//  secondView.swift
//  Color Identifier 2.0
//
//  Created by Student on 5/3/21.
//

import UIKit

class secondView: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imageView1: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
        performSegue(withIdentifier: "secondToThird", sender: nil)
        
    }
    
    func imagePickerController(_ _picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView1.image = info[.originalImage] as? UIImage
    }
    override func prepare(for segue:UIStoryboardSegue , sender: Any?) {
        if segue.identifier == "secondToThird" {
            let dvc = segue.destination as! thirdViewController
            dvc.newImage = imageView1.image
        }
    }
    
}
