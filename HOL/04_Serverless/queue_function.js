module.exports = function(context, myQueueItem) {
    var myItem = {
        PartitionKey: "key",
        RowKey: guid(),
        Time: currentTime(),
        Msg: myQueueItem.Msg,
        OriginalTime: myQueueItem.Time
    }
    
    context.log("JS Queue trigger function process: " + myQueueItem.Msg + " | " + myQueueItem.Time);
    context.bindings.outputTable = myItem;

    context.done()
};

// From https://stackoverflow.com/questions/105034/create-guid-uuid-in-javascript
function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

function currentTime(){
    var time = new Date();
    return [time.getHours(), time.getMinutes(), time.getSeconds(), time.getMilliseconds()].join('.');
}