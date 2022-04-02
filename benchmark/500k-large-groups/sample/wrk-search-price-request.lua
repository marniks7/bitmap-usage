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
wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.body   = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"