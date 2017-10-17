// You must include a context, but other arguments are optional
module.exports = function(context) {
    
};
// or you can include additional inputs in your arguments
module.exports = function(context) {
    
    var myItem = {
        PartitionKey: "key",
        RowKey: guid(),
        Time: Date.Now.ToString("hh.mm.ss.ffffff"),
        Msg: context.bindings.myQueueItem.Msg,
        OriginalTime: context.bindings.myQueueItem.Time
    }
    
    console.log.verbose("JS Queue trigger function process: " + context.bindings.myQueueItem.Msg + " | " + context.bindings.myQueueItem.Time);

    context.done(null)
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