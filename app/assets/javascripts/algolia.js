$(document).ready(function(){

  var client = algoliasearch('TD2L7F219M', '890988be1192e467629d7c4f30060ac9');
  var index = client.initIndex('Book');
  $('#aa-search-input').autocomplete(
    {hint: false}, [
    {
      source: $.fn.autocomplete.sources.hits(index, { hitsPerPage: 5 }),
      //value to be displayed in input control after user's suggestion selection
      displayKey: 'title',
      //hash of templates used when rendering dataset
      templates: {
        //'suggestion' templating function used to render a single suggestion
        suggestion: function(suggestion) {
          return '<img src="' + suggestion.img_url + '"><span><strong>' +
            suggestion._highlightResult.title.value + '</strong></span> <span>' +
            suggestion._highlightResult.author.value + '</span>';
        }
      }
    }
  ]).on('autocomplete:selected', function(event, suggestion, dataset) {
    window.location = '/books/' + suggestion.objectID;
  });


});
