Class {
	#name : 'BaselineOfInstrumentationProfilers',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfInstrumentationProfilers',
	#package : 'BaselineOfInstrumentationProfilers'
}

{ #category : 'baselines' }
BaselineOfInstrumentationProfilers >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			package: 'InstrumentationProfilers';
			package: 'InstrumentationProfilers-Bench' with: [ spec requires: #('InstrumentationProfilers') ];
			package: 'InstrumentationProfilers-Tests' with: [ spec requires: #( 'InstrumentationProfilers' ) ].

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
			group: 'core' with: #( 'InstrumentationProfilers' 'InstrumentationProfilers-Bench' );
			group: 'tests' with: #( 'InstrumentationProfilers-Tests' ) ]
]
