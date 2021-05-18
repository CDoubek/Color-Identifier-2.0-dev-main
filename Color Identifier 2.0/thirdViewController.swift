//
//  thirdViewController.swift
//  Color Identifier 2.0
//
//  Created by Lena Rotteveel on 5/12/21.
//

import UIKit

class thirdViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = newImage
    }
    @IBAction func onViewTapped(_ sender: UITapGestureRecognizer){
        let point = sender.location(in: view)
        
        // get the individual pixel data
        var pixelData:[UInt8] = [0, 0, 0, 0]    // this array will contain the rgba values
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: &pixelData, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.translateBy(x: -point.x, y: -point.y)
        view.layer.render(in: context!)
        
        // turn red/green/blue/alpha values into percentages
        let red:CGFloat = CGFloat(pixelData[0]) / CGFloat(255.0)
        let green:CGFloat = CGFloat(pixelData[1]) / CGFloat(255.0)
        let blue:CGFloat = CGFloat(pixelData[2]) / CGFloat(255.0)
        let alpha:CGFloat = CGFloat(pixelData[3]) / CGFloat(255.0)
        
        // display the color
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        // display the color values (percentages)
        redLabel.text = String(format: "%.3f", red) + " %"
        blueLabel.text = String(format: "%.3f", blue) + " %"
        greenLabel.text = String(format: "%.3f", green) + " %"
    }
    
}
