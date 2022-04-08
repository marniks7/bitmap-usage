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
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request2 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request3 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request4 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request5 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request6 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request7 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request8 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request9 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request10 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request11 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request12 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request13 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request14 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request15 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request16 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request17 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request18 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request19 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c28d3369-91cb-4e8a-8fc2-e0f8bab9ec96\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request20 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request21 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request22 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request23 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request24 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request25 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request26 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request27 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request28 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request29 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request30 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request31 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request32 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request33 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request34 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request35 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request36 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request37 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request38 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request39 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request40 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request41 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request42 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request43 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request44 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request45 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request46 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request47 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request48 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request49 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request50 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request51 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request52 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request53 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request54 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request55 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request56 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request57 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request58 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request59 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request60 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request61 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request62 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request63 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c28d3369-91cb-4e8a-8fc2-e0f8bab9ec96\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request64 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request65 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request66 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request67 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request68 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request69 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request70 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request71 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request72 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request73 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request74 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request75 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request76 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request77 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request78 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request79 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request80 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request81 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request82 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request83 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request84 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request85 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request86 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request87 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request88 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request89 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request90 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request91 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request92 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request93 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request94 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request95 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request96 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request97 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request98 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request99 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request100 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request101 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request102 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request103 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request104 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request105 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request106 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request107 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request108 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request109 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request110 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request111 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request112 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request113 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request114 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request115 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request116 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request117 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request118 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request119 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request120 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request121 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request122 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request123 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request124 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request125 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request126 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request127 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request128 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request129 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request130 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request131 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request132 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request133 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request134 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request135 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request136 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request137 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request138 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request139 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request140 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request141 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request142 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request143 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request144 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request145 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request146 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request147 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request148 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request149 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request150 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request151 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request152 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request153 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request154 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request155 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request156 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request157 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request158 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request159 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request160 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request161 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request162 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request163 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request164 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request165 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request166 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request167 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request168 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request169 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request170 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request171 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request172 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request173 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request174 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request175 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request176 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request177 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request178 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request179 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request180 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request181 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request182 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request183 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request184 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request185 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request186 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request187 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request188 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request189 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request190 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request191 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request192 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request193 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request194 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request195 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request196 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request197 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request198 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request199 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request200 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request201 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request202 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request203 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request204 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request205 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request206 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request207 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request208 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request209 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request210 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request211 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request212 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request213 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request214 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request215 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request216 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request217 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request218 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request219 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request220 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request221 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request222 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request223 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request224 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request225 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request226 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request227 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request228 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request229 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request230 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request231 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request232 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request233 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request234 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request235 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request236 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request237 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request238 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request239 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request240 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request241 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request242 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request243 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request244 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request245 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request246 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request247 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request248 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request249 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request250 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request251 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request252 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request253 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request254 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request255 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request256 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request257 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request258 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request259 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request260 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request261 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request262 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request263 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request264 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request265 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request266 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request267 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request268 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request269 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request270 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request271 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request272 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request273 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request274 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request275 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request276 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request277 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request278 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request279 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request280 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request281 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request282 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request283 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request284 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request285 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request286 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request287 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request288 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request289 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request290 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request291 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request292 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request293 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request294 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request295 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request296 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request297 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request298 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request299 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request300 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request301 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request302 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request303 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request304 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request305 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request306 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request307 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request308 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request309 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request310 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request311 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request312 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request313 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request314 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request315 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request316 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request317 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request318 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request319 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request320 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request321 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request322 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request323 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request324 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request325 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request326 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request327 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request328 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request329 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request330 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request331 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request332 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request333 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request334 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request335 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request336 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request337 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request338 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request339 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request340 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request341 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request342 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request343 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request344 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request345 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request346 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request347 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request348 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request349 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request350 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request351 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request352 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request353 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request354 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request355 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request356 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request357 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request358 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request359 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request360 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request361 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request362 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request363 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request364 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request365 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request366 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c28d3369-91cb-4e8a-8fc2-e0f8bab9ec96\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request367 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request368 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request369 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request370 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request371 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request372 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request373 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request374 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request375 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request376 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request377 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request378 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request379 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request380 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request381 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request382 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request383 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request384 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request385 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request386 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request387 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request388 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request389 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request390 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request391 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request392 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request393 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request394 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request395 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request396 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request397 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request398 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request399 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request400 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request401 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request402 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request403 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request404 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request405 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request406 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request407 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request408 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request409 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request410 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request411 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request412 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request413 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request414 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request415 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request416 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request417 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request418 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request419 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request420 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request421 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request422 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request423 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request424 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request425 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request426 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request427 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request428 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request429 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request430 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request431 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request432 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request433 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request434 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request435 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request436 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request437 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request438 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request439 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request440 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request441 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request442 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request443 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request444 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request445 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request446 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request447 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request448 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request449 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request450 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request451 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request452 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request453 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request454 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request455 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request456 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request457 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request458 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request459 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c28d3369-91cb-4e8a-8fc2-e0f8bab9ec96\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request460 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request461 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request462 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request463 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request464 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request465 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request466 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request467 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request468 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request469 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request470 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request471 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request472 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request473 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request474 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request475 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request476 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request477 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request478 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request479 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request480 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request481 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request482 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request483 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request484 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request485 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request486 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request487 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request488 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request489 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request490 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request491 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request492 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request493 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request494 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request495 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request496 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request497 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request498 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request499 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request500 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request501 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request502 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request503 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request504 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request505 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request506 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request507 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request508 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request509 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request510 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request511 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request512 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request513 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request514 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request515 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request516 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request517 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request518 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request519 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request520 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request521 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request522 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request523 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request524 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request525 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request526 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request527 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request528 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request529 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request530 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request531 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request532 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request533 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request534 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request535 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request536 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request537 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request538 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request539 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request540 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request541 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request542 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request543 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request544 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request545 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request546 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request547 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request548 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request549 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request550 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request551 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request552 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request553 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request554 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request555 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request556 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request557 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request558 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request559 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request560 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request561 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request562 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request563 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request564 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request565 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request566 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request567 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request568 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request569 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request570 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request571 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request572 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request573 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request574 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request575 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request576 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request577 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request578 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request579 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request580 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request581 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request582 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request583 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request584 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request585 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request586 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request587 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request588 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request589 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request590 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request591 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request592 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request593 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request594 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request595 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request596 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request597 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request598 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request599 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request600 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request601 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request602 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request603 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request604 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request605 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request606 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request607 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request608 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request609 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request610 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request611 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request612 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request613 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request614 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request615 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request616 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request617 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request618 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request619 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request620 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request621 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request622 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request623 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request624 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request625 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request626 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request627 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request628 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request629 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request630 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request631 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request632 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request633 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request634 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request635 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request636 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request637 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request638 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request639 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request640 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request641 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request642 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request643 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request644 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request645 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request646 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request647 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request648 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request649 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request650 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request651 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request652 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request653 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request654 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request655 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request656 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request657 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request658 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request659 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request660 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request661 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request662 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request663 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request664 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request665 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request666 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request667 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request668 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request669 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request670 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request671 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request672 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request673 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request674 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request675 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request676 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request677 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request678 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request679 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request680 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request681 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request682 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request683 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request684 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request685 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request686 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request687 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request688 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request689 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request690 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request691 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request692 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request693 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request694 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request695 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request696 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request697 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request698 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request699 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request700 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request701 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request702 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request703 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request704 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request705 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request706 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request707 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request708 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request709 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request710 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request711 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request712 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request713 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request714 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request715 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request716 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request717 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request718 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request719 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request720 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request721 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request722 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request723 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request724 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request725 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request726 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request727 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request728 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request729 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request730 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request731 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request732 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request733 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request734 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c28d3369-91cb-4e8a-8fc2-e0f8bab9ec96\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request735 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request736 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request737 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request738 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request739 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request740 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request741 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request742 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request743 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request744 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request745 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request746 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request747 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request748 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request749 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request750 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request751 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request752 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request753 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request754 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request755 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request756 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request757 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request758 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request759 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request760 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request761 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request762 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request763 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request764 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request765 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request766 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request767 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request768 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request769 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request770 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request771 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request772 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request773 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request774 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request775 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request776 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request777 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request778 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request779 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request780 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request781 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request782 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request783 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request784 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request785 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request786 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request787 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request788 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request789 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request790 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request791 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request792 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request793 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request794 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request795 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request796 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request797 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request798 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request799 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request800 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request801 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request802 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request803 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request804 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request805 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request806 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request807 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request808 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request809 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request810 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request811 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request812 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request813 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request814 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request815 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request816 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request817 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request818 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request819 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request820 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request821 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request822 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request823 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request824 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request825 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request826 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request827 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request828 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request829 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request830 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request831 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request832 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request833 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request834 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request835 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request836 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request837 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request838 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request839 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request840 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request841 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request842 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request843 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request844 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request845 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request846 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request847 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request848 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request849 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request850 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request851 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request852 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request853 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request854 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request855 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request856 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request857 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request858 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request859 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request860 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request861 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request862 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request863 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request864 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request865 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request866 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request867 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request868 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request869 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request870 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request871 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request872 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request873 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request874 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request875 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request876 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request877 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request878 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request879 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request880 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request881 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request882 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request883 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request884 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request885 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request886 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request887 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request888 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request889 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request890 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request891 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request892 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request893 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request894 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request895 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request896 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request897 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request898 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request899 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request900 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request901 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request902 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request903 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request904 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request905 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request906 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request907 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request908 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5d4b8249-0415-467e-b34c-9e9b0f52ddf2\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request909 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request910 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request911 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request912 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request913 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request914 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request915 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request916 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request917 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request918 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request919 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request920 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request921 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request922 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request923 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request924 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request925 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request926 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request927 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request928 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request929 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request930 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request931 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request932 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request933 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request934 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request935 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request936 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request937 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request938 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request939 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request940 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request941 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request942 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request943 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request944 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request945 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request946 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request947 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request948 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request949 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request950 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request951 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request952 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request953 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request954 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request955 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request956 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request957 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request958 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request959 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request960 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request961 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request962 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request963 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request964 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request965 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request966 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request967 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request968 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c28d3369-91cb-4e8a-8fc2-e0f8bab9ec96\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request969 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request970 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request971 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request972 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request973 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request974 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request975 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request976 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request977 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request978 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request979 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request980 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request981 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request982 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request983 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request984 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request985 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Gbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request986 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request987 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request988 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request989 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request990 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request991 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request992 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request993 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request994 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request995 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request996 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request997 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request998 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request999 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
request1000 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/bitmap/prices", headers, body)
end
requests = {}
requests[1] = request1
requests[2] = request2
requests[3] = request3
requests[4] = request4
requests[5] = request5
requests[6] = request6
requests[7] = request7
requests[8] = request8
requests[9] = request9
requests[10] = request10
requests[11] = request11
requests[12] = request12
requests[13] = request13
requests[14] = request14
requests[15] = request15
requests[16] = request16
requests[17] = request17
requests[18] = request18
requests[19] = request19
requests[20] = request20
requests[21] = request21
requests[22] = request22
requests[23] = request23
requests[24] = request24
requests[25] = request25
requests[26] = request26
requests[27] = request27
requests[28] = request28
requests[29] = request29
requests[30] = request30
requests[31] = request31
requests[32] = request32
requests[33] = request33
requests[34] = request34
requests[35] = request35
requests[36] = request36
requests[37] = request37
requests[38] = request38
requests[39] = request39
requests[40] = request40
requests[41] = request41
requests[42] = request42
requests[43] = request43
requests[44] = request44
requests[45] = request45
requests[46] = request46
requests[47] = request47
requests[48] = request48
requests[49] = request49
requests[50] = request50
requests[51] = request51
requests[52] = request52
requests[53] = request53
requests[54] = request54
requests[55] = request55
requests[56] = request56
requests[57] = request57
requests[58] = request58
requests[59] = request59
requests[60] = request60
requests[61] = request61
requests[62] = request62
requests[63] = request63
requests[64] = request64
requests[65] = request65
requests[66] = request66
requests[67] = request67
requests[68] = request68
requests[69] = request69
requests[70] = request70
requests[71] = request71
requests[72] = request72
requests[73] = request73
requests[74] = request74
requests[75] = request75
requests[76] = request76
requests[77] = request77
requests[78] = request78
requests[79] = request79
requests[80] = request80
requests[81] = request81
requests[82] = request82
requests[83] = request83
requests[84] = request84
requests[85] = request85
requests[86] = request86
requests[87] = request87
requests[88] = request88
requests[89] = request89
requests[90] = request90
requests[91] = request91
requests[92] = request92
requests[93] = request93
requests[94] = request94
requests[95] = request95
requests[96] = request96
requests[97] = request97
requests[98] = request98
requests[99] = request99
requests[100] = request100
requests[101] = request101
requests[102] = request102
requests[103] = request103
requests[104] = request104
requests[105] = request105
requests[106] = request106
requests[107] = request107
requests[108] = request108
requests[109] = request109
requests[110] = request110
requests[111] = request111
requests[112] = request112
requests[113] = request113
requests[114] = request114
requests[115] = request115
requests[116] = request116
requests[117] = request117
requests[118] = request118
requests[119] = request119
requests[120] = request120
requests[121] = request121
requests[122] = request122
requests[123] = request123
requests[124] = request124
requests[125] = request125
requests[126] = request126
requests[127] = request127
requests[128] = request128
requests[129] = request129
requests[130] = request130
requests[131] = request131
requests[132] = request132
requests[133] = request133
requests[134] = request134
requests[135] = request135
requests[136] = request136
requests[137] = request137
requests[138] = request138
requests[139] = request139
requests[140] = request140
requests[141] = request141
requests[142] = request142
requests[143] = request143
requests[144] = request144
requests[145] = request145
requests[146] = request146
requests[147] = request147
requests[148] = request148
requests[149] = request149
requests[150] = request150
requests[151] = request151
requests[152] = request152
requests[153] = request153
requests[154] = request154
requests[155] = request155
requests[156] = request156
requests[157] = request157
requests[158] = request158
requests[159] = request159
requests[160] = request160
requests[161] = request161
requests[162] = request162
requests[163] = request163
requests[164] = request164
requests[165] = request165
requests[166] = request166
requests[167] = request167
requests[168] = request168
requests[169] = request169
requests[170] = request170
requests[171] = request171
requests[172] = request172
requests[173] = request173
requests[174] = request174
requests[175] = request175
requests[176] = request176
requests[177] = request177
requests[178] = request178
requests[179] = request179
requests[180] = request180
requests[181] = request181
requests[182] = request182
requests[183] = request183
requests[184] = request184
requests[185] = request185
requests[186] = request186
requests[187] = request187
requests[188] = request188
requests[189] = request189
requests[190] = request190
requests[191] = request191
requests[192] = request192
requests[193] = request193
requests[194] = request194
requests[195] = request195
requests[196] = request196
requests[197] = request197
requests[198] = request198
requests[199] = request199
requests[200] = request200
requests[201] = request201
requests[202] = request202
requests[203] = request203
requests[204] = request204
requests[205] = request205
requests[206] = request206
requests[207] = request207
requests[208] = request208
requests[209] = request209
requests[210] = request210
requests[211] = request211
requests[212] = request212
requests[213] = request213
requests[214] = request214
requests[215] = request215
requests[216] = request216
requests[217] = request217
requests[218] = request218
requests[219] = request219
requests[220] = request220
requests[221] = request221
requests[222] = request222
requests[223] = request223
requests[224] = request224
requests[225] = request225
requests[226] = request226
requests[227] = request227
requests[228] = request228
requests[229] = request229
requests[230] = request230
requests[231] = request231
requests[232] = request232
requests[233] = request233
requests[234] = request234
requests[235] = request235
requests[236] = request236
requests[237] = request237
requests[238] = request238
requests[239] = request239
requests[240] = request240
requests[241] = request241
requests[242] = request242
requests[243] = request243
requests[244] = request244
requests[245] = request245
requests[246] = request246
requests[247] = request247
requests[248] = request248
requests[249] = request249
requests[250] = request250
requests[251] = request251
requests[252] = request252
requests[253] = request253
requests[254] = request254
requests[255] = request255
requests[256] = request256
requests[257] = request257
requests[258] = request258
requests[259] = request259
requests[260] = request260
requests[261] = request261
requests[262] = request262
requests[263] = request263
requests[264] = request264
requests[265] = request265
requests[266] = request266
requests[267] = request267
requests[268] = request268
requests[269] = request269
requests[270] = request270
requests[271] = request271
requests[272] = request272
requests[273] = request273
requests[274] = request274
requests[275] = request275
requests[276] = request276
requests[277] = request277
requests[278] = request278
requests[279] = request279
requests[280] = request280
requests[281] = request281
requests[282] = request282
requests[283] = request283
requests[284] = request284
requests[285] = request285
requests[286] = request286
requests[287] = request287
requests[288] = request288
requests[289] = request289
requests[290] = request290
requests[291] = request291
requests[292] = request292
requests[293] = request293
requests[294] = request294
requests[295] = request295
requests[296] = request296
requests[297] = request297
requests[298] = request298
requests[299] = request299
requests[300] = request300
requests[301] = request301
requests[302] = request302
requests[303] = request303
requests[304] = request304
requests[305] = request305
requests[306] = request306
requests[307] = request307
requests[308] = request308
requests[309] = request309
requests[310] = request310
requests[311] = request311
requests[312] = request312
requests[313] = request313
requests[314] = request314
requests[315] = request315
requests[316] = request316
requests[317] = request317
requests[318] = request318
requests[319] = request319
requests[320] = request320
requests[321] = request321
requests[322] = request322
requests[323] = request323
requests[324] = request324
requests[325] = request325
requests[326] = request326
requests[327] = request327
requests[328] = request328
requests[329] = request329
requests[330] = request330
requests[331] = request331
requests[332] = request332
requests[333] = request333
requests[334] = request334
requests[335] = request335
requests[336] = request336
requests[337] = request337
requests[338] = request338
requests[339] = request339
requests[340] = request340
requests[341] = request341
requests[342] = request342
requests[343] = request343
requests[344] = request344
requests[345] = request345
requests[346] = request346
requests[347] = request347
requests[348] = request348
requests[349] = request349
requests[350] = request350
requests[351] = request351
requests[352] = request352
requests[353] = request353
requests[354] = request354
requests[355] = request355
requests[356] = request356
requests[357] = request357
requests[358] = request358
requests[359] = request359
requests[360] = request360
requests[361] = request361
requests[362] = request362
requests[363] = request363
requests[364] = request364
requests[365] = request365
requests[366] = request366
requests[367] = request367
requests[368] = request368
requests[369] = request369
requests[370] = request370
requests[371] = request371
requests[372] = request372
requests[373] = request373
requests[374] = request374
requests[375] = request375
requests[376] = request376
requests[377] = request377
requests[378] = request378
requests[379] = request379
requests[380] = request380
requests[381] = request381
requests[382] = request382
requests[383] = request383
requests[384] = request384
requests[385] = request385
requests[386] = request386
requests[387] = request387
requests[388] = request388
requests[389] = request389
requests[390] = request390
requests[391] = request391
requests[392] = request392
requests[393] = request393
requests[394] = request394
requests[395] = request395
requests[396] = request396
requests[397] = request397
requests[398] = request398
requests[399] = request399
requests[400] = request400
requests[401] = request401
requests[402] = request402
requests[403] = request403
requests[404] = request404
requests[405] = request405
requests[406] = request406
requests[407] = request407
requests[408] = request408
requests[409] = request409
requests[410] = request410
requests[411] = request411
requests[412] = request412
requests[413] = request413
requests[414] = request414
requests[415] = request415
requests[416] = request416
requests[417] = request417
requests[418] = request418
requests[419] = request419
requests[420] = request420
requests[421] = request421
requests[422] = request422
requests[423] = request423
requests[424] = request424
requests[425] = request425
requests[426] = request426
requests[427] = request427
requests[428] = request428
requests[429] = request429
requests[430] = request430
requests[431] = request431
requests[432] = request432
requests[433] = request433
requests[434] = request434
requests[435] = request435
requests[436] = request436
requests[437] = request437
requests[438] = request438
requests[439] = request439
requests[440] = request440
requests[441] = request441
requests[442] = request442
requests[443] = request443
requests[444] = request444
requests[445] = request445
requests[446] = request446
requests[447] = request447
requests[448] = request448
requests[449] = request449
requests[450] = request450
requests[451] = request451
requests[452] = request452
requests[453] = request453
requests[454] = request454
requests[455] = request455
requests[456] = request456
requests[457] = request457
requests[458] = request458
requests[459] = request459
requests[460] = request460
requests[461] = request461
requests[462] = request462
requests[463] = request463
requests[464] = request464
requests[465] = request465
requests[466] = request466
requests[467] = request467
requests[468] = request468
requests[469] = request469
requests[470] = request470
requests[471] = request471
requests[472] = request472
requests[473] = request473
requests[474] = request474
requests[475] = request475
requests[476] = request476
requests[477] = request477
requests[478] = request478
requests[479] = request479
requests[480] = request480
requests[481] = request481
requests[482] = request482
requests[483] = request483
requests[484] = request484
requests[485] = request485
requests[486] = request486
requests[487] = request487
requests[488] = request488
requests[489] = request489
requests[490] = request490
requests[491] = request491
requests[492] = request492
requests[493] = request493
requests[494] = request494
requests[495] = request495
requests[496] = request496
requests[497] = request497
requests[498] = request498
requests[499] = request499
requests[500] = request500
requests[501] = request501
requests[502] = request502
requests[503] = request503
requests[504] = request504
requests[505] = request505
requests[506] = request506
requests[507] = request507
requests[508] = request508
requests[509] = request509
requests[510] = request510
requests[511] = request511
requests[512] = request512
requests[513] = request513
requests[514] = request514
requests[515] = request515
requests[516] = request516
requests[517] = request517
requests[518] = request518
requests[519] = request519
requests[520] = request520
requests[521] = request521
requests[522] = request522
requests[523] = request523
requests[524] = request524
requests[525] = request525
requests[526] = request526
requests[527] = request527
requests[528] = request528
requests[529] = request529
requests[530] = request530
requests[531] = request531
requests[532] = request532
requests[533] = request533
requests[534] = request534
requests[535] = request535
requests[536] = request536
requests[537] = request537
requests[538] = request538
requests[539] = request539
requests[540] = request540
requests[541] = request541
requests[542] = request542
requests[543] = request543
requests[544] = request544
requests[545] = request545
requests[546] = request546
requests[547] = request547
requests[548] = request548
requests[549] = request549
requests[550] = request550
requests[551] = request551
requests[552] = request552
requests[553] = request553
requests[554] = request554
requests[555] = request555
requests[556] = request556
requests[557] = request557
requests[558] = request558
requests[559] = request559
requests[560] = request560
requests[561] = request561
requests[562] = request562
requests[563] = request563
requests[564] = request564
requests[565] = request565
requests[566] = request566
requests[567] = request567
requests[568] = request568
requests[569] = request569
requests[570] = request570
requests[571] = request571
requests[572] = request572
requests[573] = request573
requests[574] = request574
requests[575] = request575
requests[576] = request576
requests[577] = request577
requests[578] = request578
requests[579] = request579
requests[580] = request580
requests[581] = request581
requests[582] = request582
requests[583] = request583
requests[584] = request584
requests[585] = request585
requests[586] = request586
requests[587] = request587
requests[588] = request588
requests[589] = request589
requests[590] = request590
requests[591] = request591
requests[592] = request592
requests[593] = request593
requests[594] = request594
requests[595] = request595
requests[596] = request596
requests[597] = request597
requests[598] = request598
requests[599] = request599
requests[600] = request600
requests[601] = request601
requests[602] = request602
requests[603] = request603
requests[604] = request604
requests[605] = request605
requests[606] = request606
requests[607] = request607
requests[608] = request608
requests[609] = request609
requests[610] = request610
requests[611] = request611
requests[612] = request612
requests[613] = request613
requests[614] = request614
requests[615] = request615
requests[616] = request616
requests[617] = request617
requests[618] = request618
requests[619] = request619
requests[620] = request620
requests[621] = request621
requests[622] = request622
requests[623] = request623
requests[624] = request624
requests[625] = request625
requests[626] = request626
requests[627] = request627
requests[628] = request628
requests[629] = request629
requests[630] = request630
requests[631] = request631
requests[632] = request632
requests[633] = request633
requests[634] = request634
requests[635] = request635
requests[636] = request636
requests[637] = request637
requests[638] = request638
requests[639] = request639
requests[640] = request640
requests[641] = request641
requests[642] = request642
requests[643] = request643
requests[644] = request644
requests[645] = request645
requests[646] = request646
requests[647] = request647
requests[648] = request648
requests[649] = request649
requests[650] = request650
requests[651] = request651
requests[652] = request652
requests[653] = request653
requests[654] = request654
requests[655] = request655
requests[656] = request656
requests[657] = request657
requests[658] = request658
requests[659] = request659
requests[660] = request660
requests[661] = request661
requests[662] = request662
requests[663] = request663
requests[664] = request664
requests[665] = request665
requests[666] = request666
requests[667] = request667
requests[668] = request668
requests[669] = request669
requests[670] = request670
requests[671] = request671
requests[672] = request672
requests[673] = request673
requests[674] = request674
requests[675] = request675
requests[676] = request676
requests[677] = request677
requests[678] = request678
requests[679] = request679
requests[680] = request680
requests[681] = request681
requests[682] = request682
requests[683] = request683
requests[684] = request684
requests[685] = request685
requests[686] = request686
requests[687] = request687
requests[688] = request688
requests[689] = request689
requests[690] = request690
requests[691] = request691
requests[692] = request692
requests[693] = request693
requests[694] = request694
requests[695] = request695
requests[696] = request696
requests[697] = request697
requests[698] = request698
requests[699] = request699
requests[700] = request700
requests[701] = request701
requests[702] = request702
requests[703] = request703
requests[704] = request704
requests[705] = request705
requests[706] = request706
requests[707] = request707
requests[708] = request708
requests[709] = request709
requests[710] = request710
requests[711] = request711
requests[712] = request712
requests[713] = request713
requests[714] = request714
requests[715] = request715
requests[716] = request716
requests[717] = request717
requests[718] = request718
requests[719] = request719
requests[720] = request720
requests[721] = request721
requests[722] = request722
requests[723] = request723
requests[724] = request724
requests[725] = request725
requests[726] = request726
requests[727] = request727
requests[728] = request728
requests[729] = request729
requests[730] = request730
requests[731] = request731
requests[732] = request732
requests[733] = request733
requests[734] = request734
requests[735] = request735
requests[736] = request736
requests[737] = request737
requests[738] = request738
requests[739] = request739
requests[740] = request740
requests[741] = request741
requests[742] = request742
requests[743] = request743
requests[744] = request744
requests[745] = request745
requests[746] = request746
requests[747] = request747
requests[748] = request748
requests[749] = request749
requests[750] = request750
requests[751] = request751
requests[752] = request752
requests[753] = request753
requests[754] = request754
requests[755] = request755
requests[756] = request756
requests[757] = request757
requests[758] = request758
requests[759] = request759
requests[760] = request760
requests[761] = request761
requests[762] = request762
requests[763] = request763
requests[764] = request764
requests[765] = request765
requests[766] = request766
requests[767] = request767
requests[768] = request768
requests[769] = request769
requests[770] = request770
requests[771] = request771
requests[772] = request772
requests[773] = request773
requests[774] = request774
requests[775] = request775
requests[776] = request776
requests[777] = request777
requests[778] = request778
requests[779] = request779
requests[780] = request780
requests[781] = request781
requests[782] = request782
requests[783] = request783
requests[784] = request784
requests[785] = request785
requests[786] = request786
requests[787] = request787
requests[788] = request788
requests[789] = request789
requests[790] = request790
requests[791] = request791
requests[792] = request792
requests[793] = request793
requests[794] = request794
requests[795] = request795
requests[796] = request796
requests[797] = request797
requests[798] = request798
requests[799] = request799
requests[800] = request800
requests[801] = request801
requests[802] = request802
requests[803] = request803
requests[804] = request804
requests[805] = request805
requests[806] = request806
requests[807] = request807
requests[808] = request808
requests[809] = request809
requests[810] = request810
requests[811] = request811
requests[812] = request812
requests[813] = request813
requests[814] = request814
requests[815] = request815
requests[816] = request816
requests[817] = request817
requests[818] = request818
requests[819] = request819
requests[820] = request820
requests[821] = request821
requests[822] = request822
requests[823] = request823
requests[824] = request824
requests[825] = request825
requests[826] = request826
requests[827] = request827
requests[828] = request828
requests[829] = request829
requests[830] = request830
requests[831] = request831
requests[832] = request832
requests[833] = request833
requests[834] = request834
requests[835] = request835
requests[836] = request836
requests[837] = request837
requests[838] = request838
requests[839] = request839
requests[840] = request840
requests[841] = request841
requests[842] = request842
requests[843] = request843
requests[844] = request844
requests[845] = request845
requests[846] = request846
requests[847] = request847
requests[848] = request848
requests[849] = request849
requests[850] = request850
requests[851] = request851
requests[852] = request852
requests[853] = request853
requests[854] = request854
requests[855] = request855
requests[856] = request856
requests[857] = request857
requests[858] = request858
requests[859] = request859
requests[860] = request860
requests[861] = request861
requests[862] = request862
requests[863] = request863
requests[864] = request864
requests[865] = request865
requests[866] = request866
requests[867] = request867
requests[868] = request868
requests[869] = request869
requests[870] = request870
requests[871] = request871
requests[872] = request872
requests[873] = request873
requests[874] = request874
requests[875] = request875
requests[876] = request876
requests[877] = request877
requests[878] = request878
requests[879] = request879
requests[880] = request880
requests[881] = request881
requests[882] = request882
requests[883] = request883
requests[884] = request884
requests[885] = request885
requests[886] = request886
requests[887] = request887
requests[888] = request888
requests[889] = request889
requests[890] = request890
requests[891] = request891
requests[892] = request892
requests[893] = request893
requests[894] = request894
requests[895] = request895
requests[896] = request896
requests[897] = request897
requests[898] = request898
requests[899] = request899
requests[900] = request900
requests[901] = request901
requests[902] = request902
requests[903] = request903
requests[904] = request904
requests[905] = request905
requests[906] = request906
requests[907] = request907
requests[908] = request908
requests[909] = request909
requests[910] = request910
requests[911] = request911
requests[912] = request912
requests[913] = request913
requests[914] = request914
requests[915] = request915
requests[916] = request916
requests[917] = request917
requests[918] = request918
requests[919] = request919
requests[920] = request920
requests[921] = request921
requests[922] = request922
requests[923] = request923
requests[924] = request924
requests[925] = request925
requests[926] = request926
requests[927] = request927
requests[928] = request928
requests[929] = request929
requests[930] = request930
requests[931] = request931
requests[932] = request932
requests[933] = request933
requests[934] = request934
requests[935] = request935
requests[936] = request936
requests[937] = request937
requests[938] = request938
requests[939] = request939
requests[940] = request940
requests[941] = request941
requests[942] = request942
requests[943] = request943
requests[944] = request944
requests[945] = request945
requests[946] = request946
requests[947] = request947
requests[948] = request948
requests[949] = request949
requests[950] = request950
requests[951] = request951
requests[952] = request952
requests[953] = request953
requests[954] = request954
requests[955] = request955
requests[956] = request956
requests[957] = request957
requests[958] = request958
requests[959] = request959
requests[960] = request960
requests[961] = request961
requests[962] = request962
requests[963] = request963
requests[964] = request964
requests[965] = request965
requests[966] = request966
requests[967] = request967
requests[968] = request968
requests[969] = request969
requests[970] = request970
requests[971] = request971
requests[972] = request972
requests[973] = request973
requests[974] = request974
requests[975] = request975
requests[976] = request976
requests[977] = request977
requests[978] = request978
requests[979] = request979
requests[980] = request980
requests[981] = request981
requests[982] = request982
requests[983] = request983
requests[984] = request984
requests[985] = request985
requests[986] = request986
requests[987] = request987
requests[988] = request988
requests[989] = request989
requests[990] = request990
requests[991] = request991
requests[992] = request992
requests[993] = request993
requests[994] = request994
requests[995] = request995
requests[996] = request996
requests[997] = request997
requests[998] = request998
requests[999] = request999
requests[1000] = request1000
request = function()
	return requests[math.random(1, 1000)]()
end
