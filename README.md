# TripStory

Turn a camera roll into a trip you can look back on.

Import the photos from a trip, and the app reads their timestamps and GPS on-device, groups them into events with a spatio-temporal clustering algorithm, resolves cities and places, and lays the whole trip out as a timeline and a map. No photos leave the phone.

**Status:** V1 in progress (Sept–Oct 2026). Roadmap:

- [ ] V1 — import, EXIF/GPS, event detection, timeline, map
- [ ] V2 — image similarity, representative photos
- [ ] V3 — landmark and restaurant recognition
- [ ] V4 — AI-generated trip story

## Stack

SwiftUI · PhotoKit · MapKit · SwiftData · Vision (later) · a pure-Swift `TripCore` package for the clustering algorithm, tested independently of the UI.
