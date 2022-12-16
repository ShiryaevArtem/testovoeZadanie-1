//
//  PhotosCell.swift
//  testovoeZadanie
//
//  Created by Artem on 16.12.2022.
//

import UIKit
import SDWebImage
class PhotosCell: UICollectionViewCell {
    var viewModels = ViewModels()
    var  photosCollectionViewController = PhotosCollectionViewController()
    var unsplashPhoto : ()
    
    
    static let reuseId = "PhotosCell"
    let checkmark: UIImageView = {
        let image = UIImage(named: "bird")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()
    public let photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - добавление фото в ячейку с помощью библиотеки SDWebImage
    
    //MARK: - выделение выбранного фото (для функции поделиться)
    override var isSelected: Bool{
        didSet {
            updateSelectedState()
        }
    }
    func reImage() -> UIImageView{
        return photoImageView
    }
    
    private func updateSelectedState() {
        photoImageView.alpha = isSelected ? 0.7 : 1
        checkmark.alpha = isSelected ? 1 : 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init( frame: frame)
        updateSelectedState()
        setupImagePhotoView()
        setupCheckmarkView()
    }
    private func setupImagePhotoView(){
        addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    private func setupCheckmarkView() {
        addSubview(checkmark)
        checkmark.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -8).isActive = true
        checkmark.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
