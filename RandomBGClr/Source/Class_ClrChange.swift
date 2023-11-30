//
//  Class_ClrChange.swift
//  Change Color Project
//
//  Created by macOS on 23/11/23.
//

import Foundation
import UIKit

public class AutoChangeColorView : UIView{
    @IBInspectable public var isAnimated:Bool{
        get {
            return self.isAnimated
        } set {
            isAnimationShow = newValue
            setupTimer()
        }
    }
    
    private var isAnimationShow:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupTimer()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setupTimer()
    }
    
    
    private func setupTimer(){
        
        if isAnimationShow{
            alpha = 0.05
            setClr()
            
            UIView.animate(withDuration: 2, delay: 0,options: [.autoreverse], animations: {
                self.alpha = 1
            }){ _ in
                self.setupTimer()
            }
        }else{
            let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setClr), userInfo: nil, repeats: true)
            timer.fire()
//            RunLoop.main.add(timer, forMode: RunLoop.Mode.common)
        }
    }
    
    @objc private func setClr(){
        backgroundColor = randomClr()
    }
    
    private func randomClr() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0
        )
    }
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(Float.random(in: 1...255)/Float(255))
    }
}

