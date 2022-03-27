json = require "json"

function setup(thread)
  thread0 = thread0 or thread
end

function init(args)
  file = args[1] or "/dev/null"
end

function done(summary, latency, requests)
  file = io.open(thread0:get("file"), "w")

  percentiles = {}

  for _, p in pairs({ 50, 90, 95, 97, 98, 99, 99.999 }) do
    k = string.format("%g%%", p)
    v = latency:percentile(p)
    percentiles[k] = v
  end

  file:write(json.encode({
    duration = summary.duration,
    requests = summary.requests,
    bytes    = summary.bytes,
    errors   = summary.errors,
    latency  = {
      min         = latency.min,
      max         = latency.max,
      mean        = latency.mean,
      stdev       = latency.stdev,
      percentiles = percentiles,
    },
  }))
  file:close()
end

request1 = function()
  headers = {}
  --method = "POST"
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"00d3a020-08c4-4c94-be0a-e29794756f9e\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
  return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end

request2 = function()
  headers = {}
  --method = "POST"
  headers["Content-Type"] = "application/json"
  body = "{"offeringId":\"00d3a020-08c4-4c94-be0a-e29794756f9e\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
  return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end

requests = {}
requests[1] = request1
requests[2] = request2


request = function()
  return requests[math.random(1, 2)]()
end