___INFO___

{
  "type": "CLIENT",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Google Ad Manager - Tagless Request",
  "categories": ["TAG_MANAGEMENT", "MARKETING"],
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Request an ad from Google Ad Manager without Google Publisher Tags.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "gamRequestPath",
    "displayName": "Request Path",
    "simpleValueType": true,
    "help": "Set the path you want to use to fetch the incoming request. This is a required field. If you send a request to SGTM with \u003cem\u003ehttps://sgtm.yourdomain.com/gam\u003c/em\u003e then set \"/gam\" in this field.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "gamConfig",
    "displayName": "Required Google Ad Manager Configuration",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "networkCode",
        "displayName": "Network Code",
        "simpleValueType": true,
        "help": "Please add your network code here. You can also use MCM with the \u003cstrong\u003e\u003cem\u003eparent, child\u003c/em\u003e\u003c/strong\u003e structure, e.g. \"123,456\".",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "adUnitCode",
        "displayName": "Ad Unit Code",
        "simpleValueType": true,
        "help": "Please add your add unit code here.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "creativeSize",
        "displayName": "Creative Size",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Width",
            "name": "width",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Height",
            "name": "height",
            "type": "TEXT",
            "valueValidators": []
          }
        ],
        "valueValidators": [
          {
            "type": "TABLE_ROW_COUNT",
            "args": [
              1
            ]
          }
        ],
        "help": "Set the creative sizes you want to request from Google Ad Manager."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "optionalConfig",
    "displayName": "Optional Google Ad Manager Configurations",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "customAdHost",
        "checkboxText": "Set custom Ad Host",
        "simpleValueType": true,
        "help": "Set a custom host for the ad request. Default value is the hostname of incoming request. This is only required for MCM requests."
      },
      {
        "type": "TEXT",
        "name": "adHost",
        "displayName": "Ad Host",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "customAdHost",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "mobileAd",
        "checkboxText": "Mobile Ad",
        "simpleValueType": true,
        "help": "Set an indicator, that the request is a mobile ad request."
      },
      {
        "type": "CHECKBOX",
        "name": "impressionTracking",
        "checkboxText": "Activate Impression Tracking",
        "simpleValueType": true,
        "help": "If enabled you can track downloaded impressions, also known as \"delayed\" impressions."
      },
      {
        "type": "CHECKBOX",
        "name": "customMimeType",
        "checkboxText": "Set Mime Type",
        "simpleValueType": true,
        "help": "Mime-type value for the HTTP request. Example value: \u003cstrong\u003etext/html\u003c/strong\u003e"
      },
      {
        "type": "TEXT",
        "name": "mimeType",
        "displayName": "Mime-type",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "customMimeType",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "customTargeting",
        "checkboxText": "Set slot-level key-value pairs for targeting",
        "simpleValueType": true,
        "help": "Activate this option to set key-value pairs for targeting in the HTTP tagless request."
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "targeting",
        "displayName": "Key-value pairs",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Key",
            "name": "key",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "REGEX",
                "args": [
                  "^[^\"!\u0027\\+#\\*~;\\^\\(\\)\u003c\u003e\\[\\]\u003d]*$"
                ],
                "errorMessage": "The following characters are not permitted in keys: \" \u0027 ! + # * ~ ; ^ ( ) \u003c \u003e [ ] \u003d"
              }
            ],
            "valueHint": ""
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "REGEX",
                "args": [
                  "^[^\"!\u0027\\+#\\*~;\\^\\(\\)\u003c\u003e\\[\\]\u003d]*$"
                ],
                "errorMessage": "The following characters are not permitted in values: \" \u0027 ! + # * ~ ; ^ ( ) \u003c \u003e [ ] \u003d"
              }
            ],
            "valueHint": ""
          }
        ],
        "enablingConditions": [
          {
            "paramName": "customTargeting",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "valueValidators": [
          {
            "type": "TABLE_ROW_COUNT",
            "args": [
              1
            ]
          }
        ],
        "help": "The following characters are not permitted in keys and values: \" \u0027 ! + # * ~ ; ^ ( ) \u003c \u003e [ ] \u003d"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "serverConfig",
    "displayName": "Optional Server Configurations",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "acao",
        "checkboxText": "Set custom Access-Control-Allow-Origin (ACAO) header",
        "simpleValueType": true,
        "help": "If not specified, a wildcard (*) will be used as default value."
      },
      {
        "type": "TEXT",
        "name": "acaoValue",
        "displayName": "ACAO Header Value",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "acao",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

// APIs
const getRequestPath = require('getRequestPath');
const claimRequest = require('claimRequest');
const Math = require('Math');
const getTimestampMillis = require('getTimestampMillis');
const getRequestHeader = require('getRequestHeader');
const sendHttpGet = require('sendHttpGet');
const setResponseStatus = require('setResponseStatus');
const setResponseBody = require('setResponseBody');
const setResponseHeader = require('setResponseHeader');
const returnResponse = require('returnResponse');
const encodeUri = require('encodeUri');
const encodeUriComponent = require('encodeUriComponent');
const log = require('logToConsole');

// Request and general Data
const requestPath = getRequestPath();
const cacheBusting = Math.round(getTimestampMillis() / 1000);
const adHost = data.adHost || getRequestHeader('host');
const gamEndpoint = 'https://securepubads.g.doubleclick.net/gampad/adx?';

// User Data
const gamRequestPath = data.gamRequestPath;
const networkCode = data.networkCode;
const adUnitCode = data.adUnitCode;
const creativeSize = data.creativeSize;
const adUnitPath = '/' + networkCode + '/' + adUnitCode;
const tagPosition = 1;
const acaoHeaderValue = data.acaoValue || '*';
const mimeType = data.mimeType;

// Build request string for creative sizes
let creativeSizesCombined = [];
creativeSize.forEach((c, i) => {
  creativeSizesCombined.push(c.width + 'x' + c.height);
});
const creativeSizesRequestString = encodeUri(creativeSizesCombined.join('|'));

// Build request URL
let requestUrl = gamEndpoint + 'iu=' + adUnitPath + '&sz=' + creativeSizesRequestString + '&url=' + adHost + '&c=' + cacheBusting + '&tile=' + tagPosition;

// Add additional parameter to request URL
if (data.mobileAd) {
  requestUrl += '&mob=js';
}

if (data.impressionTracking) {
  requestUrl += '&d_imp=1&d_imp_hdr=1';
}

if (data.customMimeType) {
  requestUrl += '&m=' + mimeType;
}

if (data.customTargeting) {
  const targeting = data.targeting;
  let customTargetingCombined = [];
  targeting.forEach((t, i) => {
    customTargetingCombined.push(t.key + '=' + encodeUriComponent(t.value));
  });

  const customTargetingRequestString = encodeUriComponent(customTargetingCombined.join('&'));
  
  requestUrl += '&t=' + customTargetingRequestString;
}

// Google Ad Manager Tagless Request Logic
if (requestPath === gamRequestPath) {
  
  claimRequest();
      
  sendHttpGet(requestUrl)
    .then((result) => {
      setResponseHeader('Access-Control-Allow-Origin', acaoHeaderValue);
      setResponseStatus(result.statusCode);
      setResponseBody(result.body);
      returnResponse();
    
      if (data.impressionTracking) {
        const impressionUrl = result.headers['google-delayed-impression'];
        
        sendHttpGet(impressionUrl)
          .then((result) => {
            log('Impression Tracking Ping successful');
          })
          .catch((error) => {
            log(error);
          });
      }
    })
    .catch((error) => {
       log(error);
    });
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_response",
        "versionId": "1"
      },
      "param": [
        {
          "key": "writeResponseAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "writeHeaderAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "return_response",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 17.3.2023, 14:56:04


