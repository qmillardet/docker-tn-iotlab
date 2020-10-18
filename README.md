# docker-tn-iotlab
Execute Telecom iotlab on Docker

# Launch

You need to install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/).
After this, you need to execute the following command in a terminal : 
```
git clone https://github.com/qmillardet/docker-tn-iotlab.git
cd docker-tn-iotlab
docker-compose up -d
```

# Troubleshooting

## Error first launch conatainer

If you have this error : 

```
Internal Exception: java.sql.SQLException: Error in allocating a connection. Cause: Connection could not be allocated because: Unable to open a test connection to the given database. JDBC url = jdbc:mysql://iotlab-db:3306/iotlab, username = admin. Terminating connection pool (set lazyInit to true if you expect to start your database after your app). Original Exception: ------
com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure

The last packet sent successfully to the server was 0 milliseconds ago. The driver has not received any packets from the server.
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
	at com.mysql.jdbc.Util.handleNewInstance(Util.java:411)
	at com.mysql.jdbc.SQLError.createCommunicationsException(SQLError.java:1129)
	at com.mysql.jdbc.MysqlIO.<init>(MysqlIO.java:358)
	at com.mysql.jdbc.ConnectionImpl.coreConnect(ConnectionImpl.java:2498)
	at com.mysql.jdbc.ConnectionImpl.connectOneTryOnly(ConnectionImpl.java:2535)
	at com.mysql.jdbc.ConnectionImpl.createNewIO(ConnectionImpl.java:2320)
	at com.mysql.jdbc.ConnectionImpl.<init>(ConnectionImpl.java:834)
	at com.mysql.jdbc.JDBC4Connection.<init>(JDBC4Connection.java:46)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
	at com.mysql.jdbc.Util.handleNewInstance(Util.java:411)
	at com.mysql.jdbc.ConnectionImpl.getInstance(ConnectionImpl.java:416)
	at com.mysql.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:347)
	at java.sql.DriverManager.getConnection(DriverManager.java:664)
	at java.sql.DriverManager.getConnection(DriverManager.java:247)
	at com.jolbox.bonecp.BoneCP.obtainRawInternalConnection(BoneCP.java:363)
	at com.jolbox.bonecp.BoneCP.<init>(BoneCP.java:416)
	at com.jolbox.bonecp.BoneCPDataSource.getConnection(BoneCPDataSource.java:120)
	at com.sun.gjc.spi.DSManagedConnectionFactory.createManagedConnection(DSManagedConnectionFactory.java:115)
	at com.sun.enterprise.resource.allocator.LocalTxConnectorAllocator.createResource(LocalTxConnectorAllocator.java:87)
	at com.sun.enterprise.resource.pool.ConnectionPool.createSingleResource(ConnectionPool.java:907)
	at com.sun.enterprise.resource.pool.ConnectionPool.createResource(ConnectionPool.java:1189)
	at com.sun.enterprise.resource.pool.datastructure.RWLockDataStructure.addResource(RWLockDataStructure.java:98)
	at com.sun.enterprise.resource.pool.ConnectionPool.addResource(ConnectionPool.java:282)
	at com.sun.enterprise.resource.pool.ConnectionPool.createResourceAndAddToPool(ConnectionPool.java:1512)
	at com.sun.enterprise.resource.pool.ConnectionPool.createResources(ConnectionPool.java:944)
	at com.sun.enterprise.resource.pool.ConnectionPool.initPool(ConnectionPool.java:230)
	at com.sun.enterprise.resource.pool.ConnectionPool.internalGetResource(ConnectionPool.java:511)
	at com.sun.enterprise.resource.pool.ConnectionPool.getResource(ConnectionPool.java:381)
	at com.sun.enterprise.resource.pool.PoolManagerImpl.getResourceFromPool(PoolManagerImpl.java:245)
	at com.sun.enterprise.resource.pool.PoolManagerImpl.getResource(PoolManagerImpl.java:170)
	at com.sun.enterprise.connectors.ConnectionManagerImpl.getResource(ConnectionManagerImpl.java:360)
	at com.sun.enterprise.connectors.ConnectionManagerImpl.internalGetConnection(ConnectionManagerImpl.java:307)
	at com.sun.enterprise.connectors.ConnectionManagerImpl.allocateConnection(ConnectionManagerImpl.java:196)
	at com.sun.enterprise.connectors.ConnectionManagerImpl.allocateConnection(ConnectionManagerImpl.java:171)
	at com.sun.enterprise.connectors.ConnectionManagerImpl.allocateConnection(ConnectionManagerImpl.java:166)
	at com.sun.gjc.spi.base.AbstractDataSource.getConnection(AbstractDataSource.java:114)
	at org.eclipse.persistence.sessions.JNDIConnector.connect(JNDIConnector.java:123)
	at org.eclipse.persistence.sessions.DatasourceLogin.connectToDatasource(DatasourceLogin.java:162)
	at org.eclipse.persistence.internal.sessions.DatabaseSessionImpl.setOrDetectDatasource(DatabaseSessionImpl.java:204)
	at org.eclipse.persistence.internal.sessions.DatabaseSessionImpl.loginAndDetectDatasource(DatabaseSessionImpl.java:741)
	at org.eclipse.persistence.internal.jpa.EntityManagerFactoryProvider.login(EntityManagerFactoryProvider.java:239)
	at org.eclipse.persistence.internal.jpa.EntityManagerSetupImpl.deploy(EntityManagerSetupImpl.java:685)
	at org.eclipse.persistence.internal.jpa.EntityManagerFactoryDelegate.getAbstractSession(EntityManagerFactoryDelegate.java:204)
	at org.eclipse.persistence.internal.jpa.EntityManagerFactoryDelegate.createEntityManagerImpl(EntityManagerFactoryDelegate.java:304)
	at org.eclipse.persistence.internal.jpa.EntityManagerFactoryImpl.createEntityManagerImpl(EntityManagerFactoryImpl.java:336)
	at org.eclipse.persistence.internal.jpa.EntityManagerFactoryImpl.createEntityManager(EntityManagerFactoryImpl.java:302)
	at org.glassfish.persistence.jpa.JPADeployer$2.visitPUD(JPADeployer.java:451)
	at org.glassfish.persistence.jpa.JPADeployer$PersistenceUnitDescriptorIterator.iteratePUDs(JPADeployer.java:510)
	at org.glassfish.persistence.jpa.JPADeployer.iterateInitializedPUsAtApplicationPrepare(JPADeployer.java:492)
	at org.glassfish.persistence.jpa.JPADeployer.event(JPADeployer.java:398)
	at org.glassfish.kernel.event.EventsImpl.send(EventsImpl.java:131)
	at com.sun.enterprise.v3.server.ApplicationLifecycle.deploy(ApplicationLifecycle.java:487)
	at com.sun.enterprise.v3.server.ApplicationLifecycle.deploy(ApplicationLifecycle.java:219)
	at org.glassfish.deployment.admin.DeployCommand.execute(DeployCommand.java:491)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$2$1.run(CommandRunnerImpl.java:539)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$2$1.run(CommandRunnerImpl.java:535)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:360)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$2.execute(CommandRunnerImpl.java:534)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$3.run(CommandRunnerImpl.java:565)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$3.run(CommandRunnerImpl.java:557)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:360)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl.doCommand(CommandRunnerImpl.java:556)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl.doCommand(CommandRunnerImpl.java:1464)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl.access$1300(CommandRunnerImpl.java:109)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$ExecutionContext.execute(CommandRunnerImpl.java:1846)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$ExecutionContext.execute(CommandRunnerImpl.java:1722)
	at org.glassfish.admin.rest.resources.admin.CommandResource.executeCommand(CommandResource.java:404)
	at org.glassfish.admin.rest.resources.admin.CommandResource.execCommandSimpInMultOut(CommandResource.java:234)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.glassfish.jersey.server.model.internal.ResourceMethodInvocationHandlerFactory$1.invoke(ResourceMethodInvocationHandlerFactory.java:81)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher$1.run(AbstractJavaResourceMethodDispatcher.java:151)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher.invoke(AbstractJavaResourceMethodDispatcher.java:171)
	at org.glassfish.jersey.server.model.internal.JavaResourceMethodDispatcherProvider$ResponseOutInvoker.doDispatch(JavaResourceMethodDispatcherProvider.java:152)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher.dispatch(AbstractJavaResourceMethodDispatcher.java:104)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.invoke(ResourceMethodInvoker.java:387)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.apply(ResourceMethodInvoker.java:331)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.apply(ResourceMethodInvoker.java:103)
	at org.glassfish.jersey.server.ServerRuntime$1.run(ServerRuntime.java:271)
	at org.glassfish.jersey.internal.Errors$1.call(Errors.java:271)
	at org.glassfish.jersey.internal.Errors$1.call(Errors.java:267)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:315)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:297)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:267)
	at org.glassfish.jersey.process.internal.RequestScope.runInScope(RequestScope.java:297)
	at org.glassfish.jersey.server.ServerRuntime.process(ServerRuntime.java:254)
	at org.glassfish.jersey.server.ApplicationHandler.handle(ApplicationHandler.java:1028)
	at org.glassfish.jersey.grizzly2.httpserver.GrizzlyHttpContainer.service(GrizzlyHttpContainer.java:365)
	at org.glassfish.admin.rest.adapter.JerseyContainerCommandService$3.service(JerseyContainerCommandService.java:173)
	at org.glassfish.admin.rest.adapter.RestAdapter.service(RestAdapter.java:179)
	at com.sun.enterprise.v3.services.impl.ContainerMapper$HttpHandlerCallable.call(ContainerMapper.java:459)
	at com.sun.enterprise.v3.services.impl.ContainerMapper.service(ContainerMapper.java:167)
	at org.glassfish.grizzly.http.server.HttpHandler.runService(HttpHandler.java:201)
	at org.glassfish.grizzly.http.server.HttpHandler.doHandle(HttpHandler.java:175)
	at org.glassfish.grizzly.http.server.HttpServerFilter.handleRead(HttpServerFilter.java:235)
	at org.glassfish.grizzly.filterchain.ExecutorResolver$9.execute(ExecutorResolver.java:119)
	at org.glassfish.grizzly.filterchain.DefaultFilterChain.executeFilter(DefaultFilterChain.java:284)
	at org.glassfish.grizzly.filterchain.DefaultFilterChain.executeChainPart(DefaultFilterChain.java:201)
	at org.glassfish.grizzly.filterchain.DefaultFilterChain.execute(DefaultFilterChain.java:133)
	at org.glassfish.grizzly.filterchain.DefaultFilterChain.process(DefaultFilterChain.java:112)
	at org.glassfish.grizzly.ProcessorExecutor.execute(ProcessorExecutor.java:77)
	at org.glassfish.grizzly.nio.transport.TCPNIOTransport.fireIOEvent(TCPNIOTransport.java:561)
	at org.glassfish.grizzly.strategies.AbstractIOStrategy.fireIOEvent(AbstractIOStrategy.java:112)
Command deploy failed.
	at org.glassfish.grizzly.strategies.WorkerThreadIOStrategy.run0(WorkerThreadIOStrategy.java:117)
	at org.glassfish.grizzly.strategies.WorkerThreadIOStrategy.access$100(WorkerThreadIOStrategy.java:56)
	at org.glassfish.grizzly.strategies.WorkerThreadIOStrategy$WorkerThreadRunnable.run(WorkerThreadIOStrategy.java:137)
	at org.glassfish.grizzly.threadpool.AbstractThreadPool$Worker.doWork(AbstractThreadPool.java:565)
	at org.glassfish.grizzly.threadpool.AbstractThreadPool$Worker.run(AbstractThreadPool.java:545)
	at java.lang.Thread.run(Thread.java:748)
Caused by: java.net.ConnectException: Connection refused (Connection refused)
	at java.net.PlainSocketImpl.socketConnect(Native Method)
	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:350)
	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)
	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)
	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
	at java.net.Socket.connect(Socket.java:607)
	at java.net.Socket.connect(Socket.java:556)
	at java.net.Socket.<init>(Socket.java:452)
	at java.net.Socket.<init>(Socket.java:262)
	at com.mysql.jdbc.StandardSocketFactory.connect(StandardSocketFactory.java:256)
	at com.mysql.jdbc.MysqlIO.<init>(MysqlIO.java:308)
	... 113 more
------

Error Code: 0. Please see server.log for more details.
```

You can execute execute : 

```
docker exec -it iotlab-webserver /bin/bash
sed  -i 's#<property name="jdbcUrl" value="jdbc:mysql://localhost:3306/iotlab"/>#<property name="jdbcUrl" value="jdbc:mysql://iotlab-db:3306/iotlab"/>#g' /usr/local/glassfish4/bin/bonecp-datasource.xml
/usr/local/glassfish4/bin/asadmin add-resources /usr/local/glassfish4/bin/bonecp-datasource.xml
mysql -h iotlab-db -uadmin -padmin iotlab < /home/iotlab/server/sql/iotlab.sql
mysql -h iotlab-db -uadmin -padmin iotlab < /home/data.sql
/usr/local/glassfish4/bin/asadmin deploy /home/iotlab/server/bin/iotlab.war
```