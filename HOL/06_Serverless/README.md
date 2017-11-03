# Working with Azure Functions

This lab shows the different ways Functions can be triggered. Timer, HTTP and Queue are a few of the ways.

## 1. Create HTTP Function

The purpose of this section is to show you how quickly you can create a REST API.

- Go to Azure Portal and create a new Function App.
- Once the Function App has been deployed, go to the Function App and create a new **HTTP Trigger** Function.
- Do not add any code at this time, we will leverage the default scaffolded Function.
- Find the Function URL and test the Function Endpoint from Browser.
- When testing you can see the Function Logs in the bottom panel. You can also see the Logs via the Monitor feature in the menu on the left-hand side, this is very handy for troubleshooting.

**Hint:** Click [here](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-azure-function) if you are having difficulties.

## 2. Create a New GitHub Webhook Function

The purpose of this section is to help you understand how easy it can be to integrate Web Hook functionality.

- Go to http://github.com and create a GitHub Account if you do not have one already.
- Pick an existing GitHub Repository (ie. Repo) or create a new one, then setup a **Comment** webhook under **Settings**.
- Similar to step 1 above, leverage the same Function App, but this time create a **Webhhok Trigger** Function.
- Write code inside of the Function that writes the **GitHub Comment** to the Function Log.

**Hint:** Click [here](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-github-webhook-triggered-function) if you are having difficulties.

## 3. Create a File Moving Flow

The purpose of this section is to help you understand how you can leverage Functions to move data around in Azure. We are going to take data that arrives in a Queue and put it into an Azure Storage Table. This can just as easily be a SQL or No SQL DB as well.

- Similar to step 1 above, leverage the same Function App, but this time create a **Timer Trigger** Function.
	* Schedule the timer for every 20 seconds
	* Have Function write to the Log
- Validate that the Function is working as expected.
- Next, change the Function to add a message to a Queue. In the portal, go to the Integrate feature and add an **Azure Storage Queue** as an **Output**. Name the ``Message parameter name`` variable **myQueueItem**.
- Add code to the Function that writes a message to the Queue when the Timer fires (ie. every 20 seconds).
- We are now going to create the Function that reads from the Queue and adds the message to the Azure Table.
- Similar to step 1 above, leverage the same Function App, but this time you are going to create a **Queue Trigger** that points to the Queue that was written to by the Timer Function.
- Once the Queue Trigger Function is created, go to the Integrate feature in the menu on the left-hand side and create a new **Azure Storage Tables Output**.
- Add logic to your Function that reads from the Queue and writes to the Table.

**Hint:** If you are having difficulties, check-out the [C#](queue_function_example.csx) and [NodeJS](queue_function_example.csx) examples in this folder.

## Advanced

1. Add Application Insights to your Function for increased visibility to what is happenning with your Function at runtime.
	- **Hint:** Click [here](https://blogs.msdn.microsoft.com/appserviceteam/2017/05/10/application-insights-integration-with-functions-now-in-preview/) for an example.
2. Add Cognitive Services - Sentiment Analysis to HTTP Function in step 1.

	The purpose of this section is to help you understand how to add intelligence to your applications. In this case we are leveraging Cognitive Services - Sentiment Analysis, but this can just as easily be a custom Machine Learning algorithm.

	- Add Cognitive Servics Sentiment Analysis Response to HTTP Function. In order to do this you first need to add the Cognitive Services resource to your Resource Group. Click [here](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account) for details.
	- The second step of this flow is to pass something in to the Function. Same as any other API, this can be done via **Pass Parameter via Query String** or **Pass Parameter via Post**. Click [here](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-serverless-api) for hints around how to do this.
	- The last step is to add the Cognitive Services - Sentiment Analysis to the code.
	- **Hint:** Click [here](https://docs.microsoft.com/en-us/azure/azure-functions/functions-twitter-email) for a comprehensive example that includes Functions, Logic Apps, Twitter and Cognitive Services.
 