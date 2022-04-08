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
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request2 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request3 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request4 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"bb23aeba-dd18-4a83-92e7-fc60cc74051f\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request5 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request6 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request7 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"125Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request8 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request9 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request10 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request11 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request12 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request13 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request14 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request15 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request16 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request17 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request18 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request19 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c28d3369-91cb-4e8a-8fc2-e0f8bab9ec96\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"5Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request20 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request21 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request22 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request23 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request24 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request25 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request26 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request27 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request28 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request29 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request30 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request31 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request32 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request33 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request34 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request35 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"072d595b-4256-402e-b717-3a8df1b2dfe6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request36 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"800Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request37 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request38 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"eecff436-e525-48d4-806b-cd42a8f40bce\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request39 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"900Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request40 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request41 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"aa7949f7-57ee-4496-af08-be9ed55ac486\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request42 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request43 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request44 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request45 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request46 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"200Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request47 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request48 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request49 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request50 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request51 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f335c67e-42d7-419e-8e34-8787f6ede049\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request52 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"17fd7812-2c80-494f-8983-430a2800bdf3\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"150Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request53 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request54 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"b56d4089-2b29-4453-a2e3-5df95f4f093b\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request55 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request56 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request57 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request58 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request59 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request60 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"e27b07ee-3a2c-41e9-86e1-932c804b6c07\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request61 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request62 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request63 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c28d3369-91cb-4e8a-8fc2-e0f8bab9ec96\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request64 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"400Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request65 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request66 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request67 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"650Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request68 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"1Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request69 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"85dc39cd-52dc-49fa-9d00-051a1ff15cd6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"50Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request70 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"7473d2d3-2b4e-47de-a054-94b3ce6293b7\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request71 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request72 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"136c984f-2465-4608-9d6f-abc44e317c28\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request73 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request74 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request75 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"c6e9a5dc-821c-4899-b069-7191fa781498\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request76 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group4\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"550Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request77 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"970a4374-e158-4758-b9cd-817980ff67b0\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"30Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request78 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"450Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request79 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"20Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request80 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"3a83444a-2fbb-4e31-9c1c-a6e60be13a84\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"850Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request81 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"25Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request82 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"600Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request83 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request84 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a38e432c-3965-4c74-8251-aa640002d2b2\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"950Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request85 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a9a226ae-69ae-4bae-bfe0-448529f0b9f3\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"250Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request86 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"699c4b09-dab0-429b-a27b-b8b898744620\",\"groupId\":\"group3\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"5GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request87 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request88 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"f5c56b5a-49de-4d50-bb66-12b685f562c6\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"48\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"175Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request89 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"100GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request90 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group1\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"1GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request91 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"8f8030ed-6864-45bb-be8f-d291825a5db8\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"350Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request92 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4f9fb39-e56b-403b-a892-07bf9a73540b\",\"groupId\":\"group4\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"36\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"170954ea-687d-42d2-9c04-7807845c66ee\"},{\"char\":\"B2B Bandwidth\",\"value\":\"700Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request93 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group2\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"50GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"100Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request94 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"61e9c254-f164-472f-bd9f-1b0bdc91b6b9\",\"groupId\":\"group5\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"18\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request95 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"a4e12f41-3e99-4165-aba4-c242d583504b\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request96 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"afab959f-7366-4859-a152-7a46fd53c0df\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"750Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request97 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group1\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"300Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request98 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"5995c13b-82f5-4daf-aa4b-a77a735243e7\",\"groupId\":\"group2\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"24\"},{\"char\":\"B2B Traffic\",\"value\":\"20GB\"},{\"char\":\"VPN\",\"value\":\"a2fe7f64-405b-44be-93e2-04b803373582\"},{\"char\":\"B2B Bandwidth\",\"value\":\"75Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request99 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"2ebaa34c-6d81-43de-8047-ca16b1711b90\",\"groupId\":\"group5\",\"priceSpecId\":\"NRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"60\"},{\"char\":\"B2B Traffic\",\"value\":\"2GB\"},{\"char\":\"VPN\",\"value\":\"ad796998-f1c7-4fcc-9a6b-1b33042fb375\"},{\"char\":\"B2B Bandwidth\",\"value\":\"500Mbps\"},{\"char\":\"Router\",\"value\":\"Not Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
end
request100 = function()
  headers = {}
  headers["Content-Type"] = "application/json"
  body = "{\"offeringId\":\"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e\",\"groupId\":\"group3\",\"priceSpecId\":\"MRC\",\"charValues\":[{\"char\":\"Term\",\"value\":\"12\"},{\"char\":\"B2B Traffic\",\"value\":\"10GB\"},{\"char\":\"VPN\",\"value\":\"5739614e-6c52-402c-ba3a-534c51b3201a\"},{\"char\":\"B2B Bandwidth\",\"value\":\"10Mbps\"},{\"char\":\"Router\",\"value\":\"Included\"}]}"
	return wrk.format("POST", "/v1/search/map/prices", headers, body)
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
request = function()
	return requests[math.random(1, 100)]()
end
