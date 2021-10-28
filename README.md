# Basic Node.js App with Express
#### Deployed into an azure container using Azure WebApp package with Gihub Actions

> This repo was created to clear how to deploy a single docker container runing a basic Node.js application with Typescript using [azure/webapps-deploy@v2]() 



> Related with these issues
> [#34451](https://github.com/MicrosoftDocs/azure-docs/issues/34451), [#62946](https://github.com/MicrosoftDocs/azure-docs/issues/62946), [#31771](https://github.com/MicrosoftDocs/azure-docs/issues/31771), [46401](https://github.com/MicrosoftDocs/azure-docs/issues/46401)

Another common situations why your app is not running:

1. don't use ``EXPOSE`` flag on ``Dockerfile`` (apparently Azure use it internally)

2. SET [ WEBSITES_CONTAINER_START_TIME_LIMIT](https://docs.microsoft.com/en-us/archive/blogs/waws/things-you-should-know-web-apps-and-linux#if-your-site-doesnt-start-check-the-docker-logapplies-to-web-app-for-containers), increase it to max timeout

3. [USE PERSONAL ACCESS TOKEN INSTEAD GITHUB_TOKEN](https://github.community/t/github-actions-continuous-delivery-with-azure-username-with-uppercase-character/149895/5) cause github tokens expires.


> Following this steps you will be able to deploy your app with a Single dockerfile

[Test live example deployed with this code](https://irvv17-deployment-nodeapp-azure.azurewebsites.net/api/server-status)

⚠️ If you try to test the app you need to wait a couple of minutes 'cause this deploy [turn off the server on inactivity](https://docs.microsoft.com/en-us/azure/app-service/configure-common), just wait for a minute after hit a request and you will got a response.

> This works if you came from [GithubLab, GitHub Actions: Continuous Delivery with Azure](https://lab.github.com/githubtraining/github-actions:-continuous-delivery-with-azure) 'cause the starter example with static files didn't work for me,you can make work it with this configuration too.
> 
Project structure created with **npx**

``` npx create-express-typescript-application express-ts-app```

Project structure:
```
                                                                    ─╯
.
├── build
│   ├── src
│   │   ├── app
│   │   │   ├── sample
│   │   │   └── server-status
│   │   ├── constants
│   │   │   └── endpoint.js
│   │   ├── utils
│   │   │   └── getFilesWithKeyword.js
│   │   ├── index.js
│   │   └── server.js
│   └── config.json
├── src
│   ├── app
│   │   ├── sample
│   │   │   └── sample.router.ts
│   │   └── server-status
│   │       ├── server-status.router.ts
│   │       └── server.status.service.ts
│   ├── constants
│   │   └── endpoint.ts
│   ├── utils
│   │   └── getFilesWithKeyword.ts
│   ├── index.ts
│   └── server.ts
├── Dockerfile
├── README.md
├── config.json
├── package-lock.json
├── package.json
└── tsconfig.json


```
