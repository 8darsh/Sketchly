//
//  ViewController.swift
//  Sketchly
//
//  Created by Adarsh Singh on 01/09/23.
//

import UIKit
import PencilKit
class ViewController: UIViewController, PKCanvasViewDelegate {

    private let canvasView: PKCanvasView = {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput
        return canvas
    }()
    
    let drawing = PKDrawing()
    private let toolPicker = PKToolPicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.drawing = drawing
        canvasView.delegate = self
        view.addSubview(canvasView)
        
        // Do any additional setup after loading the view.
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
        
        self.toolPicker.setVisible(true, forFirstResponder: canvasView)
        self.toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        canvasView.frame = view.bounds
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        
    }
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        
    }
    func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
    
    }
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        
    }


    
    
    @IBAction func clearTapped(_ sender: UIBarButtonItem) {
        
        canvasView.drawing = PKDrawing()
    }
    @IBAction func captureImage(_ sender: UIBarButtonItem) {
        let img = UIGraphicsImageRenderer(bounds: canvasView.bounds).image {
            _ in
            view.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true)
        }
        let ac = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        
        present(ac, animated: true)
    }
    
    
}

