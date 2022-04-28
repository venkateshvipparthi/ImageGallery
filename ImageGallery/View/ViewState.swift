//
//  ViewState.swift
//  ImageGallery
//
//  Created by Admin on 28/04/2022.
//

import Foundation

enum ViewState: Equatable {
    case none
    case loading
    case finishedLoading
    case error(String)
}
