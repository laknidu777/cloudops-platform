
const client = require("@prometheus-io/client");

// Create a dedicated Prometheus registry.
const register = new client.Registry();

// Collect default Node.js process metrics.
client.collectDefaultMetrics({
  register
});

// Count HTTP requests.
const httpRequestsTotal = new client.Counter({
  name: "http_requests_total",
  help: "Total number of HTTP requests",
  labelNames: ["method", "route", "status_code"],
  registers: [register]
});

// Measure HTTP request duration.
const httpRequestDuration = new client.Histogram({
  name: "http_request_duration_seconds",
  help: "Duration of HTTP requests in seconds",
  labelNames: ["method", "route", "status_code"],
  buckets: [0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1, 2, 5],
  registers: [register]
});

module.exports = {
  register,
  httpRequestsTotal,
  httpRequestDuration
};
