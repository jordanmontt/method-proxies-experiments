Extension { #name : 'MethodCounterInstrumentator' }

{ #category : '*InstrumentationProfilers' }
MethodCounterInstrumentator >> installNoSafe [

    methodProxies valuesDo: [ :mp | mp installNoSafe ]
]
