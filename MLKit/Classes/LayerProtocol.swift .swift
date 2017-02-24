//
//  LayerProtocol.swift .swift
//  Pods
//
//  Created by Guled  on 2/23/17.
//
// Architecture of the code inspired by Fábio M. Soares and Alan M.F Souza's implementation of a Neural Network -
// in their book Neural Network Programming in Java.


import Foundation
import Upsurge


public protocol Layer {

    var listOfNeurons: [Neuron] { get set }

    var numberOfNueronsInLayer: Int { get set }

}


public protocol InputandOutputLayerMethods {

    /**
     The printLayer method prints out the values of the incoming and outgoing weights in each nueron within the `layer` object.

     - parameter layer: A layer object. The layer object must correspond with the layer you are working with. So if you call print layer using an InputLayer object, then you need to pass in an InputLayer.

     */
    func printLayer(layer: Layer)
}