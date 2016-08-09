//
//  SolutionOverlaySimulationScene.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 3/6/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public class SolutionOverlaySimulationScene: SimulationScene {
    
    public var solutionSim: Simulation = Simulation()

    public var solutionPalette = [Character?]()
    
    public func setup(solutionSim solutionSim: Simulation, solutionPalette: [Character?]) {
        self.solutionSim = solutionSim
        self.solutionPalette = solutionPalette
        checkPalette()
        checkGrid()
    }
    
    override func timerUpdate() {
        solutionSim.update()
        super.timerUpdate()
        checkPalette()
        checkGrid()
    }
    
    func checkPalette() {
        let maxLen = min(solutionPalette.count, palette.count)
        for x in 0..<maxLen {
            if solutionPalette[x] != palette[x] {
                paletteGrid.setTileState(x, 0, state: .Incorrect)
            } else {
                paletteGrid.setTileState(x, 0, state: .Default)
            }
        }
        if solutionPalette.count != palette.count {
            print("Palette grid is not the right length! Should have \(solutionPalette.count) elements but has \(palette.count) elements!")
        }
    }
    
    func checkGrid() {
        for x in 0..<sim.grid.count {
            for y in 0..<sim.grid[x].count {
                if solutionSim.grid[x][y] != sim.grid[x][y] {
                    grid.setTileState(x, y, state: .Incorrect)
                } else {
                    grid.setTileState(x, y, state: .Default)
                }
            }
        }
    }
}