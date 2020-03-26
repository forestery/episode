/*
Support we have a restful server on :http://192.168.20.18:21511/hbaseblu-0.0.2/sgp/hbase/0.0.2/hbase/getJson
which will return :
        return Response.status(Response.Status.OK).entity("{\"name\":\"chenjunqiang\"}")
                .header("Access-Control-Allow-Origin", "*")
                .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_TYPE.withCharset("utf-8"))
                .build();
an { "Access-Control-Allow-Origin", "*" } Type header suporting remote cross domain request.
and the result will be json type data charset with utf-8
   {
    "name":"chenjunqiang"
   }
.
this is a example for the croos domain request using jquery.

on : 192.168.10.34 : we have index.html servered by apache-tomcat.
     and we request json data from 192.168.20.18 by restful interface.

Tips:
background:
it is not allowed the get data derectly from other domain by using web browser.
So if you can take control of the data source. 
  you can add a  "Access-Control-Allow-Origin", "*"  header or use jsonp by assign the callback function.
if not ,you can only use a web-proxy the get the result and then give the result an "Access-Control-Allow-Origin", "*"  header.

there are solutions for cross domain request:
1. jsonp:  assign a callback function like  ?callback=callback1  and on the server side : we use  echo("  callback1(\"something you want to response\")  ")
    this is not good sometime because the server side have the know which callback function to call.\
    it may be useful in some special situation.
2. use a third-party server(or make it by your self for data safe). then get the data instead of client and set a { "Access-Control-Allow-Origin", "*" } Type header then response to client.

3. edit the document.domain to do it.

4. when using html5. window.postMessage is another choice.

*/



$.ajax({
    url: "http://192.168.20.18:21511/hbaseblu-0.0.2/sgp/hbase/0.0.2/hbase/getJson",
    //data: { "id":"doc1", "rows":"100" },
    type: "GET",
    timeout: 30000,
    dataType: "json", // "xml", "json"
    success: function(data) {
        alert(data['name']);
    },
    error: function(jqXHR, textStatus, ex) {
        alert(textStatus + "," + ex + "," + jqXHR.responseText);
    }
   
}); 