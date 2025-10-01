Class {
	#name : 'MCGMpInstrumentatorNoActionNoSafe',
	#superclass : 'MCGMpInstrumentatorNoAction',
	#category : 'MpPerfEx-InstrumentationProfilers-NoSafe',
	#package : 'MpPerfEx-InstrumentationProfilers',
	#tag : 'NoSafe'
}

{ #category : 'profiling' }
MCGMpInstrumentatorNoActionNoSafe >> install [

    methodProxies valuesDo: [ :mp | mp installNoSafe ]
]
