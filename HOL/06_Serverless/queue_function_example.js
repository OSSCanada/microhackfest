// the context object contains the bindings to 
// You pass in trigger objects that you configure in integaration by its name, defined in the integration settings
// Each function should end with context.done() - the callback function when the function completes...like any good node-ish thing should

module.exports = function(context, myQueueItem) {
    var myItem = {
        PartitionKey: "key",
        RowKey: guid(),
        Time: currentTime(),
        Msg: myQueueItem.Msg,
        OriginalTime: myQueueItem.Time
    }
    
    // you can bind objects to your context, and refer to them by name
    // in this case you can bind "outputTable" for your ouput integrations to use
    // we will use this to write to a table store in Azure
    context.bindings.outputTable = myItem;
    
    // context.log refers to the environment context - this will log output to the output console in the function's dashboard
    context.log("JS Queue trigger function process: " + myQueueItem.Msg + " | " + myQueueItem.Time);

    context.done()
};

// From https://stackoverflow.com/questions/105034/create-guid-uuid-in-javascript
// This function will create a UUID
function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

// This function will create the current time in the specified format "HH.MM.SS.fff"
function currentTime(){
    var time = new Date();
    return [time.getHours(), time.getMinutes(), time.getSeconds(), time.getMilliseconds()].join('.');
}