#!/usr/bin/env bash

primes=(2 3 5 7)

next=9
while [[ ${#primes[@]} -lt 10001 ]] ; do
    i=0
    while true ; do
        p=${primes[i]}
        if [[ $((next % p)) -eq 0 ]] ; then
            break
        fi
        if [[ $((p * p)) -gt $next ]] ; then
            primes+=($next)
            break
        fi
        i=$((i+1))
    done
    next=$((next+2))
done

echo ${primes[-1]}
