require 'redis'

REDIS = Redis.new(host: "127.0.0.1", password: "itda", reconnect_attempts: 2, timeout: 2)
