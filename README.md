##What is TBSegmentedControl

TBSegmentedControl is an example implementation of a UISegmentedControl replacement. 

It allows completely custom buttons, as long as the buttons are all the same size.

##Image Format

Instead of two images per segment (i.e. selected and unselected), you use one image per segment.

Each image should be the same size and show ALL of the segments, with one of them selected. The images should be ordered so that the first image has the first segment enabled (leftmost segment), the second image has the second segment enabled, etc.

##Instructions

1. Add `TBSegmentedControl.h/m to your project. 
1. Add a `UIImageView` to a .xib or your Storyboard. 
2. Set the dimensions of the view to the image you want to use for the segment controller.
3. Set the "Custom Class" to `TBSegmentedControl`.
4. Set the delegate for the TBSegmentedControl (UIImageView) to your CustomViewController (or some other controller).  
5. Implement the delegate functions in `TBSegmentedControlDelegate` to receive the segment state change notifications, and to provide the images. See examples in the project. 

##FAQ

###Why did you make this?

A client's designers gave me the wrong kind of images for segmented controls (they weren't accustomed to iOS). I tried to do the image edits myself, but it became too much work, and anyway UISegmentControl's are actually difficult to customize. I had working solutions, but they were imperfect. 

Finally I just decided to use their original images and make a custom segment control that  implemented UISegmentControl functionality.

###Why does that button look so bad?

That was deliberate. I spent about five minutes in Pixelmator making the dummy buttons. Since you supply the exact images, you can make any kind of SegmentControl you want. 

In this case the images have the text labels. My client actually used icons on the labels. You could imagine modifying the class so that it takes an array of strings as well as images and uses the strings to label the UIButtons.

## Known limitations

The segments have to be all the same size because the button dimensions are set automatically using **maths**. You can imagine a design where this isn't the case, and custom dimensions are used (like an HTML image map). 

## Copyright and License

Copyright 2013 Tyler Barth

[MIT License](http://opensource.org/licenses/MIT "license")