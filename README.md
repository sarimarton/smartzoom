# smartzoom

Little cmd line mouse util for macOS.

- `smartzoom smart`: sends a smart zoom event
- `smartzoom magnify`: pinch-zooms in a little
- `smartzoom reset`: pinch-zooms out

The project is a swift package and an xcode project at the same time, with
duplicate code. I couldn't figure out so far how to do it properly.

```
swift package init --type executable
```

To build,

```
swift build
```

or use the XCode project.

You'll need to grant Accessibility permission, but the app will prompt you.
