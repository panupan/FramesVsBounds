NSView Frames vs Bounds
=======================

- Both are NSRect properties expressing a view’s location and size.
- View's location and sized expressed in two ways:
    - **Frame** is in terms of superview's coordinate system.
	- **Bounds** is in terms of local coordinate system.
- **Prior Misconception:** Bounds size is always the same as Frame size. It’s easy to think this because updating a view’s frame scales its bounds accordingly.
- But actually... a view’s frames and bounds might be different from each other caused by:
    - Setting a view’s bounds directly does not scale its frame.
	- Scaling a view using scaleUnitSquareToSize:  updates its bounds, but not its frame.
	- Rotating a view with boundsRotation updates its bounds, but not its frame.
- When to use frame?
    - When using a view, e.g., creating, positioning.
- When to use bounds?
    - When implementing a view, e.g., drawing, event handling.
