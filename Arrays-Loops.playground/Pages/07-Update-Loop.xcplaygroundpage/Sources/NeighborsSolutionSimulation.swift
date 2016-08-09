import Foundation

public class NeighborsSolutionSimulation: Simulation {
    
    public func countNeighbors(map: [[Character?]], column x: Int, row y: Int) -> Int {
        var count = 0
        count += isCellAlive(map, x-1, y)
        count += isCellAlive(map, x+1, y)
        count += isCellAlive(map, x, y-1)
        count += isCellAlive(map, x, y+1)
        count += isCellAlive(map, x-1, y-1)
        count += isCellAlive(map, x-1, y+1)
        count += isCellAlive(map, x+1, y-1)
        count += isCellAlive(map, x+1, y+1)
        return count
    }
    
    func isCellAlive(map: [[Character?]], _ i: Int, _ j: Int) -> Int {
        if i < 0 || map.count <= i {
            return 0
        }
        if j < 0 || map[0].count <= j {
            return 0
        }
        return map[i][j] != nil ? 1 : 0
    }
}
