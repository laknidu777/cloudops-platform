
const http = require("node:http");

const {
  register,
  httpRequestsTotal,
  httpRequestDuration
} = require("./monitoring/metrics");

const server = http.createServer((req, res) => {
  // Prometheus metrics endpoint
  if (req.url === "/metrics" && req.method === "GET") {
    (async () => {
      try {
        const metrics = await register.metrics();

        res.writeHead(200, {
          "Content-Type": register.contentType
        });

        res.end(metrics);
      } catch (error) {
        console.error("Failed to generate metrics:", error);

        res.writeHead(500, {
          "Content-Type": "application/json"
        });

        res.end(JSON.stringify({
          error: "Failed to generate metrics"
        }));
      }
    })();

    return;
  }

  // Start measuring request duration
  const startTime = process.hrtime.bigint();

  // Determine a bounded route label
  const route =
    req.method === "GET" && req.url === "/health"
      ? "/health"
      : req.method === "GET" && req.url === "/version"
        ? "/version"
        : "not_found";

  // Record metrics after the response finishes
  res.on("finish", () => {
    const duration =
      Number(process.hrtime.bigint() - startTime) / 1e9;

    const labels = {
      method: req.method,
      route,
      status_code: String(res.statusCode)
    };

    httpRequestsTotal.inc(labels);
    httpRequestDuration.observe(labels, duration);
  });

  // Health endpoint
  if (req.url === "/health" && req.method === "GET") {
    res.writeHead(200, {
      "Content-Type": "application/json"
    });

    res.end(JSON.stringify({
      status: "healthy",
      service: "cloudops-platform"
    }));

    return;
  }

  // Version endpoint
  if (req.url === "/version" && req.method === "GET") {
    res.writeHead(200, {
      "Content-Type": "application/json"
    });

    res.end(JSON.stringify({
      service: "cloudops-platform",
      version: "1.1.0"
    }));

    return;
  }

  // Not found
  res.writeHead(404, {
    "Content-Type": "application/json"
  });

  res.end(JSON.stringify({
    error: "Not found"
  }));
});

// Start the server only when this file is run directly.
if (require.main === module) {
  const PORT = process.env.PORT || 3000;

  server.listen(PORT, "0.0.0.0", () => {
    console.log(`CloudOps API listening on port ${PORT}`);
  });
}

module.exports = server;

