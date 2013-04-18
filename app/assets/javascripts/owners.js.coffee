# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on('ajax:success', '.btn-delete', (a,b,c) ->
  console.log("a: ")
  console.log(a)
  console.log("\nb: ")
  console.log(b)
  console.log( "\nc: ")
  console.log(c)
  if c == "success"
    $(this).closest("tr").remove()
)

$("#nav_new_owner").click (e) ->
  $("#new_owner_add").removeClass "hidden"
  false

$("#new_owner").on "ajax:success", (a, b, c, d) ->
  handle_success(a, b, c, d)

handle_success = (a, b, c, d) ->
  console.log("a: ")
  console.log(a)
  console.log("\nb: ")
  console.log(b)
  console.log( "\nc: ")
  console.log(c)
  console.log( "\nd: ")
  console.log(d)
  if c == "success"
    $("#new_owner_add").find("input[type=text], textarea").val("") #clear form
    $("#new_owner_add").addClass "hidden"
    new_row = $("#new_owner_show").clone()
    new_row = new_row.attr("id", "").removeClass("hidden")
    owner_name = new_row.find("td#owner_name")
    owner_email = new_row.find("td#owner_email")
    owner_name.text(owner_name.text().replace("{NAME}", b.name)).attr("id", "")
    owner_email.text(owner_email.text().replace("{EMAIL}", b.email)).attr("id", "")
    new_row.find("a").attr "href", ->
      @href.replace "_ID_", b.id
    $("#owner_table tr.hidden:first").before(new_row)

#  .on( events [, selector ] [, data ], handler(eventObject) )

$("#new_owner").on "ajax:error", (xhr, status, error) ->
  handle_error(xhr, status, error)

handle_error = (xhr, status, error) ->
  console.log(xhr)
  console.log(status)
  console.log(error)