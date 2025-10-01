Extension { #name : 'CompiledMethod' }

{ #category : '*MpPerfEx-InstrumentationProfilers' }
CompiledMethod >> nameForProfiler [

	^ (self methodClass name , '>>#' , self selector) surroundedBySingleQuotes
]
