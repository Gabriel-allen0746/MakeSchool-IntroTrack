//
//  GOLSolutionSimulation.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 2/29/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public class GOLSolutionSimulation: Simulation {
    
    public var liveChar: Character = "👾"
    
    public override func setup() {
    }
    
    public override func update() {
        var newGrid = grid // swift copies arrays by value
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                let cell = grid[i][j]
                let neighbors = countNeighbors(grid, i: i, j: j)
                if cell != nil {
                    if neighbors < 2 {
                        newGrid[i][j] = nil
                    } else if neighbors < 4 {
                        newGrid[i][j] = liveChar
                    } else {
                        newGrid[i][j] = nil
                    }
                } else {
                    if neighbors == 3 {
                        newGrid[i][j] = liveChar
                    }
                }
            }
        }
        grid = newGrid
    }
    
    func countNeighbors(grid: [[Character?]], i: Int, j: Int) -> Int {
        var count = 0
        count += isCellAlive(grid, i-1, j)
        count += isCellAlive(grid, i+1, j)
        count += isCellAlive(grid, i, j-1)
        count += isCellAlive(grid, i, j+1)
        count += isCellAlive(grid, i-1, j-1)
        count += isCellAlive(grid, i-1, j+1)
        count += isCellAlive(grid, i+1, j-1)
        count += isCellAlive(grid, i+1, j+1)
        return count
    }
    
    func isCellAlive(grid: [[Character?]], _ i: Int, _ j: Int) -> Int {
        if i < 0 || grid.count <= i {
            return 0
        }
        if j < 0 || grid[0].count <= j {
            return 0
        }
        return grid[i][j] != nil ? 1 : 0
    }
}