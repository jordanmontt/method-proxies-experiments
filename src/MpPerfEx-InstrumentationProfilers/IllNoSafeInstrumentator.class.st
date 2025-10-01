Class {
	#name : 'IllNoSafeInstrumentator',
	#superclass : 'IllInstrumentator',
	#category : 'MpPerfEx-InstrumentationProfilers-NoSafe',
	#package : 'MpPerfEx-InstrumentationProfilers',
	#tag : 'NoSafe'
}

{ #category : 'instrumentation' }
IllNoSafeInstrumentator >> install [

    self proxyVariables do: #installNoSafe
]
