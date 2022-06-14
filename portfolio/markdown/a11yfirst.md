## Overview

The [A11yFirst Plugins for CKEditor](https://ckeditor.com/cke4/addons/search/plugins/a11yfirst) are a suite of editor enhancements whose purpose is to promote accessible authoring during the editing process.

Many embedded HTML editors, such as those found in modern CMSes, provide an accessibility checker plugin, which is typically used when an author has completed a document and wants to check for accessibility issues.

The result is often a list of issues in a seemingly random order that may be difficult to comprehend, especially with regard to how each issue relates to specific accessibility requirements, and how to avoid repeating the error in the future.

The A11yFirst Project is an attempt to counter this reactive approach with one that is proactive and  educational as well.

For example, when you have typed a section label and want to convert it to an actual HTML heading, the Headings/Paragraph plugin will only provide heading level options that would not violate the accessibility requirement for properly nested headings.

## Product Definition

The stakeholders decided at the onset that we would create the following plugins:

* Headings/Paragraph: Toggle normal paragraph to heading and vice versa.
* Image: Prompt for both short and long text descriptions as needed.
* Link: Ensure that link text is descriptive (for example, warn when link text is 'click here').
* Character Styles: For example, discourage the use of bold text in place of headings.
* A11yFirst Help: Cover the semantics of headings, lists, image descriptions, the importance of descriptive link text, and the proper use of character styles.

As lead designer and also one of the stakeholders determining the direction for the project, we proceeded with creating the Headings/Paragraph plugin first, along with the Help plugin, to which we added content as we understood more about how each plugin would function.

