

import Foundation
import MapKit

struct Place: Codable {
    let name: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let address: String
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func getFomattedAddress(with placemark: CLPlacemark) -> String {
        var address = ""
        if let street = placemark.thoroughfare {
            address += street //RUA
        }
        if let number = placemark.subThoroughfare {
            address += " \(number)" //NÚMERO
        }
        if let subLocality = placemark.subLocality {
        address += " \(subLocality)" //BAIRRO
        }
        if let city = placemark.locality {
            address += "\n\(city)" //CIDADE
        }
        if let state = placemark.administrativeArea {
            address += " - \(state)" //ESTADO
        }
        if let postalCode = placemark.postalCode {
            address += "\nCEP: \(postalCode)" //CEP
        }
        if let country = placemark.country {
            address += "\n\(country)" //PAÍS
        }
        
        return address
    }
    
}

extension Place: Equatable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
