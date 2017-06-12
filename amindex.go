package main

import (
	"math"

	"github.com/scgolang/sc"
)

func ami(params sc.Params) sc.Ugen {
	var (
		modFreq = params.Add("modFreq", 200)
		carFreq = params.Add("carFreq", 500)
		index   = params.Add("index", 1)
		dur     = params.Add("dur", 1)
		amp     = params.Add("amp", 1)
		mi      = sc.Line{Start: sc.C(0), End: index, Dur: dur}.Rate(sc.AR)
		unmod   = sc.SinOsc{Freq: carFreq}.Rate(sc.AR).Mul(mi.MulAdd(sc.C(-1), sc.C(1)))
		hmi     = mi.Mul(sc.C(0.5))
		mod     = sc.SinOsc{Freq: modFreq, Phase: sc.C((3 * math.Pi) / 2)}.Rate(sc.AR).MulAdd(hmi, hmi)
		car     = sc.SinOsc{Freq: carFreq}.Rate(sc.AR).Mul(mod)
		hdur    = dur.Mul(sc.C(0.5))
	)
	env := sc.EnvGen{
		Env: sc.EnvLinen{
			Attack:  hdur,
			Sustain: dur.Mul(sc.C(0.9)),
			Release: hdur,
			Level:   amp,
			Curve:   "sine",
		},
		Done: sc.FreeEnclosing,
	}.Rate(sc.KR)

	return sc.OffsetOut{
		Bus:      sc.C(0),
		Channels: car.Add(unmod).Mul(env),
	}.Rate(sc.AR)
}

func rmi(params sc.Params) sc.Ugen {
	var (
		modFreq = params.Add("modFreq", 200)
		carFreq = params.Add("carFreq", 500)
		index   = params.Add("index", 1)
		dur     = params.Add("dur", 1)
		amp     = params.Add("amp", 1)
		mi      = sc.Line{Start: sc.C(0), End: index, Dur: dur}.Rate(sc.AR)
		unmod   = sc.SinOsc{Freq: carFreq}.Rate(sc.AR).Mul(mi.MulAdd(sc.C(-1), sc.C(1)))
		mod     = sc.SinOsc{Freq: modFreq}.Rate(sc.AR).Mul(mi)
		car     = sc.SinOsc{Freq: carFreq}.Rate(sc.AR).Mul(mod)
		hdur    = dur.Mul(sc.C(0.5))
	)
	env := sc.EnvGen{
		Env: sc.EnvLinen{
			Attack:  hdur,
			Sustain: dur.Mul(sc.C(0.9)),
			Release: hdur,
			Level:   amp,
			Curve:   "sine",
		},
		Done: sc.FreeEnclosing,
	}.Rate(sc.KR)

	return sc.OffsetOut{
		Bus:      sc.C(0),
		Channels: car.Add(unmod).Mul(env),
	}.Rate(sc.AR)
}
