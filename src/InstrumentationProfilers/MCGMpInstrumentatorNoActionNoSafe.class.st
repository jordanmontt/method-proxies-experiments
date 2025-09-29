Class {
	#name : 'MCGMpInstrumentatorNoActionNoSafe',
	#superclass : 'MCGMpInstrumentatorNoAction',
	#category : 'InstrumentationProfilers-NoSafe',
	#package : 'InstrumentationProfilers',
	#tag : 'NoSafe'
}

{ #category : 'profiling' }
MCGMpInstrumentatorNoActionNoSafe >> install [

    methodProxies valuesDo: [ :mp | mp installNoSafe ]
]
