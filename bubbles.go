package main

import "github.com/scgolang/sc"

func bubbles(params sc.Params) sc.Ugen {
	var (
		saw2 = sc.LFSaw{
			Freq:   sc.Multi(sc.C(8), sc.C(7.23)),
			Iphase: sc.C(0),
		}.Rate(sc.AR).MulAdd(sc.C(3), sc.C(80))

		saw1 = sc.LFSaw{
			Freq:   sc.C(0.4),
			Iphase: sc.C(0),
		}.Rate(sc.AR).MulAdd(sc.C(24), saw2).Midicps()

		sin = sc.SinOsc{
			Freq:  saw1,
			Phase: sc.C(0),
		}.Rate(sc.AR).Mul(sc.C(0.04))
	)
	return sc.Out{
		Bus: sc.C(0),
		Channels: sc.Comb{
			Interpolation: sc.InterpolationCubic,
			In:            sin,
			MaxDelayTime:  sc.C(0.2),
			DelayTime:     sc.C(0.2),
			DecayTime:     sc.C(4),
		}.Rate(sc.AR),
	}.Rate(sc.AR)
}
