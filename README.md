# Serpentine optical interferometer

**DIY 세르펜틴(링) 광학 간섭계** — Savart형 빔 분할과 출사 빔이 한 점으로 되돌아오는 **세르펜틴 레이아웃**을 구현한 실험 프로젝트입니다.

주요 실험 결과로 **Holoscopic Boundary** 현상과 **Z축 회전에 따른 회절/간섭 전이**를 관찰·기록합니다.

**원격 저장소:** [github.com/Chur-chin/serpentine-optical-interferometer](https://github.com/Chur-chin/serpentine-optical-interferometer)

---

## Holoscopic Boundary (대표 영상)

### Video 1 — Double Spot Blinking

[![Video 1](https://img.shields.io/badge/Video_1-Double_Spot_Blinking-blue)](media/holoscopic-boundary/videos/20260513_194532.mp4)

- 두 스팟이 동시에 나타났다 사라지며 깜빡이는 현상
- Holoscopic boundary 영역의 특징적 간섭 패턴

### Video 2 — Circular Interference

[![Video 2](https://img.shields.io/badge/Video_2-Circular_Interference-blue)](media/holoscopic-boundary/videos/circular_interference.mp4)

- 출력 빔이 거의 0°에 가까울 때의 원형 간섭 무늬
- 세르펜틴 레이아웃의 폐루프 특성을 보여줌

**문서:** [docs/holoscopic-boundary/](docs/holoscopic-boundary/) · **영상 폴더:** [media/holoscopic-boundary/videos/](media/holoscopic-boundary/videos/)

---

## Serpentine interferometer (CAD · 벤치)

세르펜틴 링 간섭계 설계·조립·노트 요약은 [docs/serpentine-interferometer/README.md](docs/serpentine-interferometer/README.md)를 참고하세요.

---

## Laser diffraction — Z-axis rotation

2026-05-15·16 세션의 영상·사진·분석 노트:

- [docs/laser-diffraction-z-rotation/](docs/laser-diffraction-z-rotation/)
- [media/laser-diffraction-z-rotation/](media/laser-diffraction-z-rotation/)

---

## Repository layout

```
├── docs/           # 실험 노트, 원고(.docx), 아카이브
├── media/          # 사진·영상 (주제별 하위 폴더)
├── scripts/        # git mv 기반 정리 스크립트
├── README.md
└── License
```

루트에 파일을 올린 뒤 정리하려면:

```powershell
$env:GIT_EXECUTABLE = "C:\Users\Administrator\AppData\Local\GitHubDesktop\app-3.5.8\resources\app\git\cmd\git.exe"
.\scripts\apply-repo-layout.ps1 -Commit -Push
```

---

## License

루트의 [License](License) 파일을 참고하세요.
