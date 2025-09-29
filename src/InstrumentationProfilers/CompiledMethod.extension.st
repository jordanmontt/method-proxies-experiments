Extension { #name : 'CompiledMethod' }

{ #category : '*InstrumentationProfilers' }
CompiledMethod >> nameForProfiler [

	^ (self methodClass name , '>>#' , self selector) surroundedBySingleQuotes
]
