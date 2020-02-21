//
//  RectangleDetectorTests.swift
//  NeuralServiceTests
//
//  Created by Kamil Wyszomierski on 18/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import XCTest
import Vision
@testable import NeuralService

class RectangleDetectorTests: XCTestCase {

	private let sut = RectangleDetector()

    func test_givenVideoOutputWithImage_whenDetectCalled_thenExpectToDetectOneQuad() throws {

		// given
		let bundle = Bundle(for: Self.self)
		let expect = expectation(description: "Expect completion call with success.")
		let receiptImage = try XCTUnwrap(UIImage(named: "simple_receipt", in: bundle, with: nil))
		let receiptImageBuffer = try XCTUnwrap(buffer(from: receiptImage))
		let intrinsics = [VNImageOption: Any]() as CFTypeRef
		let videoOutput = CameraOutput(pixelBuffer: receiptImageBuffer, orientation: .up, intrinsics: intrinsics)

		// when
		sut.detect(from: videoOutput) { (result) in

			// then
			switch result {
			case .failure(let error):
				XCTFail(error.localizedDescription)
				
			case .success(let quads):
				expect.fulfill()
				XCTAssertFalse(quads.isEmpty)
			}
		}

		wait(for: [expect], timeout: 5.0)
    }
}

extension RectangleDetectorTests {

	private func buffer(from image: UIImage) -> CVPixelBuffer? {
		let attrs = [
			kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
			kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue
		] as CFDictionary

		var pixelBuffer: CVPixelBuffer!
		let status = CVPixelBufferCreate(
			kCFAllocatorDefault,
			Int(image.size.width),
			Int(image.size.height),
			kCVPixelFormatType_32ARGB,
			attrs,
			&pixelBuffer
		)

		guard status == kCVReturnSuccess else {
			return nil
		}

		let bufferLockFlag = CVPixelBufferLockFlags(rawValue: 0)
		CVPixelBufferLockBaseAddress(pixelBuffer, bufferLockFlag)
		let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer)

		let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
		guard let context = CGContext(
			data: pixelData,
			width: Int(image.size.width),
			height: Int(image.size.height),
			bitsPerComponent: 8,
			bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer),
			space: rgbColorSpace,
			bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue
		) else {
			return nil
		}

		context.translateBy(x: 0.0, y: image.size.height)
		context.scaleBy(x: 1.0, y: -1.0)

		UIGraphicsPushContext(context)
		image.draw(in: CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height))
		UIGraphicsPopContext()
		CVPixelBufferUnlockBaseAddress(pixelBuffer, bufferLockFlag)

		return pixelBuffer
	}
}
