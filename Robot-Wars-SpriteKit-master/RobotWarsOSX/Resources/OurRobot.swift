//
//  OurRobot.swift
//  RobotWarsOSX
//
//  Created by Gabriel Allen on 7/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

class OurRobot: Robot{
    enum RobotState {                    // enum for keeping track of RobotState
        case Default, Rotating, MoveAlongWall, Searching, Firing
    }
    var currentRobotState: RobotState = .Default {
        didSet {
            actionIndex = 0
        }
    }
    var actionIndex = 0
    
    var lastKnownPosition = CGPoint(x: 0, y: 0)
    var lastKnownPositionTimestamp = CGFloat(0.0)
    let firingTimeout = CGFloat(0.5)
    
    //    var moveAlongWallDistance: Int
    
    //override init(){
    //self.moveAlongWallDistance = 10
    //}
    
    override func run() {
        while true {
            switch currentRobotState {
            case .Default:
                performNextDefaultAction()
            case .Rotating:
                performNextRandomShot()
            case .MoveAlongWall:
                performNextMove()
            case .Firing:
                performNextFiringAction()
                // case .Searching:
            //     performNextSearchingAction()
            default:
                break
            }
        }
    }
    func performNextDefaultAction() {
        // uses actionIndex with switch in case you want to expand and add in more actions
        // to your initial state -- first thing robot does before scanning another robot
        switch actionIndex % 2 {          // should be % of number of possible actions
        case 0:
            turnRobotLeft(45)
        case 1:
            moveAhead(1000)
            
        default:
            break
        }
        actionIndex += 1
        
        
    }
    override func hitWall(hitDirection: RobotWallHitDirection, hitAngle angle: CGFloat) {
        cancelActiveAction()
        //
        //
        //
        // always turn directly away from wall
        print(angle)
        //        moveBack(50)
        if angle  == -135{
            turnRobotRight(45)
        }else if angle > 0{
            turnRobotRight(Int((-135)))
        }else if angle < 0{
            turnRobotRight(Int((-135)))
        }
        
        // leave wall
        // reset to old state
        currentRobotState = .Rotating
        print(currentRobotState)
    }
    func performNextRandomShot() {
        cancelActiveAction()
        shoot()
        shoot()
        
        
        currentRobotState = .Firing
        print(currentRobotState)
    }
    
    func performNextMove() {
        cancelActiveAction()
        moveAhead(5)
        currentRobotState = .Firing
        print(currentRobotState)
    }
    
    func performNextFiringAction() {
        //        if currentTimestamp() - lastKnownPositionTimestamp > firingTimeout {
        //            currentRobotState = .Default
        //        if {
        let angle = Int(angleBetweenGunHeadingDirectionAndWorldPosition(lastKnownPosition))
        if angle >= 0 {
            turnGunRight(abs(angle))
        } else {
            turnGunLeft(abs(angle))
        }
        shoot()
        currentRobotState = .MoveAlongWall
        print(currentRobotState)
    }
    //    }
    //
    override func scannedRobot(robot: Robot!, atPosition position: CGPoint) {
        if currentRobotState != .Firing {
            cancelActiveAction()
        }
        
        lastKnownPosition = position
        lastKnownPositionTimestamp = currentTimestamp()
        currentRobotState = .Firing
        print(currentRobotState)
    }
    
    override func gotHit() {
        moveBack(150)
        
    }
    
    
    
    override func bulletHitEnemy(bullet: Bullet!) {
        // unimplemented but could be powerful to use this...
    }
}