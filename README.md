# Seatcheck

A prop-firm seat planner. Enter what your strategy actually does, and it runs those
numbers through eleven prop-firm rulebooks as the firms stated them in writing to
their own support desks, not as their pricing pages describe them.

Every rule on the page came from a support ticket. Each row opens a sheet showing the
date, the agent, and the firm's red flags, including the ones the firm would rather
not advertise.

## What it measures

Each simulated path draws one closed return and one intraday low per trading day.
All eleven firms see the same random days, so the gap between two rows is the
rulebook alone and nothing else.

- Daily limits test against the intraday low when the firm measures floating equity,
  and against the close when it measures closed balance.
- Static floors sit at the starting balance. Trailing floors follow the equity high.
  Locked floors follow it until they reach breakeven and stop.
- Evaluations pass on target and minimum days, then the funded stage pays on the
  firm's own stated first-payout rule and cycle.
- Consistency rules are shown but not scored.

The zero-edge column reruns every seat with the mean return set to zero. A seat that
still pays out with no edge at all is charging you for luck.

## Independence

Seatcheck is paid nothing by the firms it ranks and carries no affiliate links. If
that changes, the band at the top of the page will say so, name every firm that pays,
and the ranking will still come from the model rather than the commission.

## Running it

There is no build step. Open `index.html`, or serve the folder:

    npx serve .

## Adding a firm

Every seat is one object in the `FIRMS` array near the top of the `<script>` block in
`index.html`. Adding a firm is one more object and no other change. Keep `ver.date`
and `ver.src` truthful, because that is the only reason anyone trusts the page.

## What it is not

A guarantee of anything. Rules are a snapshot from support replies on the dates shown.
Firms change them, apply unpublished ones, and go out of business. Fees are editable
in the table because list prices move weekly.
