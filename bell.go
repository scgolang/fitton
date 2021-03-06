package main

import "github.com/scgolang/sc"

func bell(params sc.Params) sc.Ugen {
	var (
		dur  = params.Add("dur", 1)
		fund = params.Add("fund", 440)
		data = normalizeSum([][4]float32{
			{0.58, 0, 1, 1},
			{0.58, 1, 0.67, 0.9},
			{0.91, 0, 1, 0.65},
			{0.91, 1.7, 1.8, 0.55},
			{1.6, 0, 1.67, 0.35},
			{1.2, 0, 2.67, 0.325},
			{2, 0, 1.46, 0.25},
			{2.7, 0, 1.33, 0.2},
			{3, 0, 1.33, 0.15},
			{3.75, 0, 1, 0.1},
			{4.09, 0, 1.33, 0.07},
		}, 2)

		sig = sc.Mix(sc.AR, tonesFrom(data, dur, fund)).Mul(sc.EnvGen{
			Env: sc.EnvPerc{
				Release: dur.Add(sc.C(-0.01)),
			},
			Done: sc.FreeEnclosing,
		}.Rate(sc.KR))
	)
	return sc.Out{
		Bus:      sc.C(0),
		Channels: sc.Multi(sig, sig),
	}.Rate(sc.AR)
}

// tonesFrom creates harmonics from the provided data.
func tonesFrom(data [][4]float32, dur, fund sc.Input) []sc.Input {
	tones := make([]sc.Input, len(data))

	for i, row := range data {
		var (
			freq   = sc.C(row[0])
			offset = sc.C(row[1])
			amp    = sc.C(row[2])
			durr   = sc.C(row[3])

			ampenv = sc.EnvGen{
				Env: sc.EnvPerc{
					Release: dur.Mul(durr).Add(sc.C(-0.01)),
				},
			}.Rate(sc.KR)
		)
		tones[i] = sc.SinOsc{
			Freq: fund.Mul(freq).Add(offset),
		}.Rate(sc.AR).Mul(amp.Mul(ampenv))
	}
	return tones
}

// normalizeSum normalizes the specified column of data ala http://doc.sccode.org/Classes/Array.html#-normalizeSum
func normalizeSum(fs [][4]float32, i int) [][4]float32 {
	var sum float32
	for j := range fs {
		sum += fs[j][i]
	}
	for j := range fs {
		fs[j][i] /= sum
	}
	return fs
}
