#!/usr/bin/env bash

# let's calculate running time inside the program
time_start=$(date +%s)

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
            echo $try
            break
        fi
        i=$((i+1))
    done
}

next=9
while [[ ${#primes[@]} -lt 10001 ]] ; do
    found=$(tryprime $next)
    primes+=($found)
    next=$((next+2))
done

echo ${primes[-1]}

time_end=$(date +%s)

echo "Time taken" $((time_end - time_start)) "seconds"
