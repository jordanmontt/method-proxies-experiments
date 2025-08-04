Class {
	#name : 'BaselineOfMethodProxiesValidationPaper',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMethodProxiesValidationPaper',
	#package : 'BaselineOfMethodProxiesValidationPaper'
}

{ #category : 'baselines' }
BaselineOfMethodProxiesValidationPaper >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		"Packages"
		spec package: 'MethodProxies-Validation-Paper'.

		"External dependencies"
		spec baseline: 'IllimaniProfiler' with: [ spec repository: 'github://jordanmontt/illimani-memory-profiler:dev' ].
		spec baseline: 'MethodCallGraph' with: [ spec repository: 'github://jordanmontt/MethodCallGraph:main' ].

		"Linking external dependencies"
		spec package: 'IllimaniProfiler' with: [ spec requires: #('NeoJSON' 'NeoCSV' 'MethodProxies') ].

		"Groups"
		spec group: 'default' with: #( 'core' 'tests' ).
		spec group: 'core' with: #( 'IllimaniProfiler' 'IllimaniUI' ).
		spec group: 'tests' with: #( 'IllimaniProfiler-Tests' ) ]
]
