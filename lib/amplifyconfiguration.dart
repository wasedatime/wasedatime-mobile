const amplifyconfig = '''{
  "api": {
      "plugins": {
          "awsAPIPlugin": {
              "wasedatime-rest-api": {
                  "endpointType": "REST",
                  "endpoint": "https://api.wasedatime.com/staging/",
                  "region": "ap-northeast-1",
                  "authorizationType": "NONE"
              }
          }
      }
  },
  "auth": {
    "plugins": {
      "awsCognitoAuthPlugin": {
        "CognitoUserPool": {
          "Default": {
            "PoolId": "ap-northeast-1_dKhj1aZQy",
            "AppClientId": "7cem3jhj1sl2odev019tclr8pr",
            "Region": "ap-northeast-1"
          }
        },
        "CredentialsProvider": {
          "CognitoIdentity": {
              "Default": {
                  "PoolId": "ap-northeast-1_dKhj1aZQy",
                  "Region": "ap-northeast-1"
              }
          }
        },
        "Auth": {
          "Default": {
            "OAuth": {
              "WebDomain": "auth.wasedatime.com",
              "AppClientId": "7cem3jhj1sl2odev019tclr8pr",
              "SignInRedirectURI": "wasedatime://verify",
              "SignOutRedirectURI": "wasedatime://",
              "Scopes": [
                "email",
                "openid",
                "profile",
                "aws.cognito.signin.user.admin"
              ]
            }
          }
        }
      },
      "awsCloudWatchLoggingPlugin": {
        "enable": true,
        "logGroupName": "DEBUG",
        "region": "ap-northeast-1",
        "localStoreMaxSizeInMB": 1,
        "flushIntervalInSeconds": 60,
        "loggingConstraints": {
          "defaultLogLevel": "DEBUG"
        }
      }
    }
  }
}''';
