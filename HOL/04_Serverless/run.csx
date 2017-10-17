using System;

public static void Run(QItem myQueueItem, ICollector<TableItem> myTable, TraceWriter log)
{
	TableItem myItem = new TableItem
	{
	  PartitionKey = "key",
	  RowKey = Guid.NewGuid().ToString(),
	  Time = DateTime.Now.ToString("hh.mm.ss.ffffff"),
	  Msg = myQueueItem.Msg,
	  OriginalTime = myQueueItem.Time    
	};
	log.Verbose($"C# Queue trigger function processed: {myQueueItem.Msg} | {myQueueItem.Time}");
}

public class TableItem
{
	public string PartitionKey {get; set;}
	public string RowKey {get; set;}
	public string Time {get; set;}
	public string Msg {get; set;}
	public string OriginalTime {get; set;}
}

public class QItem
{
	public string Msg { get; set;}
	public string Time { get; set;}
}