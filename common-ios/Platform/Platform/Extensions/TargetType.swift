//
//  TargetType.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import Moya

extension TargetType {
    func sampleData(from sample: Any, file: String = #file, line: Int = #line) -> Data {
        guard let data = try? JSONSerialization.data(withJSONObject: sample) else {
            fatalError("Unable to convert sample data in \(file) at line \(line)")
        }
        return data
    }
}
