# TripStory

No live tracking required. TripStory reconstructs a trip after the fact, from photos you already have — not from an app you had to remember to run while traveling.

Import the photos from a trip, and the app reads their timestamps and GPS on-device, groups them into **events** with a spatio-temporal clustering algorithm (a photo becomes "45 minutes at the Egyptian Museum," not just a pin on a map), resolves cities and places, and lays the whole trip out as a timeline and a map. No photos leave the phone.

**Why this and not Polarsteps / Google Photos:**
- Polarsteps needs you to actively track your route live during the trip. TripStory works retroactively on a camera roll you never tracked.
- Google Photos and Apple Photos show *where* a photo was taken. TripStory infers *what happened* — Photo → Event, not just Photo → GPS pin.

**Status:** V1 in progress (Sept–Oct 2026). Roadmap:

- [ ] V1 — import, EXIF/GPS, event detection, timeline, map
- [ ] V2 — image similarity, representative photos
- [ ] V3 — landmark and restaurant recognition
- [ ] V4 — AI-generated trip story

## Stack

SwiftUI · PhotoKit · MapKit · SwiftData · Vision (later) · a pure-Swift `TripCore` package for the clustering algorithm, tested independently of the UI.
