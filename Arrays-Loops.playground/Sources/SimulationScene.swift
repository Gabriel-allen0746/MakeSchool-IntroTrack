//
//  GameOfLifeScene.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 2/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public func defaultPalette() -> [Character?] {
    return ["👾", "🐱", nil, nil, nil, nil, nil, nil]
}

public func paletteFilledWith(char: Character?, size: Int) -> [Character?] {
    return [Character?].init(count: size, repeatedValue: char)
}

public class SimulationScene: SKScene {
    
    internal var sim: Simulation!
    internal var palette: [Character?]!
    
    var grid: TouchableGrid!
    var paletteGrid: PaletteGrid!
    public var playButton: MSPlayPauseToggleButtonNode!
    public var stepButton: MSButtonNode!
    var generationLabel: SKLabelNode!
    
    var timer: NSTimer? = nil
    
    var liveChar: Character?
    
    var generation = 1
    
    public func setup(simulation sim: Simulation, palette: [Character?]) {
        self.sim = sim
        sim.setup()
        self.palette = palette
    }
    
    public override func didMoveToView(view: SKView) {
        playButton = childNodeWithName("playButton") as! MSPlayPauseToggleButtonNode
        stepButton = childNodeWithName("stepButton") as! MSButtonNode
        playButton.selectedHandler = playPausePressed
        stepButton.selectedHandler = stepButtonPressed
        
        playButton.state = .Hidden
        stepButton.state = .Hidden
                
        generationLabel = childNodeWithName("generationLabel") as! SKLabelNode
        grid = childNodeWithName("grid") as! TouchableGrid
        grid.setup(sim.grid)
        grid.touchCallback = gridCellTouched
        
        paletteGrid = childNodeWithName("palette") as! PaletteGrid
        paletteGrid.setup(palette)
        paletteGrid.touchCallback = paletteCellTouched
        
        if palette.count != 0 {
            liveChar = palette[0]
            paletteGrid.highlightCell(0)
        } else {
            liveChar = "👾"
        }
    }
    
    func gridCellTouched(x: Int, y: Int) {
        if sim.grid[x][y] != liveChar {
            sim.grid[x][y] = liveChar
        } else {
            sim.grid[x][y] = nil
        }
        update()
    }
    
    func paletteCellTouched(x: Int, _: Int) {
        paletteGrid.highlightCell(x)
        liveChar = palette[x]
    }
    
    func timerUpdate() {
        generation += 1
        generationLabel.text = "Generation: \(generation)"
        sim.update()
        update()
    }
    
    func playPausePressed() {
        if playButton.toggled {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(SimulationScene.timerUpdate), userInfo: nil, repeats: true)
            timer?.fire()
        } else {
            timer?.invalidate()
        }
    }
    
    public func toggleButton() {
        playButton.mouseUp(NSEvent())
    }
    
    func stepButtonPressed() {
        timerUpdate()
    }
    
    func update() {
        grid.updateAll(sim.grid)
    }
}