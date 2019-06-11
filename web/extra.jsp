<script type="text/javascript">
 $(document).ready(function(){
 $("#catid").change(function(){
 catid = $(this).val()
 if(catid!="seeall")
 {
     $.ajax({
 method : "post",
 url : "ajax1.jsp",
 data : {catid12 : catid}
 })
 .done(function(rdata){
 $("#mytable").html(rdata)
 });
 
 }
 else
 {
     
    $.ajax({
 method : "post",
 url : "ajax1.jsp",
 data : {catid2 : "seeall"}
 })
 .done(function(rdata){
 $("#mytable").html(rdata)
 });  
     
 }
 })
 })
 
 
 
 </script>
  <script type="text/javascript">
 $(document).ready(function(){
 $("#catid").change(function(){
 catid = $(this).val()
 if(catid!="seeall")
 {
 $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {catid1 : catid}
 })
 .done(function(rdata){
 $("#subcatbox").html(rdata)
 });
 }
 else
 {
     $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {catid11 : catid}
 })
 .done(function(rdata){
 $("#subcatbox").html(rdata)
 });
  
 }
 })
 })
 
 
 
 </script>