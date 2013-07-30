format = (pair) ->
  output = ""
  indent = "    "
  newline = "\n"
  
  req = pair['request']
  res = pair['response']

  # Resource identifier
  output = "# " + req['method'] + " " + req['uri'] + newline 
  
  # Request
  output += "+ Request" + newline
  
  # Request headers
  output += indent + "+ Headers" + newline 
  output += newline
  Object.keys(req['headers']).forEach (key) =>
    output += indent + indent + indent + key + ":" + req['headers'][key] + newline
  output += newline
  
  # Request body
  output += indent + "+ Body" + newline
  output += newline
  req['body'].split('\n').forEach (line) ->
    output += indent + indent + indent + line + newline
  output += newline

  # Response
  output += "+ Response" + " " + res['statusCode'] + newline
  
  # Response headers
  output += indent + "+ Headers" + newline 
  output += newline
  Object.keys(res['headers']).forEach (key) =>
    output += indent + indent + indent + key + ":" + res['headers'][key] + newline
  output += newline

  # Response body
  output += indent + "+ Body" + newline
  output += newline
  res['body'].split('\n').forEach (line) ->
    output += indent + indent + indent + line + newline
  output += newline

  
  output 

module.exports.format = format