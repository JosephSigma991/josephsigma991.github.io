from pathlib import Path

path = Path('index.html')
text = path.read_text(encoding='utf-8')

replacements = {
    'Youssef Hamdaoui — Operations Intelligence Engineer': 'Youssef Hamdaoui | Operations Intelligence Architect',
    'Operations Intelligence Engineer — aviation analytics, SQL pipelines, Streamlit dashboards, CI-validated data contracts, executive reporting.': 'Operations Intelligence Architect building decision-grade systems for airline operations. SQL Server ETL, Python, Streamlit, Power BI, ReportLab decision packs, and CI-validated data contracts.',
    'I build decision-grade analytics systems for airline operations. SQL pipelines, dashboards, OTP regression models, automated PDF reporting.': 'I build decision-grade systems for airline operations. Flight data in. Operational accountability out.',
    'Operations Intelligence Engineer\n        <span>I build decision-grade analytics systems for airline operations.<br>Flight data in. Delay intelligence out. 153K+ flights and counting.</span>': 'Operations Intelligence Architect\n        <span>I build decision-grade systems for airline operations.<br>Flight data in. Operational accountability out.</span>',
}

missing = []
for old, new in replacements.items():
    if old not in text:
        missing.append(old)
    text = text.replace(old, new)

path.write_text(text, encoding='utf-8')

if missing:
    print('WARNING: missing replacement patterns:')
    for item in missing:
        print('-', item)
else:
    print('PASS: portfolio Task 1 meta and hero positioning patch applied.')
