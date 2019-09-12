//
//  Geometrics.swift
//  Geometrics
//
//  Created by Ivan Erwin Lopez Ansaldo on 9/12/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import Foundation

struct Calculator {
    
    var totalAreas: Float = 0
    var totalPerimetros: Float = 0
    
    mutating func calculate(shapes: [GeometricShape]) {
        
        let areaOperations = AreaOperations()
        let perimetroOperations = PerimetroOperations()
        
        totalAreas = areaOperations.sumaAreas(shapes: shapes)
        totalPerimetros = perimetroOperations.sumaPermietros(shapes: shapes)
    }
}

struct Geometrics {
    
    var shapes: [GeometricShape] = {[
        Rectangle(height: 3.0, width: 5.0),
        Rectangle(height: 3.0, width: 5.0),
        Rectangle(height: 3.0, width: 4.0),
        Triangle(sideLength: 3.0),
        Triangle(sideLength: 5.0)
    ]}()
    
    init() {
        
        var calculator = Calculator()
        calculator.calculate(shapes: shapes)
        
        print("Total Area: \(calculator.totalAreas)")
        print("Total Perimetro: \(calculator.totalPerimetros)")
    }
}

protocol hasPerimetro {
    func perimetro() -> Float
}

protocol hasArea {
    func area() -> Float
}

protocol GeometricShape: hasArea, hasPerimetro {
}

struct Rectangle: GeometricShape {
    let sides = 4
    var height: Float
    var width: Float
    
    func area() -> Float {
        return width * height
    }
    
    func perimetro() -> Float {
        return 2 * (width + height)
    }
    
}

struct Triangle: GeometricShape {
    let sides: Float = 3
    var sideLength: Float
    
    func area() -> Float {
        return (sqrt(3)/4) * pow(sideLength, 2)
    }
    
    func perimetro() -> Float {
        return sides * sideLength
    }
}

struct Square: GeometricShape {
    let sides: Float = 4
    var sideLenght: Float
    
    func area() -> Float {
        return sideLenght * sideLenght
    }
    
    func perimetro() -> Float {
        return sides * sideLenght
    }
}

struct AreaOperations {
    func sumaAreas(shapes: [hasArea]) -> Float {
        var area: Float = 0
        for shape in shapes {
            area += shape.area()
        }
        return area
    }
}

struct PerimetroOperations {
    func sumaPermietros(shapes: [hasPerimetro]) -> Float {
        var perimetro: Float = 0
        for shape in shapes {
            perimetro += shape.perimetro()
        }
        return perimetro
    }
}
