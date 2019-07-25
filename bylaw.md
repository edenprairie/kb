# Design Strategies

Strict adherence for maximum scalability and ease of deployments

The design should follow the 12 factor app principles as follows

## **Codebase**

**Each microservice will have its own codebase repository**. This makes individual development, ownership and deployment of each microservice possible. One codebase like a gitlab repository should be used to control the codebase of a single microservice. If it uses multiple repositories, it&#39;s not a microservice; it&#39;s a distributed system.

Each codebase can have multiple deploys. For example, production, staging, Raj&#39;s Local machine deploy etc.

**Multiple apps sharing common code should be factored as libraries and included through dependency managers**. For example in our current system, we have payloads defined in a project and we add them as project dependencies under the same solution. This is a violation of 12 factor. Instead, we should package the payload as a library and install it as a nugget package. It shouldn&#39;t be any difficult or expensive to set up a nuget server.

## **Dependencies**

 The **shared code should never be a project under the solution**. **It should be packaged as a library and installed through nuget**. When the code is checked in, the build system will inspect the package.json file and run a nuget restore on the project. This will fetch the latest version of the dependency from the nuget server.

 This also makes it so easy for a developer who wants to work on a new project. He doesn&#39;t have to open a huge code base but instead a very slim codebase, run dotnet restore command which will download and install all the dependencies and he can carry on with the development of one microservice he is concerned about.

## **Config**

**Config or configuration should never be the part of code**. This will make any deployments brittle. For example, see our config installer class. How huge it is, and see all the problems associated with it. Just imagine adding a new environment. You will have to copy all the keys and set up a new environment in config installer. Not a good way for agility.

The configuration usually contains connection strings, URIs to other resources, KEY/PASSWORDs to cloud services etc. If this is added as part of code and checked in into the codebase, over the time this will become unmanageable.  Anything which changes based on environments should not go into app.settings.json file.

**The best way to manage this is using environment variables**. This can be easily changed while the code is running without changing the code or stopping the code **. This is OS agnostic**. Environment variable is a common thing in LINUX, UNIX and WINDOWS. So our code config will run everywhere. On local machine of a developer, on premise servers and cloud without any problem.

Other point to this **is we should never have grouping**. Sometimes we group the settings like below

[
  DEV:{
    &quot;Setting1&quot;:&quot;Value1&quot;
  },
   INTG:{
    &quot;Setting1&quot;:&quot;Value2&quot;
  }
]

This is also a bad practice. Adding a new environment will be a pain later on. The environment variables should be granular.

## **Backing Services**

Anything the app depends upon which is external to the app can be considered as a backing service. For example a Cosmos DB or a URI to an external service or a SQL server connection. All of these should be considered as a backing service.

Traditionally DB is considered as a local resource and API calls as services. **In 12 factor app world, each of these are a backing service**.

In a 12-factor app, **the backing service could be shuffled without any code change**. That means, if you are using SQL server today, and you managed to migrate the data to oracle, the app should still work pointing to oracle with no code change. This takes us back to the first design principle – &quot; **Program to the interface**&quot;. Never program to a concrete class.

## **Build, Release and Run**

 A codebase will be transformed into three stages
Build  Converts the codebase into executables or dlls
Release  Makes a package of code + configuration
Run  Runs the app by launching a process in the execution environment.

The 12-factor app uses strict separation of these stages. **It should be impossible to change the code or configuration in the run time because it will be very difficult to propagate it back to the codebase** (gitlab repo). The deployment tool should have an option to roll back to a previous release in case of issues **. If any changes needs to be done to the code it should be a separate build. If any change needs to be done to config it should be a separate release. Each release should be stamped with a unique ID like a version number or so.**

## **Processes**

In our case this is simple. **The rule is each runtime process the app use should be stateless**. Even if we are caching some data, that data should not be available to another process or another http request. We should use some kind of backend service if we need caching. May be use a caching service or a database.

The advantage of this is you can shut down and spin up new processes and the depending apps should still work since we did not lose any data which was cached. Another advantage is that, this will make the spin up times very small, if an app depends on a cached data, it has to cache that data before it can do anything. That&#39;s bad for scalability since it will take more time to come up and be ready to do its job.

## **Port Binding**

Web apps are executed inside a server side container. In our case our .net core app will expose a port like localhost:5000 and some web server (ex: IIS, Apache tomcat) will forward the http request to the exposed port. **The rule says the app has no business in this port forwarding or anything of that sort**. It just listens on that port and the overlaying infrastructure should forward the requests to that port. This rule is more applied for java/ruby/python folks where it works differently than .net core. We don&#39;t have to do anything special here. Our framework handles this in the correct way.

## **Concurrency**

Same rule as Processes above. **Share nothing within the threads. Don&#39;t cache within the process**. You will be able to horizontally scale your app and handle more concurrent requests. This is easy rule to implement.

## **Disposability**

 The apps should be easily disposable. This means, **if we shut down the app arbitrarily, we should not lose important data.** So again the principle of no caching helps here. So when you shut down you don&#39;t lose any data.

Another point **is process should shut down gracefully**. Lets say the app is processing a request from the queue and we want to shut down the app. The app should do either of this. **It should stop accepting requests and complete processing the current queue item and then shut down. Or the app should stop accepting requests and return the current item back to the queue so another process can pick it up**.

Some thought also should be put on very rare occurrence of underlying hardware failure. The data should never be lost in such case too.

## **Dev/Prod parity**

This is a big deal in our current system. Dev is never same as production. Dev master config data is never same as prod. This leads to developers making bad decisions and code based on what they see and can access on Dev region. This happens due to many reasons like a time gap. A developer makes a code change today. But it will go to production after several months. This introduces a lot of disparity between prod and dev. **This can be eliminated if the changes are pushed to the subsequent environments as soon as possible with the help of a CI CD pipeline. This should avoid the usage of manual testing and substitute it with automated unit tests and automated integration tests. That will make the releases fast and decrease Dev/Prod disparity.**

Another thing we can use here is **Docker images**. We shall have every developer install Docker desktop. Whenever there is a release for any microservice, we containerize that release and store the image in a repository. If a developer needs to modify a microservice which depends on 10 other microservice and 2 other DBs all he has to do is pull the latest images for those 10 microservices from the repository, run the image (The environment variables will take care of this configuration. So no need to do the dreaded app.config edits) and point his microservice code to the Docker containers. That way we can be sure that each microservice is developed depending on the current prod version of the eco system and that eliminates a lots of issues we see today.

## **Logs**

The traditional way is to use something like a log4net and push it to a file. **The rule states that the app should only push the metrics or logs to a stream. It should be unaware of where the data will eventually be persisted**. It could be on a file, or a metrics collection service or product like splunk or heroku/logplex etc. Azure provides us a good way to ship logs and analyze and alert us using Application Insights.

## **Admin Process**

 The rule states if there is anything extra developed for administration for example a Console app or a DB script, it should always be shipped with the release. It should not be a separate release. The rule also states the admin process also should follow the 12-factor principles.
