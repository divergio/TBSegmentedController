##What is TBSegmentedControl

TBSegmentedControl is an example implementation of a UISegmentedControl replacement. 

It allows completely custom buttons, as long as the buttons are all the same size.

##Image Format

Instead of two images per segment (i.e. selected and unselected), you use one image per segment.

Each image should be the same size and show ALL of the segments, with one of them selected. The images should be ordered so that the first image has the first segment enabled (leftmost segment), the second image has the second segment enabled, etc.

##Instructions

1. Add `TBSegmentedControl.h/m to your project. 
1. Add a `UIImageView` to a .xib or your Storyboard. 
2. Set the dimensions of the view to the image you want to use for the segment control.
3. Set the "Custom Class" to `TBSegmentedControl`.
4. Set the delegate for the TBSegmentedControl (UIImageView) to your CustomViewController (or some other controller).  
5. Implement the delegate functions in `TBSegmentedControlDelegate` to receive the segment state change notifications, and to provide the images. See examples in the project. 

##FAQ

###Why did you make this?

A client's designers gave me the wrong kind of images for segmented controls (they weren't accustomed to iOS). I tried to do the image edits myself, but it became too much work, and anyway UISegmentControl's are actually difficult to customize. I had working solutions, but they were imperfect. 

Finally I just decided to use their original images and make a custom segment control that  implemented UISegmentControl functionality.

###Why use it?

There are other custom segmented controls you could use, but most of them use enabled/disabled images per segment. 

This one uses images of the whole control in its different states, if that’s the form your designs come in.

###What does it look like?

Button 1 Selected
![select button 1](https://raw.github.com/divergio/TBSegmentedController/master/segment_screenshot1.png)

Button 2 Selected
![select button 2](https://raw.github.com/divergio/TBSegmentedController/master/segment_screenshot2.png)

###Why does that button look so bad?

That was deliberate in order to demonstrate that they’re really just images.  I spent about five minutes in Pixelmator making the dummy buttons. Since you supply the exact images, you can have any kind of look you want for your SegmentControl.

In this case the images have the text labels. My client actually used icons on the labels. You could imagine modifying the class so that it takes an array of strings as well as images and uses the strings to label the UIButtons.

###Why upload it?

I thought I was kind of clever using my favorite new Objective-C feature, associated objects. 

Also, I like how this control is very much pro-Storyboard. I’m designing a lot of my custom controls to be easy to use with storyboards. I find a lot of the components I find online are kind of old school and do most of the configuration programmatically. I’m trying to figure out ways to use things like user-defined runtime attributes to make use of storyboards (or xibs) still work well with customized controls. 

## Known limitations

The segments have to be all the same size because the button dimensions are set automatically using **maths**. You can imagine a design where this isn't the case, and custom dimensions are used (like an HTML image map). 

## Copyright and License

Copyright 2013 Tyler Barth

[MIT License](http://opensource.org/licenses/MIT "license")