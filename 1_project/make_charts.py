import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter

# ---- shared style ----
plt.rcParams.update({
    "font.family": "DejaVu Sans",
    "axes.edgecolor": "#dddddd",
    "axes.linewidth": 0.8,
    "figure.dpi": 150,
})
INK = "#1f2933"
SUB = "#52606d"

def k_fmt(x, _):
    return f"${x/1000:.0f}k"

# ================= Chart 1: Top Demanded Skills =================
demand = [
    ("SQL", 29221), ("Python", 28776), ("AWS", 17823), ("Azure", 14143),
    ("Spark", 12799), ("Airflow", 9996), ("Snowflake", 8639),
    ("Databricks", 8183), ("Java", 7267), ("GCP", 6446),
]
labels = [d[0] for d in demand][::-1]
vals = [d[1] for d in demand][::-1]

fig, ax = plt.subplots(figsize=(10, 6))
bars = ax.barh(labels, vals, color="#2b6cb0")
bars[-1].set_color("#e53e3e"); bars[-2].set_color("#e53e3e")  # top 2 highlighted
for y, v in enumerate(vals):
    ax.text(v + 300, y, f"{v:,}", va="center", ha="left", fontsize=10, color=INK)
ax.set_title("Most In-Demand Skills for Remote Data Engineers",
             fontsize=16, fontweight="bold", color=INK, pad=30)
ax.text(0, 1.02, "Number of job postings mentioning each skill (top 10)",
        transform=ax.transAxes, fontsize=11, color=SUB)
ax.set_xlabel("Demand count (job postings)", fontsize=11, color=SUB)
ax.xaxis.set_major_formatter(FuncFormatter(lambda x, _: f"{int(x/1000)}k"))
ax.set_xlim(0, max(vals) * 1.12)
for s in ["top", "right"]:
    ax.spines[s].set_visible(False)
ax.grid(axis="x", color="#eeeeee")
ax.set_axisbelow(True)
plt.tight_layout()
plt.savefig("chart_01_top_demanded_skills.png", bbox_inches="tight")
plt.close()

# ================= Chart 2: Top Paying Skills =================
pay = [
    ("Rust", 210000, 232), ("Golang", 184000, 912), ("Terraform", 184000, 3248),
    ("Spring", 175500, 364), ("Neo4j", 170000, 277), ("GDPR", 169616, 582),
    ("Zoom", 168438, 127), ("GraphQL", 167500, 445), ("Mongo", 162250, 265),
    ("FastAPI", 157500, 204), ("Bitbucket", 155000, 478), ("Django", 155000, 265),
    ("Crystal", 154224, 129), ("Atlassian", 151500, 249), ("C", 151500, 444),
]
labels2 = [p[0] for p in pay][::-1]
sal = [p[1] for p in pay][::-1]
cnt = [p[2] for p in pay][::-1]

fig, ax = plt.subplots(figsize=(10, 7))
cmap = plt.cm.viridis
norm = [ (c - min(cnt)) / (max(cnt) - min(cnt)) for c in cnt ]
colors = [cmap(0.15 + 0.7 * n) for n in norm]
bars = ax.barh(labels2, sal, color=colors)
for y, (v, c) in enumerate(zip(sal, cnt)):
    ax.text(v + 1500, y, f"${v/1000:.0f}k", va="center", ha="left",
            fontsize=9.5, color=INK)
ax.set_title("Highest-Paying Skills for Remote Data Engineers",
             fontsize=16, fontweight="bold", color=INK, pad=30)
ax.text(0, 1.02, "Median annual salary  ·  skills with >100 postings  ·  color = demand count",
        transform=ax.transAxes, fontsize=11, color=SUB)
ax.set_xlabel("Median salary (USD/year)", fontsize=11, color=SUB)
ax.xaxis.set_major_formatter(FuncFormatter(k_fmt))
ax.set_xlim(0, max(sal) * 1.13)
for s in ["top", "right"]:
    ax.spines[s].set_visible(False)
ax.grid(axis="x", color="#eeeeee")
ax.set_axisbelow(True)
sm = plt.cm.ScalarMappable(cmap=cmap, norm=plt.Normalize(min(cnt), max(cnt)))
cb = fig.colorbar(sm, ax=ax, pad=0.02, fraction=0.045)
cb.set_label("Demand count (postings)", fontsize=10, color=SUB)
plt.tight_layout()
plt.savefig("chart_02_top_paying_skills.png", bbox_inches="tight")
plt.close()

# ================= Chart 3: Optimal Skills (demand vs pay, weighted) =================
opt = [
    ("Terraform", 184000, 193, 0.97), ("Python", 135000, 1133, 0.95),
    ("SQL", 130000, 1128, 0.91), ("AWS", 137320, 783, 0.91),
    ("Airflow", 150000, 386, 0.89), ("Spark", 140000, 503, 0.87),
    ("Kafka", 145000, 292, 0.82), ("Snowflake", 135500, 438, 0.82),
    ("Azure", 128000, 475, 0.79), ("Java", 135000, 303, 0.77),
    ("Scala", 137290, 247, 0.76), ("Git", 140000, 208, 0.75),
    ("Kubernetes", 150500, 147, 0.75), ("Databricks", 132750, 266, 0.74),
    ("Redshift", 130000, 274, 0.73), ("GCP", 136000, 196, 0.72),
]

fig, ax = plt.subplots(figsize=(11, 7.5))
xs = [o[2] for o in opt]      # demand
ys = [o[1] for o in opt]      # salary
ws = [o[3] for o in opt]      # weighted score
sizes = [400 + w * 1400 for w in ws]
sc = ax.scatter(xs, ys, s=sizes, c=ws, cmap="plasma",
                alpha=0.85, edgecolors="white", linewidths=1.5, zorder=3)

# reference medians
import statistics as st
mx, my = st.median(xs), st.median(ys)
ax.axvline(mx, color="#cbd2d9", ls="--", lw=1, zorder=1)
ax.axhline(my, color="#cbd2d9", ls="--", lw=1, zorder=1)
ax.text(mx*1.02, min(ys)-1500, "higher demand →", color=SUB, fontsize=9)

for name, s, d, w in opt:
    dy = 2200 if name not in ("Java",) else -3500
    ax.annotate(name, (d, s), textcoords="offset points", xytext=(0, 11),
                ha="center", fontsize=9, color=INK, fontweight="bold")

ax.set_title("Most Optimal Skills for Remote Data Engineers",
             fontsize=16, fontweight="bold", color=INK, pad=30)
ax.text(0, 1.02,
        "Balancing demand and pay  ·  bubble size & color = weighted score  ·  dashed lines = medians",
        transform=ax.transAxes, fontsize=11, color=SUB)
ax.set_xlabel("Demand count (job postings)", fontsize=11, color=SUB)
ax.set_ylabel("Median salary (USD/year)", fontsize=11, color=SUB)
ax.yaxis.set_major_formatter(FuncFormatter(k_fmt))
ax.set_xlim(min(xs)*0.6, max(xs)*1.12)
ax.set_ylim(min(ys)-6000, max(ys)+10000)
for s in ["top", "right"]:
    ax.spines[s].set_visible(False)
ax.grid(color="#f0f0f0", zorder=0)
ax.set_axisbelow(True)
cb = fig.colorbar(sc, ax=ax, pad=0.02, fraction=0.045)
cb.set_label("Weighted score (demand × pay)", fontsize=10, color=SUB)
plt.tight_layout()
plt.savefig("chart_03_optimal_skills.png", bbox_inches="tight")
plt.close()

print("done")
