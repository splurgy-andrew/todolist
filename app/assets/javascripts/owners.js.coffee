# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on('ajax:success', '.btn-delete', (event,data,status) ->
  if status == "success"
    $(this).closest("tr").remove()
)

$("#nav_new_owner").click (e) ->
  $("#new_owner_add").removeClass "hidden"
  e.preventDefault()

$("#new_owner").on "ajax:success", (event, data, status, xhr) ->
  handle_success(event, data, status, xhr)

handle_success = (event, data, status, xhr) ->
  if status == "success"
    $("#new_owner_add").find("input[type=text], textarea").val("")
    $("#new_owner_add").addClass "hidden"
    new_row = $("#new_owner_show").clone()
    new_row = new_row.attr("id", "").removeClass("hidden")

    new_row.find("td.replace_field").each ->
      $(this).text( $(this).text().replace("{NAME}", data.name) )
      $(this).text( $(this).text().replace("{EMAIL}", data.email) )

    new_row.find("a").attr "href", ->
      @href.replace "_ID_", data.id
    $("#owner_table tr.hidden:first").before(new_row)

$("#new_owner").on "ajax:error", (xhr, status, error) ->
  handle_error(xhr, status, error)

handle_error = (xhr, status, error) ->
  console.log(xhr)
  console.log(status)
  console.log(error)