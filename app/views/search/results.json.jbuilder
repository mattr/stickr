json.extract! @query, :text
json.partial! "search/result", collection: @query.photos
