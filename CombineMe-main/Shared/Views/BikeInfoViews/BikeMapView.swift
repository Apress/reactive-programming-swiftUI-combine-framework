//
//  HoldView.swift
//  CombineMe
//
//  Created by Swift Developer on 8/8/20.
//
import MapKit
import SwiftUI

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

struct BikeMapView: View {
    private var station : Station
    @State  var lat :Double
    @State  var lon :Double
    var annotationItems: [MyAnnotationItem]

    
    init(station : Station) {
        self.station = station
        _lat = State(initialValue: station.lat)
        _lon = State(initialValue: station.lon)
        
        // place pin on station
        annotationItems = [
            MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: station.lat, longitude: station.lon)),
            
        ]
    }
    
    var body: some View {
        MapView(lat: $lat, lon: $lon, annotationItems: annotationItems)
        Text("bike capacity \(station.capacity)")
    }
}

/**
 SwiftUI Maps on iOS 14+
 copyied from link:
 https://www.hackingwithswift.com/forums/swiftui/swiftui-map-for-ios14/2633
 */
struct MapView: View {
    @Binding private var lat: Double
    @Binding private var lon: Double
    var annotationItems: [MyAnnotationItem]
    
    private let initialLatitudinalMetres: Double = 250
    private let initialLongitudinalMetres: Double = 250
    
    @State private var span: MKCoordinateSpan?
    
    init(lat: Binding<Double>, lon: Binding<Double>,
         annotationItems: [MyAnnotationItem]) {
        _lat = lat
        _lon = lon
        self.annotationItems = annotationItems
    }
    
    private var region: Binding<MKCoordinateRegion> {
        Binding {
            let centre = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            
            if let span = span {
                return MKCoordinateRegion(center: centre, span: span)
            } else {
                return MKCoordinateRegion(center: centre, latitudinalMeters: initialLatitudinalMetres, longitudinalMeters: initialLongitudinalMetres)
            }
        } set: { region in
            lat = region.center.latitude
            lon = region.center.longitude
            span = region.span
        }
    }
    
    var body: some View {
        Map(coordinateRegion: region, annotationItems: annotationItems)  {item in
            MapPin(coordinate: item.coordinate)
        }
    }
}

