//
//  DataManager.swift
//  NewProject
//
//  Created by yauheni prakapenka on 26.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import Spring

struct DataManager {
    
    static func getAnimationPreset() -> [Spring.AnimationPreset] {
        let animationPreset = Spring.AnimationPreset.self
        
        return [animationPreset.SlideLeft, animationPreset.SlideRight, animationPreset.SlideDown,
                animationPreset.SlideUp, animationPreset.SqueezeLeft, animationPreset.SqueezeRight,
                animationPreset.SqueezeDown, animationPreset.SqueezeUp,
                animationPreset.Swing, animationPreset.Wobble]
    }
    
    static func getAnimationCurve() -> [Spring.AnimationCurve] {
        let animationCurve = Spring.AnimationCurve.self
        
        return [animationCurve.EaseIn, animationCurve.EaseOut, animationCurve.EaseInOut,
                animationCurve.Linear, animationCurve.Spring, animationCurve.EaseInOutSine,
                animationCurve.EaseInOutQuint, animationCurve.EaseInQuart, animationCurve.EaseInCubic,
                animationCurve.EaseOutCirc, animationCurve.EaseOutBack, animationCurve.EaseInExpo]
        
    }
}
