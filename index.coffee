module.exports = => (request, response, next) =>
  response.sendError = (error) =>
    throw new Error('[express-send-error] sendError called without an error') unless error?
    console.error error.stack
    code = 500
    code = error.code if _.isNumber error.code
    return response.sendStatus code unless error.message?
    return response.status(code).send error.message
  next()
