# DemoSwiftInstagram

I'm create demo project for this Inastagram API wrapper.


SwiftInstagram uses client side (implicit) authentication, so you must **uncheck** the option **"Disable implicit OAuth"** from the Security tab of your [Instagram client](https://www.instagr.am/developer/clients/manage/).

Copy the Client ID from your client and paste it inside your `Info.plist` file with `InstagramClientId` as the key. Do the same with your redirection URI and the `InstagramRedirectURI` key.

![Info.plist](https://camo.githubusercontent.com/9d32bdc0ae0b1cb9932bcbf222e20e2b4aa0e1e4/68747470733a2f2f7261776769742e636f6d2f416e646572476f69672f5377696674496e7374616772616d2f646576656c6f702f2e6173736574732f496e666f2e706c6973742d46696c652e706e67)
