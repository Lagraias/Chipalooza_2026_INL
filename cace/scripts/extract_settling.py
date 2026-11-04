import math

def _arrays(results, names):
    vectors = [[float(x) for x in results[name]] for name in names]
    n = len(vectors[0])
    if n < 20 or any(len(a) != n for a in vectors):
        raise ValueError("Empty/inconsistent transient waveform")
    if not all(math.isfinite(v) for a in vectors for v in a):
        raise ValueError("Non-finite transient values")
    t = vectors[0]
    if any(t[i + 1] <= t[i] for i in range(n - 1)):
        raise ValueError("Time samples not strictly increasing")
    return vectors

def _scalar(value):
    return [float(value)]

def _mean_range(t, y, a, b):
    points = [v for time, v in zip(t, y) if a <= time <= b]
    if not points:
        raise ValueError(f"No samples in time window {a} .. {b}")
    return sum(points) / len(points)

def _interp_cross(t, y, level, a, b, rising):
    for i in range(1, len(t)):
        if not (a <= t[i - 1] <= b and a <= t[i] <= b):
            continue
        y0, y1 = y[i-1], y[i]
        crossed = (y0 < level <= y1) if rising else (y0 > level >= y1)
        if crossed and y1 != y0:
            return t[i-1] + (level - y0) * (t[i] - t[i-1]) / (y1 - y0)
    raise ValueError(f"No {'rising' if rising else 'falling'} crossing for {level}")

def _settle(t, y, edge, until, target, tol):
    idx = [i for i, ti in enumerate(t) if edge <= ti <= until]
    if not idx:
        raise ValueError("No samples after input transition")
    last_bad = None
    for i in idx:
        if abs(y[i] - target) > tol:
            last_bad = i
    if last_bad is None:
        return 0.0
    if last_bad >= idx[-1]:
        raise ValueError("Output did not settle within observation window")
    return t[last_bad+1] - edge

def postprocess(results: dict, conditions: dict) -> dict:
    t, cmd, vod, vocm, err = _arrays(results, ('time','vcmd','vod','vocm','tracking_error'))
    # Source waveform PULSE(-0.8,0.8,5us,1ns,1ns,20us,100us), simulated for 45us.
    start = _mean_range(t, vod, 2e-6, 4e-6)
    high = _mean_range(t, vod, 21e-6, 24e-6)
    low = _mean_range(t, vod, 41e-6, 44e-6)
    step = abs(high - start)
    if step < 1e-3:
        raise ValueError('Differential output does not respond to step')
    tol = 0.01 * step
    t_up = _settle(t, vod, 5e-6, 24.5e-6, high, tol)
    t_dn = _settle(t, vod, 25e-6, 44.5e-6, low, tol)
    rise_points = [v for ti,v in zip(t, vod) if 5e-6 <= ti <= 24.5e-6]
    fall_points = [v for ti,v in zip(t, vod) if 25e-6 <= ti <= 44.5e-6]
    overshoot_up = max(0.0, (max(rise_points)-high) / step * 100)
    fall_step = abs(high - low)
    overshoot_down = max(0.0, (low-min(fall_points)) / fall_step * 100)
    return {
      'settle_rise_s': _scalar(t_up), 'settle_fall_s': _scalar(t_dn),
      'settle_worst_s': _scalar(max(t_up,t_dn)),
      'overshoot_rise_pct': _scalar(overshoot_up),
      'overshoot_fall_pct': _scalar(overshoot_down),
      'steady_error_rise_v': _scalar(high-0.8),
      'steady_error_fall_v': _scalar(low+0.8),
    }
