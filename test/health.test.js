
const test = require("node:test");
const assert = require("node:assert/strict");
const server = require("../app");

test("GET /health returns a healthy response", async () => {
  await new Promise((resolve) => {
    server.listen(0, "127.0.0.1", resolve);
  });

  try {
    const address = server.address();
    const response = await fetch(
      `http://127.0.0.1:${address.port}/health`
    );

    assert.equal(response.status, 200);
    assert.deepEqual(await response.json(), {
      status: "healthy",
      service: "cloudops-platform"
    });
  } finally {
    await new Promise((resolve, reject) => {
      server.close((error) => {
        if (error) reject(error);
        else resolve();
      });
    });
  }
});

test("Unknown routes return 404", async () => {
  // This test runs after the first test closes the server.
  await new Promise((resolve) => {
    server.listen(0, "127.0.0.1", resolve);
  });

  try {
    const address = server.address();
    const response = await fetch(
      `http://127.0.0.1:${address.port}/unknown`
    );

    assert.equal(response.status, 404);
    assert.deepEqual(await response.json(), {
      error: "Not found"
    });
  } finally {
    await new Promise((resolve, reject) => {
      server.close((error) => {
        if (error) reject(error);
        else resolve();
      });
    });
  }
});
