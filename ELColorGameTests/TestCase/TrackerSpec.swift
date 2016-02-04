import Quick
import Nimble
import UIKit

@testable
import ELColorGame

class TrackerSpec: QuickSpec {

    override func spec() {
        describe("Tracker") {

            var sut: Tracker!

            beforeEach {
                sut = Tracker(gaiTracker: GAITrackerSpy())
            }

            afterEach {
                sut = nil
            }

            it("should be initialized") {
                expect(sut).notTo(beNil())
            }

            describe("initially") {

                it("data shouldn't be sent") {
                    let gaiTrackerSpy = sut.gaiTracker as! GAITrackerSpy
                    expect(gaiTrackerSpy.dataWasSend).to(beFalse())
                }

                it("parameter shouldn't be sent") {
                    let gaiTrackerSpy = sut.gaiTracker as! GAITrackerSpy
                    expect(gaiTrackerSpy.parameterNameWasSet).to(beFalse())
                }

            }

            describe("track screen") {

                beforeEach {
                    sut.trackScreenWithName(screenName: "screen-name")
                }

                it("should send data") {
                    let gaiTrackerSpy = sut.gaiTracker as! GAITrackerSpy
                    expect(gaiTrackerSpy.dataWasSend).to(beTrue())
                }

                it("should set parameter") {
                    let gaiTrackerSpy = sut.gaiTracker as! GAITrackerSpy
                    expect(gaiTrackerSpy.parameterNameWasSet).to(beTrue())
                }

            }

            describe("track start event") {

                beforeEach {
                    sut.trackGameStartEvent()
                }

                it("should send data") {
                    let gaiTrackerSpy = sut.gaiTracker as! GAITrackerSpy
                    expect(gaiTrackerSpy.dataWasSend).to(beTrue())
                }
            }
        }
    }
}
