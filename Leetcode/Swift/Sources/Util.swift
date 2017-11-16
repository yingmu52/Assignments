import Foundation

class Util {
	static func getRunTime(_ text: String, codeBlock: () -> ()) {
		let startTime = CFAbsoluteTimeGetCurrent()
		codeBlock()
		let time = CFAbsoluteTimeGetCurrent() - startTime
		print("\(text) runs \(time) s")
	}
}
	
