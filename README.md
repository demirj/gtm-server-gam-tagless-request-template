# Google Tag Manager Server Client-Template for Tagless Requests of Google Ad Manager

This serverside Google Tag Manager Client-Template lets you perform an ad request to Google Ad Manager without using Google Publisher Tags in the Frontend. Please read more about Google Ad Manager Tagless Request here:

- Google Ad Manager Help: https://support.google.com/admanager/answer/2623168?hl=en

## How to import this template

1. Download file "template.tpl" from this repository
2. Go to your Google Tag Manager Server-Container
3. Go to "Templates" and click "New"
4. At the top right click the three dots and select "Import"
5. Select the downloaded file from step 1, import and save it

Once you have imported it, you can go to "Clients" in Server-Container to set up the Client.

## How to implement Tagless Request with this Template

The implementation consists of two main steps:

1. First implement logic in frontend to make a request from the browser to your serverside Google Tag Manager Endpoint and to parse and render the response
2. Setup Client in GTM-Server UI

### Implementation in fronted
One main requirement to use this Client template in Google Tag Manager Server-Container is first to initialize a request to the serverside Google Tag Manager. Also make sure to parse and render the reponse into the ad slot. Here is a simple example:

```js
<div id="tagless-request">
    <script>
        fetch('https://your.serverside-gtm.com/gam')
          .then((response) => {
            return response.text();
          })
          .then((text) => {
            document.getElementById("tagless-request").innerHTML = text;  
          });
    </script>
</div>
```
**There are some important aspects here:**
- Replace "your.serverside-gtm.com" with your serverside Google Tag Manager endpoint.
- The request path in the example includes "/gam", but you can specify anything you want. You have to make sure to use same request path as the listener in the Client-Template in the field "Request Path" (more on that below).
- A fetch-request from the browser to your GTM server will cause a preflight request, which first needs to be handled by your server container. You can use this tag for this purpose: https://github.com/gtm-templates-simo-ahava/preflight-request
- If you want to test the implementation with the server container preview mode you might have to set the **X-Gtm-Server-Preview** header to your HTTP request. You can find the value for that header in the preview mode. Swith to the preview mode of server container, click on the three dots at the top right and then you will find the value in the "X-Gtm-Server-Preview HTTP header" field. Set this field in the request like in following code example.

*Request with X-Gtm-Server-Preview header:*
```js
<div id="tagless-request">
    <script>
        fetch('https://your.serverside-gtm.com/gam', {
          headers: {
            "X-Gtm-Server-Preview": "XXX" // Add your value here
          }
         })
          .then((response) => {
            return response.text();
          })
          .then((text) => {
            document.getElementById("tagless-request").innerHTML = text;  
          });
    </script>
</div>
```

### Setup Client
In GTM UI go to "Clients", click on "New" and select the imported Client-Template. Then you have different fields to set up:

![Screenshot of Template](https://www.demirjasarevic.com/wp-content/uploads/2023/04/gam-client-sgtm.png)

- **"Request Path":** Please set the request path you are using to initiate the request here. So if you are using e.g. "https://your.serverside-gtm.com/gam" in the fetch-command, then set here "/gam" as value.
- **Network Code:** Add your Google Ad Manager network code here. You can also use MCM with the parent, child structure, e.g. "123,456".
- **Ad Unit Code**: Add your add unit code, provided by Google Ad Manager, here.
- **Creative Size**: Specify the creative sizes to request from the ad server here.
- **Set custom Ad Host**: Set a custom host for the ad request. Default value is the hostname of incoming request. This is only required for MCM requests.
- **Mobile Ad**: Set the indicator, that the request is a mobile ad request.
- **Activate Impression Tracking**: Enable impression tracking.
- **Activate Third-Party Impression Tracking**: Enable third-party impression tracking, if present in the creative.
- **Set Mime Type**: Add a specific mime-type in the HTTP request like "text/html" or similar.
- **Set a mobile device screen width and height.**: Enabling this option will send the mobile device screen width and height in the request. Please ensure to send this information to serverside GTM and to set the corresponding value through a variable.
- **Set slot-level key-value pairs for targeting**: Set your targeting key-values here.
- **Set custom Access-Control-Allow-Origin (ACAO) header**: If not specified, a wildcard (*) will be used as default value.

## Editing history
- 2023/25/03: Added option to set a mobile device screen width and height.
- 2023/20/03: Third-Party Impression Tracking added.
- 2023/17/03: Support of setting slot-level key-value pairs for targeting
- 2023/13/03: Added option to set mime-type in HTTP request
- 2023/09/03: Added option to enable impression tracking
- 2023/08/03: Initial release.

## Current Backlog of Template
- None
