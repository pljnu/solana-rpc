#!/bin/bash

CONSENSUS="
    --identity /home/sol/validator-keypair.json
    --no-voting
    --expected-genesis-hash 5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d
    --no-poh-speed-test
"

GOSSIP="
    --gossip-port 8001
    --entrypoint entrypoint.mainnet-beta.solana.com:8001
    --entrypoint entrypoint2.mainnet-beta.solana.com:8001
    --entrypoint entrypoint3.mainnet-beta.solana.com:8001
    --entrypoint entrypoint4.mainnet-beta.solana.com:8001
    --entrypoint entrypoint5.mainnet-beta.solana.com:8001
    --no-port-check
"

RPC="
    --rpc-port 8899
    --rpc-bind-address 0.0.0.0
    --dynamic-port-range 8000-8020
    --full-rpc-api
    --private-rpc
    --rpc-send-leader-count 3
    --rpc-pubsub-enable-block-subscription
    --enable-rpc-transaction-history
"

REPLAY="
    --replay-forks-threads 4
"

POH="
    --experimental-poh-pinned-cpu-core 2
"

LEDGER="
    --accounts-db-hash-threads
    --ledger /mnt/ledger
    --accounts /mnt/accounts
    --rocksdb-shred-compaction fifo
    --limit-ledger-size 50000000
    --accounts-db-skip-shrink
    --disable-accounts-disk-index 
    --wal-recovery-mode skip_any_corrupted_record
"

SNAPSHOTS="
    --snapshots /mnt/ledger
    --minimal-snapshot-download-speed 20971520
    --maximum-full-snapshots-to-retain 1
    --maximum-incremental-snapshots-to-retain 1
"

LOG="
    --log /home/sol/agave-validator.log
"

REPORTING="
    --no-os-network-stats-reporting 
    --no-os-memory-stats-reporting
    --no-os-cpu-stats-reporting
"

exec agave-validator $CONSENSUS $GOSSIP $RPC $REPLAY $POH $LEDGER $SNAPSHOTS $LOG $REPORTING
