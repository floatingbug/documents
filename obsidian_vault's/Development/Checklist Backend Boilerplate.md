
# Production-Ready Checklist (for this boilerplate)

This checklist is intended to be a concise, actionable "production readiness" checklist you can follow to finish the boilerplate. Use it as a PDF handout or README appendix.

## 1. Security & Hardening
- [x] Use Helmet with a secure config and keep it up-to-date.
- [x] Enable CORS with a strict origin whitelist (do not use `*` in production).
- [ ] Set `app.set('trust proxy', 1)` when behind a reverse proxy and configure rate-limit for real client IPs.
- [x] Use `express-rate-limit` with a Redis store for distributed rate-limiting on auth endpoints.
- [ ] Enforce strong secrets stored in env / secret manager (rotate regularly).
- [ ] Use HTTPS in front of the Node process (terminate TLS at proxy/load‑balancer).
- [ ] Avoid verbose error messages leaking stack traces; log them instead.

## 2. Authentication & Authorization
- [x] Use short-lived Access tokens (e.g. 15m–1h) and Refresh tokens with server-side storage for revocation.
- [x] Use `bcrypt` with salt rounds >= 12 (configurable via env).
- [ ] Implement refresh token rotation (issue new refresh token on use and invalidate old one).
- [ ] Implement a token blacklist / revocation store (Redis or DB) for logout and breach handling.
- [x] Rate-limit login & signup endpoints strongly.
- [ ] Add account lockout / exponential backoff after repeated failed logins.
- [ ] Add optional 2FA for sensitive operations (TOTP, WebAuthn support later).

## 3. Input Validation & Sanitization
- [x] Use a robust validation library (you use `validator`) and centralize rules.
- [ ] Sanitize inputs to prevent NoSQL injection (cast IDs, whitelist fields) and XSS in stored data.
- [ ] Validate env variables at startup (Zod/Joi) and fail fast if critical values are missing.

## 4. Logging & Observability
- [x] Replace `console.*` with structured logger (pino/winston). Include request IDs.
- [ ] Add request logging (morgan -> pino) and error logging with stack traces.
- [ ] Add metrics (Prometheus) for request latencies, error rates, DB pool usage.
- [ ] Add application traces (OpenTelemetry) for distributed tracing if microservices.

## 5. Reliability & Ops
- [ ] Add graceful shutdown (SIGTERM) closing DB connections and draining requests.
- [ ] Configure healthcheck endpoints (`/health/live`, `/health/ready`).
- [ ] Use connection pooling for Mongo and re-use client across modules.
- [ ] Add retry/backoff for temporary DB/network failures where appropriate.

## 6. Testing
- [ ] Unit tests for services and utils (Jest). 80%+ coverage for critical modules (auth, tokens).
- [ ] Integration tests for routes (Supertest) using an ephemeral DB (Mongo in-memory or test container).
- [ ] E2E tests for signup/login/refresh/logout flows.
- [ ] CI pipeline running tests and linting on PRs.

## 7. Deployment & Infrastructure
- [ ] Provide a Dockerfile (multi-stage) and docker-compose for local testing.
- [ ] Use CI/CD to build, test, and deploy images (GitHub Actions / GitLab CI).
- [ ] Externalize configuration and secrets to a secret manager (AWS Secrets Manager / Vault).
- [ ] Add automated DB backups and retention policy.

## 8. Performance
- [ ] Add caching (Redis) for hot data and rate-limit counters.
- [ ] Use pagination and projection for large queries to avoid reading full documents.
- [ ] Add connection limits and load-test (k6) before production.

## 9. Maintenance
- [ ] Add clear README with setup, env variables, and endpoints.
- [ ] Document token lifetimes, rotation policy, and breach procedures.
- [ ] Keep dependencies up-to-date and monitor security advisories.

---

