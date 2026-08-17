# -*- coding: utf-8 -*-
"""
build/build_pdf.py —— 组装中英文论文 HTML（随后由浏览器打印为 PDF）
用法：py build/build_pdf.py
输出：paper_cn.html / paper_en.html（repo 根目录，供浏览器打印）
"""
import sys
from pathlib import Path

import markdown

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

ROOT = Path(__file__).parent.parent
BUILD = ROOT / "build"
BUILD.mkdir(exist_ok=True)

MD = markdown.Markdown(extensions=["tables", "fenced_code", "sane_lists", "toc"])

CSS = """
@page { size: A4; margin: 22mm 18mm; }
body { font-family: "Microsoft YaHei", "SimSun", sans-serif; font-size: 10.5pt;
       line-height: 1.7; color: #1a1a1a; max-width: 100%; }
h1 { font-size: 17pt; border-bottom: 2px solid #333; padding-bottom: 4px;
     page-break-before: always; margin-top: 0; }
h2 { font-size: 13.5pt; margin-top: 1.2em; }
h3 { font-size: 11.5pt; }
h4 { font-size: 10.5pt; }
pre { background: #f4f4f4; padding: 8px 10px; font-size: 9pt;
      white-space: pre-wrap; border: 1px solid #ddd; }
code { font-family: Consolas, monospace; font-size: 9pt; background: #f4f4f4; padding: 0 2px; }
blockquote { border-left: 3px solid #999; margin-left: 0; padding-left: 12px; color: #444; }
table { border-collapse: collapse; width: 100%; margin: 0.8em 0; font-size: 9pt; }
th, td { border: 1px solid #bbb; padding: 4px 7px; text-align: left; }
th { background: #eee; }
img { max-width: 100%; display: block; margin: 0.9em auto; }
p > img + em { display: block; text-align: center; font-size: 9pt; color: #555; }
hr { border: none; border-top: 1px solid #ccc; margin: 1.2em 0; }
.titlepage { text-align: center; padding-top: 30%; }
.titlepage h1 { border: none; font-size: 24pt; page-break-before: avoid; }
.titlepage .sub { font-size: 13pt; color: #555; }
.titlepage .meta { font-size: 11pt; color: #777; margin-top: 2em; }
.toc { page-break-after: always; }
.toc h1 { page-break-before: avoid; border: none; }
"""


def render_md(paths, title, subtitle, meta):
    body_parts = []
    for p in paths:
        text = (ROOT / p).read_text(encoding="utf-8")
        # 图片相对路径改为根目录相对（HTML 放在根目录）
        text = text.replace("](figures/", "](figures/")
        body_parts.append(MD.convert(text))
        MD.reset()
    body = "\n".join(body_parts)
    toc = getattr(MD, "toc", "")
    return f"""<!DOCTYPE html>
<html lang="zh-CN"><head><meta charset="utf-8">
<title>{title}</title><style>{CSS}</style></head>
<body>
<div class="titlepage">
<h1>{title}</h1>
<div class="sub">{subtitle}</div>
<div class="meta">{meta}</div>
</div>
{toc}
{body}
</body></html>"""


def main():
    # 中文版：正文 1-90 节 + 严谨化附件 A-G
    cn_files = [
        "第1-28节.md",
        "统一场量子现实与可编程时空.md",
        "时空之前是什么.md",
        "质量-惯性与Tμν.md",
        "实验路线图.md",
        "物理现实的工程学边界.md",
        "核心命题-形式化.md",
        "原创贡献清单.md",
        "体例与文风统一说明.md",
        "参考文献总表.md",
        "研究缺口补齐.md",
        "优先权检索记录.md",
        "投稿策略.md",
    ]
    cn = render_md(
        cn_files,
        "从特斯拉到时空工程",
        "统一场、量子现实与可编程时空（全稿：第 1–90 节 + 严谨化附件）",
        "作者：MuningAn　·　机构：PlanetarySystem　·　2026-08",
    )
    (ROOT / "paper_cn.html").write_text(cn, encoding="utf-8")
    print("paper_cn.html written, chars:", len(cn))

    # 英文版：完整版（Part I 概念论文 + Parts II–VI 精译与形式装置）
    en_files = ["English-完整版.md"]
    en = render_md(
        en_files,
        "Three Unifications: A Falsifiable Map of the Quantum-Gravity Frontier",
        "Complete English Edition — from anti-gravity myths to the engineering of physical reality",
        "MuningAn · PlanetarySystem · 2026-08",
    )
    (ROOT / "paper_en.html").write_text(en, encoding="utf-8")
    print("paper_en.html written, chars:", len(en))


if __name__ == "__main__":
    main()
