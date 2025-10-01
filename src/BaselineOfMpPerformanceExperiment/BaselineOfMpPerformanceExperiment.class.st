Class {
	#name : 'BaselineOfMpPerformanceExperiment',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMpPerformanceExperiment',
	#package : 'BaselineOfMpPerformanceExperiment'
}

{ #category : 'baselines' }
BaselineOfMpPerformanceExperiment >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			package: 'MpPerfEx-InstrumentationProfilers';
			package: 'MpPerfEx-Bencher' with: [ spec requires: #('MpPerfEx-InstrumentationProfilers') ];
			package: 'MpPerfEx-Tests' with: [ spec requires: #( 'MpPerfEx-InstrumentationProfilers' ) ].

		spec baseline: 'MethodProxies' with: [ spec repository: 'github://pharo-contributions/MethodProxies/src' ].
		spec baseline: 'MethodCallGraph' with: [ spec repository: 'github://jordanmontt/MethodCallGraph:main' ].
		spec baseline: 'IllimaniProfiler' with: [ spec repository: 'github://jordanmontt/illimani-memory-profiler:dev' ].
		spec baseline: 'VeritasBenchSuite' with: [ spec repository: 'github://jordanmontt/PharoVeritasBenchSuite:main' ].
		spec baseline: 'MessageGatekeeper' with: [ spec repository: 'github://jordanmontt/MessageGatekeeper:main' ].
		spec
			package: 'InstrumentationProfilers' with: [ 
				spec requires: #( 'IllimaniProfiler' 'MethodProxies' 'MethodCallGraph' 'VeritasBenchSuite' 'MessageGatekeeper') ].

		spec
			group: 'default' with: #( 'core' 'tests' );
			group: 'core' with: #( 'MpPerfEx-InstrumentationProfilers' 'MpPerfEx-Bench' );
			group: 'tests' with: #( 'MpPerfEx-Tests' ) ]
]
