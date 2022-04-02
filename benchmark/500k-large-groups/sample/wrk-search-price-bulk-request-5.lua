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
wrk.body   = "[{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}],\"id\":0},{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}],\"id\":1},{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}],\"id\":2},{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}],\"id\":3},{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}],\"id\":4}]"