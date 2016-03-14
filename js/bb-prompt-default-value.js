/**
 * Created by artemiy on 3/14/16.
 */
bootbox.prompt({
  title: "Edit",
  value: "<%= #{@task} %>",
  callback: function(result) {
    if (result === null) {
      Example.show("Prompt dismissed");
    } else {
      Example.show("Hi <b>"+result+"</b>");
    }
  }
});