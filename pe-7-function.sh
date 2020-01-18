#!/usr/bin/env bash

primes=(2 3 5 7)

tryprime() {
    local try=$1
    i=0
    while true ; do
        p=${primes[i]}
        if [[ $((try % p)) -eq 0 ]] ; then
            break
        fi
        if [[ $((p * p)) -gt $try ]] ; then
            primes+=($try)
            break
        fi
        i=$((i+1))
    done
}

next=9
while [[ ${#primes[@]} -lt 10001 ]] ; do
    tryprime $next
    next=$((next+2))
done

echo ${primes[-1]}
