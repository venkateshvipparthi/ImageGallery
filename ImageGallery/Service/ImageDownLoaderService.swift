//
//  ImageDownLoaderService.swift
//  ImageGallery
//
//  Created by Admin on 28/04/2022.
//


import Foundation
import UIKit

enum PhotoRecordState {
  case new, downloaded, failed
}

class PhotoRecord {
  let name: String
  let url: String
  var state = PhotoRecordState.new
  var image = UIImage(named: "Placeholder")
  
  init(name:String, url:String) {
    self.name = name
    self.url = url
  }
}

class ImageDownLoaderService: Operation {
    
    let photoRecord: PhotoRecord
    
    
    init(_ photoRecord: PhotoRecord) {
      self.photoRecord = photoRecord
    }
    
    
    override func main() {
      
      if isCancelled {
        return
      }
      
      guard let url = URL(string: photoRecord.url) else {return}
        
      guard let imageData = try? Data(contentsOf:url) else { return }
      
      
      if isCancelled {
        return
      }
      
      
      if !imageData.isEmpty {
        photoRecord.image = UIImage(data:imageData)
        photoRecord.state = .downloaded
      } else {
        photoRecord.state = .failed
        photoRecord.image = UIImage(named: "Failed")
      }
    }
  }


class PendingOperations {
    
  lazy var downloadsInProgress: [IndexPath: Operation] = [:]
    
  lazy var downloadQueue: OperationQueue = {
    var queue = OperationQueue()
    queue.name = "Download queue"
    queue.maxConcurrentOperationCount = 1
    return queue
  }()
}
