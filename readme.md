# DEMO_21_R5_FormObjects

This demo project showcases the new border and background properties of form objects in 4D 21 R5.
With 4D 21 R5, you can style buttons, inputs, and list boxes without image assets, from the Form Editor, CSS, or code.

The demo is a small order desk app. It has a list of orders and an order detail form. A theme panel switches between System, Rounded System, Blue, Grey, and Orange styles at runtime. The panel also displays the code that was applied.

It covers:
- **Buttons with a custom border style**: background color, border color, and corner radius (`Border Custom`, `OBJECT SET CORNER RADIUS`).
- **Border color** on inputs and list boxes, separate from the font color: the 4th parameter of `OBJECT SET RGB COLORS` and `LISTBOX SET GRID COLOR`. The order detail form uses it to highlight required fields that are empty.
- **System vs Rounded System** input styles on macOS Liquid Glass (`Border System Rounded`).
- **CSS classes** with light and dark mode rules for the start screen buttons.

Here is a list of blog posts covering the different features used in this demo:
- [Customize Buttons, Radio Buttons, and Check Boxes with Background and Border Properties](https://blog.4d.com/customize-buttons-radio-buttons-and-check-boxes-with-background-and-border-properties/)
- [Give Your Form Objects the Border Color They Deserve](https://blog.4d.com/give-your-form-objects-the-border-color-they-deserve/)
- [Choose the Right Native Input Style for Your Interface on macOS](https://blog.4d.com/choose-the-right-native-input-style-for-your-interface-on-macos/)


## Installing and Using a 4D Project

### Pre-requisites

* Download the latest Release version of 4D from: https://us.4d.com/product-download or the latest Beta version from: https://discuss.4d.com
* Follow the activation steps for 4D from: https://developer.4d.com/docs/GettingStarted/installation

### Steps to Run the Project

* Clone or download the GitHub repository containing the 4D project to your local machine. Need help, check out [this blog](https://blog.4d.com/github-4d-depot/).
* Open the 4D project in your 4D software by navigating to "File > Open Project".  You can find more details [here](https://developer.4d.com/docs/GettingStarted/creating#opening-a-project).
* Play with this demo.
* Navigate to the "Mode/Return to design mode" menu to view the code.

By following these steps, you will be able to successfully install and run a 4D project.
