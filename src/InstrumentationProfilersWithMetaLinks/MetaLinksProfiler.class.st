"
```st
| testClasses testSuites methods profiler |
testClasses :=  'AI-Algorithms-Graph-Tests' asPackage definedClasses select: [ :e | e isTestCase ].
testSuites := testClasses collect: #suite.

methods := 'AI-Algorithms-Graph' asPackage methods , 'AI-Algorithms-Graph-Components' asPackage methods.
methods := methods asSet.

""profiler := MetaLinksProfiler new.""
profiler := MetaLinksDumbProfiler new. 
""profiler :=  PrfMethodProfiler new
	useRunWithIn;
	yorself""
profiler addMethods: methods.

profiler profile: [ testSuites do: #run ].
profiler
```
"
Class {
	#name : 'MetaLinksProfiler',
	#superclass : 'Object',
	#traits : 'TCallGraph',
	#classTraits : 'TCallGraph classTrait',
	#instVars : [
		'beforeMetaLink',
		'afterMetaLink',
		'methodsToInstrument'
	],
	#category : 'InstrumentationProfilersWithMetaLinks',
	#package : 'InstrumentationProfilersWithMetaLinks'
}

{ #category : 'adding' }
MetaLinksProfiler >> addMethods: methodsCollection [

	methodsToInstrument addAll:
		(methodsCollection collect: [ :method | method unproxifiedMethod ])
]

{ #category : 'initialization' }
MetaLinksProfiler >> initialize [

	super initialize.
	methodsToInstrument := Set new.
	callStack := CallGraphProcessCallStack onProfiler: self.
	nodes := Dictionary new.

	beforeMetaLink := MetaLink new
		metaObject: self;
		selector: #enteringMethod:;
		arguments: #(method);
		control: #before;
		optionCompileOnLinkInstallation: true;
		yourself.
	afterMetaLink := MetaLink new
		metaObject: self;
		selector: #exitingMethod;
		control: #after;
		optionCompileOnLinkInstallation: true;
		yourself.
]

{ #category : 'adding' }
MetaLinksProfiler >> startProfiling [

	methodsToInstrument do: [ :method |
		method ast
			link: beforeMetaLink;
			link: afterMetaLink ]
]

{ #category : 'adding' }
MetaLinksProfiler >> stopProfiling [

	methodsToInstrument do: [ :method |
		method ast
			removeLink: beforeMetaLink;
			removeLink: afterMetaLink.
		beforeMetaLink uninstall.
		afterMetaLink uninstall ]
]
