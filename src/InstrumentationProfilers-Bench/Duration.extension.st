Extension { #name : 'Duration' }

{ #category : '*InstrumentationProfilers-Bench' }
Duration >> totalMilliseconds [

    ^ seconds * 1000 + (nanos / 1e6)
]
