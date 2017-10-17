# Working with Azure Functions

This lab shows the different ways Functions can be executed.

## How To:

1. Create a HTTP Function from the quickstart
	* Azure Portal
	* Create HTTP Accessible Function
	* Test Function via Portal
	* Access Function Endpoint from Browser
2. Verify Function Execution via Logs
3. Add Cognitive Servics Sentiment Analysis Response to HTTP Function
	* Pass Parameter via Query String
	* Pass Parameter via Post
	* Setup Sentiment Analysis and get Key
	* Retrieve Key from Application Settings
4. Create a new GitHub Webhook Function
	* Create GitHub Account if do not have one already
	* Setup Issue Comment Webhook in GitHub
		Pick Existing Repo or Create New One
		Go to Settings
	* Test Webhook by creating a Comment
5. Create Timer Function
	* Schedule the timer for every 20 seconds
	* Have Function write to the Log
6. Add Message Queue to Timer Function
	* Add Queue as Output and call it myQueueItem
	* Add Code to Function to write message to Queue
7. Create Output Queue Trigger Function
	* This Function will fire whenever a message is put into the Queue from above
	* Have Function write Queue Message to Azure Table Storage using Bindings

## Advanced

1. Create pre-compiled Azure Function via SDK and Tooling
2. Create DevOps Process
3. Add Application Insights
	* Add to Function App
	* Add Custom Event to Function Code
4. Create a Function that Binds to Multiple Sources at once
	* Trigger is a Queue
	* Binds to Storage as an input
	* Binds to CosmosDB as an output