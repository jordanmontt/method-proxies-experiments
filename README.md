# MethodProxies Performance & Safety Experiments

This repository contains the full implementation of the experimental methodology used in the MethodProxies paper.  
It includes all code and artifacts needed to reproduce the performance, meta-safety, and JIT-integration experiments.

A **benchmark** = running one profiler on one application using one instrumentation technique.

We run:

- 16 benchmarks using MethodProxies  
- 16 using the `run:with:in:` (object-as-method) technique  
- 16 using MethodProxies **without** meta-safety checks  

**48 total benchmarks**

---

# 🔹 TL;DR

- Install with **one Metacello script**  
- Four applications × four profilers × three instrumentation modes  
- Run benchmarks using `BencherMp` (MethodProxies) or `BencherRwi` (run:with:in:)  
- This repo contains everything to **fully reproduce all paper results**

---

# Quick Installation

In a Pharo 14 image:

```st
EpMonitor disableDuring: [
	Metacello new
		baseline: 'InstrumentationProfilers';
		repository: 'github://jordanmontt/method-proxies-experiments:main';
		load ].
```

## Dependencies

This Repository brings several dependencies

- [IllimaniProfiler](https://github.com/jordanmontt/illimani-memory-profiler) — memory profiling framework
- [MethodProxies](https://github.com/pharo-contributions/MethodProxies/) — main instrumentation system under study
- [MethodCallGraph](https://github.com/jordanmontt/MethodCallGraph/) — includes the method invocation profiler
- [VeritasBenchSuite](https://github.com/jordanmontt/PharoVeritasBenchSuite) — benchmark applications
- [MessageGatekeeper](https://github.com/jordanmontt/MessageGatekeeper) — alternative instrumentation using `run:with:in:`

## Profilers 

This repository provides four profilers:

- Allocation Rate — counts allocations + total size
- No-Action Allocation — instrumentation cost for allocation profilers
- Method Invocation Counter — counts method executions
- No-Action Methods — instrumentation cost for method profilers

## Applications

We use four real-world applications from Veritas:

- **[DataFrame](https://github.com/PolyMathOrg/DataFrame)**  
Execution: load a synthetic 20k×6 numeric dataset (2.3 MB)  
617 methods

- **[Microdown](https://github.com/pillar-markup/Microdown)**  
Execution: parse & generate the full *Spec* book (~252 pages)  
~2,062 methods

- **[Cormas](https://github.com/cormas/cormas)**  
Execution: run the ECEC agent-based simulation  
~2,135 methods

- **[Moose](https://github.com/moosetechnology/Moose)**  
Execution: load the [SBSCL](https://github.com/draeger-lab/SBSCL) Java project into Moose  
~11,009 methods


## Executing the benchmarks

Two objects execute benchmarks:

- `BencherMp` for MethodProxies
- `BenchRwi` for `run:with:in:` (object-as-method / MessageGatekeeper)

Those are objects in charge of executing the benchamark with the three different instrumentation techniques. They understand the same API.

Order matters:

1. Select benchmark
2. Select profiler
3. Execute

### Example: Microdown + MethodProxies + allocation rate profiler

```st
bencher := BencherMp new
	useMicrodownBench;
	useAllocationRateProfiler;
	yourself.

bencher benchExecuteProfiler.
bencher
```

### Example: Cormas benchmark + MethodProxies + method counter profiler

```st
bencher := BencherMp new
	useCormasBench;
	useMethodCounterProfiler;
	yourself.

bencher benchExecuteProfiler.
bencher
```

## Available benchmarks

- Cormas (`useCormasBench`)
- DataFrame (`useDataFrameBench`)
- Microdown (`useMicrodownBench`)
- Moose (`useMooseBench`)

## Available analysis tools (profilers)

- Allocation rate profiler (`useAllocationRateProfiler`)
- Method counter (`useMethodCounterProfiler`)
- No-action allocation (`useNoActionAllocatorMethodsProfiler`)
- No-action method(`useNoActionAllMethodsProfiler`)

## Available instrumentation techniques

- MethodProxies (`BencherMp`)
- `#run:with:in:` hook (`BencherRwi`)

## Available measurements methods

- `benchExecuteProfiler` -- instrument + execute + uninstrument
- `benchExecution` -- execution only
- `benchInstrument` -- instrument only
- `benchUninstrument` -- uninstrument only

