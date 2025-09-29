Class {
	#name : 'IllNoSafeInstrumentator',
	#superclass : 'IllInstrumentator',
	#category : 'InstrumentationProfilers-NoSafe',
	#package : 'InstrumentationProfilers',
	#tag : 'NoSafe'
}

{ #category : 'instrumentation' }
IllNoSafeInstrumentator >> install [

    self proxyVariables do: #installNoSafe
]
