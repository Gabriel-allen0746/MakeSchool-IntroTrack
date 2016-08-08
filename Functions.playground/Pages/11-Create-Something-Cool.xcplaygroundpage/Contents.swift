/*:
 ![Make School Banner](./swift_banner.png)
 # Create something cool
 
 - experiment: Use everything you learned to draw something awesome! See below for a few more functions you can use to bring your art to life!
 
 ## Drop and lift the pen
 
 - callout(Drop the pen): `penDown()`
 
 - callout(Lift the pen): `penUp()`
 
 - note: The pen starts out down
 
 ## Moving the pen
 
 - callout(Move by a number of steps): `move(steps: Int)`
 
 - callout(Move directly to coordinates): `moveTo(x x: Int, y: Int)`
 
 - note: This is called with labels for both parameters! eg. `moveTo(x x: 10, y: 40)`
 
 - callout(Rotate heading by an angle): `rotate(degrees: Int)`
 
 ## Change the pen
 
 - callout(Set color of pen): `setColor(red red: Double, green: Double, blue: Double)`
 
 - note: This is called with labels for all 3 parameters! Each value should be between 0 and 1. eg. `setColor(red: 0.0, green: 0.0, blue: 0.0)` would change the pen to be black. `setColor(red: 1.0, green: 0.0, blue: 0.0)` would change the pen to be red. 
 
 - callout(Set thickness of pen): `setThickness(thickness: Double)`
 
 */
func drawAwesomeShit()
{
    for _ in 1...12
    {
        move(10)
        rotate(30)
        for _ in 1...12
        {
            move(15)
            rotate(-30)
            
        }
    }
    
}
setColor(red: 0.0, green: 0.5, blue: 0.5)
setThickness(2.5)
drawAwesomeShit()






















































































//: This is setup code to make the live visualization work!
Pen.delay = 0.1
import XCPlayground
import Foundation
let results = DrawingScene.setup()
XCPlaygroundPage.currentPage.liveView = results
