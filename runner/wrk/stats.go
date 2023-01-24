package wrk

type Stats struct {
	Latency  *Latency `json:"latency"`
	Duration int      `json:"duration,omitempty"`
	Bytes    int      `json:"bytes,omitempty"`
	Errors   *Error   `json:"errors"`
	Requests int      `json:"requests,omitempty"`
}

type Latency struct {
	Min         int            `json:"min,omitempty"`
	Max         int            `json:"max,omitempty"`
	Stdev       float64        `json:"stdev,omitempty"`
	Mean        float64        `json:"mean,omitempty"`
	Percentiles map[string]int `json:"percentiles,omitempty"`
}
type Error struct {
	Timeout int `json:"timeout,omitempty"`
	Connect int `json:"connect,omitempty"`
	Read    int `json:"read,omitempty"`
	Status  int `json:"status,omitempty"`
	Write   int `json:"write,omitempty"`
}

// Diff %, times, magnitude
type Diff struct {
	Latency  *Latency `json:"latency"`
	Duration int      `json:"duration,omitempty"`
	Bytes    int      `json:"bytes,omitempty"`
	Errors   *Error   `json:"errors"`
	Requests int      `json:"requests,omitempty"`
}

type DiffStr struct {
	wrk1 Stats
	wrk2 Stats
	diff Diff
}
