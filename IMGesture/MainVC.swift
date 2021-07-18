//
//  MainVC.swift
//  IMGesture
//
//  Created by akshay on 11/07/21.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    private let vutap: UIView = {
        let vu = UIView()
        vu.backgroundColor = .systemOrange
        vu.frame = CGRect(x: 130, y: 100, width: 150, height: 40)
        return vu
    }()
    private let lbltap: UILabel = {
        let lbl = UILabel()
        lbl.text = "Open ImagePicker"
        lbl.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 16)
        return lbl
    }()
    private let imgpick: UIImagePickerController = {
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = false
        return pickerController
    }()
    private let imgview: UIImageView = {
        let imgvu = UIImageView()
        
        return imgvu
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(vutap)
        vutap.addSubview(lbltap)
        let tappy = UITapGestureRecognizer(target: self, action: #selector(didtappy))
        tappy.numberOfTapsRequired = 1
        tappy.numberOfTouchesRequired = 1
        vutap.addGestureRecognizer(tappy)
        view.addSubview(imgview)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgview.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
    }
}
extension MainVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
        if let selectedImage = info[.originalImage] as? UIImage {
            imgview.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    @objc private func didtappy() {
        imgpick.sourceType = .photoLibrary
        DispatchQueue.main.async {
            MainVC().modalPresentationStyle = .fullScreen
            self.present(self.imgpick, animated: true)
        }
    }
}
