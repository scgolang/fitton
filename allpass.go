package main

import "github.com/scgolang/sc"

func allpass(params sc.Params) sc.Ugen {
	dry := sc.SinOsc{}.Rate(sc.AR).Mul(sc.C(0.5))

	mod := sc.XLine{
		Start: sc.C(1),
		End:   sc.C(22050),
		Dur:   sc.C(3),
		Done:  sc.FreeEnclosing,
	}.Rate(sc.AR)

	wet := sc.BAllPass{
		In:   dry,
		Freq: mod,
	}.Rate(sc.AR)

	return sc.Out{
		Bus:      sc.C(0),
		Channels: wet.Add(dry.Mul(sc.C(-1))),
	}.Rate(sc.AR)
}
