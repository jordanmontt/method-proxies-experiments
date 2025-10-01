# MethodProxies Performance and Safety Experiments


Instrumentation profilers built with different instrumentation techniques for Pharo

This repository contains the code for executing the experiments for the journal paper of MethodProxies. The experiments are designed to evaluate MethodProxies's performance and safety.

To install it, run the following script in a Pharo 14 image:

```st
EpMonitor disableDuring: [
	Metacello new
		baseline: 'InstrumentationProfilers';
		repository: 'github://jordanmontt/method-proxies-experiments:main';
		load ].
```

```bash
nohup bash runRebenchFiles.sh > log.log 2>&1 &

|repo| repo := IceRepository registry detect: [ :each | each name = 'method-proxies-experiments' ]. [ repo pull ] on: IceExperimentalFeature do: [ :ex | ex resume ]. repo loadedPackages do: [ :pkg | [ pkg reload ] on: MCMergeOrLoadWarning do: [ :ex | ex load]. ]. Smalltalk snapshot: true andQuit: true
```


## Executing the benchmarks

There are three objects
- `BencherMp` for MethodProxies
- `BenchRwi` for run:with:in
- `BenchSourceCode` for the source code modification.

Those are objects in charge of executing the benchamark with the three different instrumentation techniques. They understand the same API.

For example, if you want to execute the Microdown benchmark using the source code modification technique with the method coverage profiler, you will need to run:

```st
bencher := BencherSourceCode new
	useMicrodownBench;
	useMethodCoverageProfiler;
	yourself.

bencher benchExecuteProfiler.
bencher
```

The order of the messages is important. First, initialize the benchmark, then the profiler.

If you want to run the AST bench using the MethodProxies technique with the call graph profiler, you will need to do:

```st
bencher := BencherMp new
	useASTBench;
	useCallGraphProfiler;
	yourself.

bencher benchExecuteProfiler.
bencher
```

Below you will find an extensive list with all the benchmarks, analysis tools, and instrumentation techniques and how to use them.

## Available benchmarks

- AST (`useASTBench`)
- Fily system (`useCompressionBench`)
- Microdown (`useFileSystemBench`)
- Compression (`useMicrodownBench`)

## Available analysis tools (profilers)

- Method coverage (`useMethodCoverageProfiler`)
- Call graph (`useCallGraphProfiler`)
- No-action (`useNoActionProfiler`)

## Available instrumentation techniques

- MethodProxies (`BencherMp`)
- `#run:with:in:` method hook (`BencherRwi`)
- Source code modification (`BencherSourceCode`)

## Available measurements methods

- `benchExecuteProfiler` It returns the time that it takes to instrument, execute, and uninstrument. The three things together.
- `benchExecution` It returns the time that it takes to execute the bench with the instrumentation. It does not take into account the time for instumenting nor uninstrumenting.
- `benchInstrument` It returns the time that it takes to only instrument the method.
- `benchUninstrument` It returns the time that it takes to only uninstrument the method.
