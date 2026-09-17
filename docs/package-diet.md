# Emacs 패키지 다이어트 결과

2026-09-17, Emacs 30.1의 활성 패키지 디렉터리 `elpa-30.1`을 정리했다.

- 외부 설치 패키지: **218종 → 111종**. 선택한 제거 대상 80종, Uiua 기본 모드 1종, 불필요해진 의존성 26종을 삭제했다.
- 불필요한 `lisp/init-*.el` 모듈 21개와 해당 로드·설치 선언·훅·단축키를 제거했다.
- 기존 개인 설정의 ghostel·EAM·Org-roam·TypeScript 설정을 보존했다. ghostel-ime도 유지한다.
- `wgrep`은 `rg`의 의존성으로 유지한다. 별도로 추가했던 grep 편집 키 설정은 제거했다.
- `reformatter`는 `shfmt`·`sqlformat`과 Terraform·Lua·Python Black 포맷 명령에 필요해 유지한다.
- `custom.el`의 선택 패키지 목록을 정리했다. 이 파일은 저장소에서 추적되지 않는 로컬 설정이다.
- 기존 `elpa` 디렉터리와 외부 실행 프로그램, 사용자 Org 문서·데이터는 삭제하지 않았다.

설정 백업과 삭제한 패키지 압축본: `/tmp/emacs-package-diet-backup/`. 임시 경로이므로 장기 보관이 필요하면 별도 복사해야 한다.

## 검증

남은 111종만 연결한 임시 홈에서 실제 init을 로드하고 after-init 훅을 실행했다. 패키지 설치·저장소 갱신을 차단한 상태에서 시작했다. Lisp 괄호 검사, 주요 편집 모드 22종, 기본 ibuffer 표시, htmlize 없이 Org HTML 내보내기, 유지한 포맷·ghostel·EAM 명령 존재를 검증했다. 삭제 후에도 같은 검증을 실행했다.

이 검증은 배치 모드이며 GUI 터미널 상호작용이나 실제 언어 서버·외부 포매터 실행까지 확인한 것은 아니다. 실행 중인 Emacs에 이미 로드된 기능과 단축키는 **재시작 후** 정리된 상태가 적용된다.

## 사용자와 확정한 결정


확정 결정에 따라 설정과 활성 패키지 디렉터리 정리를 완료했다. 의존성이 필요한 패키지는 보존했다.

| 패키지 | 결정 | 이유 |
|---|---|---|
| `command-log-mode` | 제거 | 키 입력·명령 시연/녹화 기능을 사용하지 않음 |
| `uptimes` | 제거 | Emacs 실행 시간 통계가 필요하지 않음 |
| `osx-location` | 제거 | Emacs에서 macOS 위치 정보를 활용하지 않음 |
| `gnuplot` | 제거 | Gnuplot 미사용. Org Babel의 `(gnuplot . t)` 설정도 함께 제거 |
| `vc-darcs` | 제거 | Darcs 미사용. init-darcs 로드와 관련 훅도 함께 제거 |
| `color-theme-sanityinc-solarized` | 제거 | Solarized 미사용. 현재 Tomorrow 테마 유지 |
| `dash-at-point` | 제거 | Dash 앱 연동 미사용. init-dash 로드와 C-c D 단축키도 함께 제거 |
| `disable-mouse` | 제거 | 마우스 입력 차단 기능 미사용 |
| `immortal-scratch` | 제거 | scratch 버퍼 자동 재생성 불필요. after-init-hook의 활성화 설정도 함께 제거 |
| `scratch` | 제거 | 언어별 임시 작업 버퍼 기능 불필요. 기본 scratch 버퍼는 유지 |
| `dimmer` | 유지 | 선택하지 않은 창을 흐리게 표시하는 효과 유지 |
| `diminish` | 유지 | 모드라인의 보조 모드 이름을 숨기거나 줄이는 기능 유지 |
| `which-key` | 유지 | 이어 누를 수 있는 단축키 안내 유지. Emacs 30.1 내장 기능 |
| `anzu` | 유지 | 검색 일치 개수와 현재 위치 표시 및 치환 보조 기능 유지 |
| `avy` | 제거 | 화면 내 빠른 위치 이동 기능 불필요. C-; 단축키도 함께 제거 |
| `multiple-cursors` | 제거 | 다중 커서 편집 미사용. 연결된 전역 단축키도 함께 제거 |
| `move-dup` | 유지 | 줄 이동과 복제 기능 및 단축키 유지 |
| `whole-line-or-region` | 제거 | 선택 영역이 없을 때 줄 전체에 적용하는 동작 불필요. 자동 활성화 및 diminish 설정도 함께 제거 |
| `browse-kill-ring` | 유지 | 복사·잘라내기 기록 목록 탐색 및 M-Y 단축키 유지 |
| `symbol-overlay` | 유지 | 동일 심볼 강조 및 다음·이전 위치 이동 기능 유지 |
| `rainbow-delimiters` | 유지 | 코드의 괄호 중첩 깊이별 색상 표시 유지 |
| `rainbow-mode` | 유지 | 색상 코드를 실제 색으로 미리 표시하는 기능 유지 |
| `highlight-escape-sequences` | 유지 | 문자열의 이스케이프 문자 강조 기능 유지 |
| `page-break-lines` | 유지 | 페이지 구분 문자 및 복사 기록 구분선을 가로선으로 표시 |
| `mode-line-bell` | 유지 | 경고 시 모드라인을 깜빡이는 시각적 알림 유지 |
| `default-text-scale` | 유지 | Emacs 전체 기본 글자 크기 조절 및 단축키 유지 |
| `ns-auto-titlebar` | 유지 | macOS 제목 표시줄 스타일을 테마의 밝기에 맞춰 자동 조절 |
| `diredfl` | 유지 | Dired 파일 목록의 색상 구분 유지 |
| `diff-hl` | 유지 | Git 변경 위치 표시, 변경 부분 이동 및 Magit 연동 유지 |
| `git-timemachine` | 유지 | 현재 파일의 Git 과거 버전 탐색 및 C-x v t 단축키 유지 |
| `git-link` | 유지 | 현재 파일·줄 또는 선택 범위의 Git 웹 링크 생성 기능 유지 |
| `magit-todos` | 제거 | Magit에서 TODO·FIXME 목록을 모아보는 기능 불필요 |
| `forge` | 유지 | Magit에서 GitHub·GitLab 이슈 및 PR 관리 기능 유지 |
| `github-review` | 유지 | Emacs에서 GitHub PR의 줄별 리뷰와 승인·변경 요청 작성 기능 유지 |
| `github-clone` | 제거 | 별도의 GitHub 저장소 복제·포크 도구 불필요 |
| `yagist` | 제거 | Emacs에서 GitHub Gist 생성·관리 기능 불필요 |
| `bug-reference-github` | 제거 | 주석의 GitHub 이슈 번호 링크 기능 불필요. 관련 bug-reference-prog-mode 훅도 정리 |
| `flymake-actionlint` | 유지 | GitHub Actions 워크플로 오류 검사 연동 유지 |
| `rg` | 유지 | ripgrep 기반 검색 UI 유지. M-?는 이후 init-minibuffer에서 Consult ripgrep 검색으로 덮어써짐 |
| `wgrep` | 직접 설정 제거·의존성 유지 | 사용자 제거 선택. 직접 설치 선언과 사용자 지정 grep 편집 키는 제거하되 rg의 필수 의존 패키지는 보존. 패키지가 제공하는 기본 편집 명령까지 없어지는 것은 아님 |
| `projectile` | 유지 | 프로젝트 단위 파일 탐색·작업 전환 및 C-c p 명령 메뉴 유지 |
| `ibuffer-projectile` | 제거 | Projectile 기준 버퍼 그룹화 미사용. 현재 ibuffer-vc 그룹화와 구분 |
| `ibuffer-vc` | 제거 | 저장소별 버퍼 그룹화 불필요. 그룹화 훅과 vc-status-mini/vc-status/vc-relative-file 열을 정리하고 기본 ibuffer 및 C-x C-b는 유지 |
| `switch-window` | 유지 | C-x o로 선택용 키를 표시하여 이동할 창 선택 |
| `windswap` | 제거 | 창 사이 버퍼 교환 및 Ctrl-Shift-방향키 설정 제거. 같은 설정 블록의 내장 windmove와 Ctrl-방향키 이동은 보존 |
| `whitespace-cleanup-mode` | 유지 | 저장 시 불필요한 공백 자동 정리 유지 |
| `origami` | 유지 | 코드 블록 접기·펼치기 및 기존 단축키 유지 |
| `unfill` | 제거 | 문단의 줄바꿈을 합치는 추가 명령 불필요 |
| `list-unicode-display` | 제거 | Unicode 특수문자 목록 검색·복사 도구 불필요 |
| `vlf` | 제거 | 대용량 파일 분할 열기 기능 불필요. ffap-vlf 보조 명령도 제거하고 내장 so-long 설정은 보존 |
| `sudo-edit` | 제거 | 관리자 권한 편집 보조 명령 불필요. 내장 TRAMP는 유지 |
| `regex-tool` | 제거 | 별도 정규식 실험 도구 불필요. Perl 백엔드 설정도 제거하고 내장 re-builder 설정은 보존 |
| `info-colors` | 유지 | Info 매뉴얼의 추가 색상 강조 유지 |
| `vertico` | 유지 | 미니버퍼의 세로 완성 후보 목록 유지 |
| `orderless` | 유지 | 공백으로 나눈 검색어를 순서와 무관하게 매칭하는 완성 방식 유지 |
| `marginalia` | 유지 | 완성 후보 옆의 명령 설명과 파일 정보 표시 유지 |
| `consult` | 유지 | 버퍼·최근 파일·북마크 탐색과 내용 검색 및 미리보기 유지 |
| `embark` | 유지 | 완성 후보 대상 추가 작업과 후보 목록 내보내기 유지 |
| `embark-consult` | 유지 | Embark와 Consult의 후보 작업·검색 결과 내보내기·미리보기 연동 유지 |
| `corfu` | 유지 | 코드 입력 중 자동완성 후보 팝업과 후보 설명 표시 유지 |
| `corfu-terminal` | 제거 | 터미널에서 실행하는 Emacs용 완성 팝업 불필요. 활성화 설정 제거, GUI Corfu는 유지. popon은 다른 의존 여부 확인 후 정리 |
| `eglot` | 유지 | 언어 서버 연결을 통한 코드 완성·탐색·진단·이름 변경 유지 |
| `consult-eglot` | 유지 | Consult에서 Eglot 언어 서버의 프로젝트 심볼 검색 유지 |
| `flymake` | 유지 | Eglot·Ruff 등의 오류·경고 표시와 진단 목록 및 이동 기능 유지 |
| `flymake-flycheck` | 유지 | Flycheck 검사기를 Flymake 진단에 연결하는 기능 유지. flycheck 의존성도 보존 |
| `yasnippet` | 제거 | 코드 스니펫 확장 기능 불필요. 개인 설정의 use-package 선언 제거 |
| `editorconfig` | 유지 | 프로젝트 .editorconfig의 들여쓰기·줄바꿈 등 편집 규칙 자동 적용 유지 |
| `apheleia` | 유지 | 외부 포매터를 통한 저장 시 비동기 코드 포맷 및 커서 위치 보존 유지 |
| `prettier-js` | 제거 | 별도 Prettier 연결 패키지 불필요. Apheleia의 Prettier 포맷은 유지 |
| `envrc` | 제거 | direnv 연동 불필요. init-direnv 로드와 전역 활성화 및 C-c e 단축키 제거 |
| `exec-path-from-shell` | 유지 | 셸의 PATH 및 지정 환경 변수를 GUI Emacs에 반영하여 개발 도구 실행 지원 |
| `pyenv-mode` | 제거 | Emacs 내 pyenv 버전 선택 기능 불필요. 개인 설정의 선언 제거, pythonic은 다른 의존 여부 확인 후 정리 |
| `flymake-ruff` | 제거 | Ruff 검사와 Flymake의 직접 연결 불필요. 설치 선언·보조 함수·python-mode-hook 제거. 외부 Ruff 실행 프로그램은 삭제하지 않음 |
| `ruff-format` | 제거 | 별도의 Ruff 포맷 명령 불필요. 설치 선언 제거, Apheleia 포맷 설정은 유지 |
| `pip-requirements` | 제거 | requirements 파일 전용 편집 지원 불필요 |
| `toml-mode` | 유지 | pyproject.toml·Cargo.toml 등 TOML 파일 편집 및 poetry.lock 연결 유지 |
| `rust-mode` | 유지 | Rust 소스의 문법 강조·들여쓰기 등 기본 편집 지원 유지 |
| `flycheck-rust` | 유지 | Cargo 프로젝트 설정에 맞춘 Flycheck Rust 검사 구성 유지 |
| `typescript-mode` | 유지 | TypeScript 기본 편집 지원과 기존 Eglot·포맷 연결 유지 |
| `web-mode` | 유지 | HTML·혼합 템플릿 편집 및 현재 typescriptreact-mode의 TSX 편집 기반 유지 |
| `js2-mode` | 유지 | JavaScript 구문 분석·편집과 기존 보조 검사 및 Node 스크립트 연결 유지 |
| `xref-js2` | 유지 | js2-mode 분석과 프로젝트 검색을 이용한 JavaScript 정의·참조 탐색 유지 |
| `js-comint` | 제거 | Node.js 대화형 실행 연동 불필요. 관련 inferior-js-keys-mode 정의·키맵·훅도 함께 제거 |
| `json-mode` | 유지 | package.json·tsconfig.json 등 JSON 파일의 문법 강조와 들여쓰기 지원 유지 |
| `yaml-mode` | 유지 | YAML 파일 편집과 GitHub Actions 검사 연결 및 URL 인식 유지 |
| `markdown-mode` | 유지 | Markdown 편집 지원과 공백 정리 예외 설정 유지. forge 의존성도 충족 |
| `csv-mode` | 유지 | CSV 파일 편집·열 정렬 및 기존 구분자 설정 유지 |
| `dotenv-mode` | 유지 | .env 환경 변수 파일 편집 지원 유지 |
| `docker` | 제거 | Emacs 내 Docker 관리 UI 불필요. 관련 fullframe 설정 제거. Dockerfile·Compose 편집 지원은 별도 판단 |
| `dockerfile-mode` | 유지 | Dockerfile 문법 강조와 편집 지원 유지 |
| `docker-compose-mode` | 유지 | Docker Compose YAML 편집과 설정 항목 완성 지원 유지 |
| `terraform-mode` | 유지 | Terraform 파일 편집과 기존 terraform fmt 명령 정의 유지 |
| `nix-ts-mode` | 제거 | Nix 파일 편집 지원 불필요. nix-mode 대체 설치 분기·파일 연결·Nix Eglot 서버 등록도 제거. nixpkgs-fmt는 별도 판단 |
| `nixpkgs-fmt` | 제거 | Nix 포맷 기능 불필요. init-nix와 init-uiua 양쪽 설치 선언 제거 |
| `nginx-mode` | 유지 | Nginx 설정 파일 문법 강조와 들여쓰기 지원 유지 |
| `just-mode` | 제거 | Justfile 전용 편집 지원 불필요 |
| `justl` | 제거 | Justfile 작업 목록 및 실행 UI 불필요 |
| `crontab-mode` | 유지 | crontab 일정 파일 편집 및 파일 연결 유지 |
| `shfmt` | 유지 | 셸 스크립트 버퍼·선택 영역 포맷 명령 유지 |
| `restclient` | 제거 | Emacs 내 HTTP 요청 파일 기반 API 테스트 불필요. .rest 연결 및 sanityinc/restclient 보조 명령 제거 |
| `httprepl` | 제거 | 대화형 HTTP 요청 도구 불필요. 이미지 응답 표시 설정과 init-http 로드도 제거 가능 |
| `protobuf-mode` | 유지 | Protocol Buffers .proto 정의 파일 편집 지원 유지 |
| `cmake-mode` | 유지 | CMakeLists.txt 및 .cmake 빌드 설정 파일 편집 지원 유지 |
| `sqlformat` | 유지 | SQL 포맷 명령 및 C-c C-f 연결 유지 |
| `tagedit` | 유지 | HTML/SGML 태그 구조 편집과 기존 키 설정·활성화 훅 유지 |
| `css-eldoc` | 유지 | CSS 속성의 문법·값 도움말과 css-mode 활성화 훅 유지 |
| `sass-mode` | 유지 | .sass 파일 편집 지원 유지. 필수 의존 패키지 haml-mode도 보존 |
| `haml-mode` | 유지 | Haml 템플릿 편집과 C-o 설정 유지. sass-mode 의존성도 충족 |
| `mmm-mode` | 유지 | HTML·템플릿 내부 구역별 편집 모드 및 혼합 언어 지원 유지 |
| `textile-mode` | 제거 | Textile 문서 편집 불필요. init-textile 로드 및 .textile 파일 연결 제거 |
| `php-mode` | 제거 | PHP 코드 편집 지원 불필요. init-php의 설치 분기 정리, smarty-mode는 별도 판단 |
| `smarty-mode` | 제거 | Smarty 템플릿 편집 불필요. php-mode와 함께 init-php 로드 제거 가능 |
| `erlang` | 제거 | Erlang 개발 지원 불필요. init-erlang 및 erlang-start 로드 제거 |
| `haskell-mode` | 제거 | Haskell 개발 지원 불필요. 관련 훅·키 설정·hindent/ormolu 명령 정의 제거. dhall-mode는 별도 판단 |
| `dhall-mode` | 제거 | Dhall 설정 파일 편집 불필요. haskell-mode와 함께 init-haskell 로드 제거 가능 |
| `elm-mode` | 제거 | Elm 코드 편집 불필요. 모드 표시 및 elm-format 저장 시 포맷 설정 제거. elm-test-runner는 별도 판단 |
| `elm-test-runner` | 제거 | Elm 테스트 실행 연동 불필요. elm-mode와 함께 init-elm 로드 제거 가능 |
| `purescript-mode` | 제거 | PureScript 편집 불필요. 관련 훅·키 설정·import 정렬·purty 명령 정의 제거. psci 및 add-node-modules-path는 별도 판단 |
| `psci` | 제거 | PureScript 대화형 실행 불필요. inferior-psci-mode 훅과 psci 실행 advice 제거 |
| `add-node-modules-path` | 유지 | 프로젝트 로컬 Node 실행 도구 탐색 기능 유지. 설치 선언을 제거 예정인 init-purescript 밖으로 이동하고 PureScript 훅은 제거. TypeScript 연결은 도구 경로·호환성 확인 후 적용 검토 |
| `tuareg` | 제거 | OCaml 편집·대화형 실행 지원 불필요. 관련 버퍼 전환 함수와 C-c C-z 키 설정 제거 |
| `dune` | 제거 | OCaml Dune 빌드 설정 편집·연동 불필요. 외부 dune 프로그램은 삭제하지 않음 |
| `dune-format` | 제거 | Dune 설정 포맷 불필요. tuareg·dune과 함께 init-ocaml 로드 및 ocp-indent 명령 정의 정리. 공용 reformatter는 보존 |
| `j-mode` | 제거 | J 언어 편집·실행 지원 불필요. init-j 로드와 jconsole 및 실행 버퍼 훅 설정 제거 |
| `nim-mode` | 제거 | Nim 편집·개발 지원 불필요. 설치 선언 정리 및 전이 의존성은 사용처 확인 후 정리. flycheck-nim은 별도 판단 |
| `flycheck-nim` | 제거 | Nim 전용 오류 검사 불필요. nim-mode와 함께 init-nim 로드 제거. 공용 Flycheck와 Rust 검사 지원은 유지 |
| `lua-mode` | 유지 | Lua 편집·공백 2칸 들여쓰기·lua-format 명령 정의 유지. 공용 reformatter가 먼저 로드되도록 보존 |
| `uiua-ts-mode` | 제거 | Uiua 개발 지원 불필요. uiua-mode 대체 설치 및 Uiua Eglot 등록과 init-uiua 로드 제거. Uiua 전용 의존성 uiua-mode도 정리 대상 |
| `ledger-mode` | 제거 | Ledger 장부 편집 불필요. 관련 키·표시 옵션·LEDGER_FILE 환경 변수 복사 및 모드 훅 제거. flycheck-ledger는 별도 판단 |
| `flycheck-ledger` | 제거 | Ledger 장부 검사 불필요. ledger-mode와 함께 init-ledger 로드 제거. 공용 Flycheck는 유지 |
| `ruby-hash-syntax` | 유지 | Ruby 해시 표기법 변환 지원 유지. Ruby 설정 전체를 일괄 제거하지 않음 |
| `rspec-mode` | 유지 | Ruby RSpec 테스트 실행 및 구현·테스트 파일 탐색 지원 유지 |
| `inf-ruby` | 제거 | Ruby 대화형 실행 불필요. 직접 선언·sanityinc/ruby-load-file 및 remap 제거. 설치 메타데이터의 역의존 패키지 ruby-compilation·robe·bundler·projectile-rails가 모두 제거로 결정되어 함께 삭제 가능 |
| `ruby-compilation` | 제거 | Ruby 실행·테스트 보조 도구 불필요. F7/Shift-F7 연결 및 rake 별칭 제거 |
| `robe` | 제거 | Ruby 실행 환경 기반 탐색·완성·문서 조회 불필요. ruby-mode의 robe-mode 활성화 훅 제거 |
| `yari` | 제거 | Ruby RI 문서 조회 불필요. 설치 선언 및 ri 별칭 제거 |
| `bundler` | 제거 | Emacs 내 Bundler 명령 연동 불필요. 외부 bundle 명령은 유지 |
| `yard-mode` | 유지 | Ruby YARD 문서 주석 강조·도움말과 자동 활성화 및 모드라인 축약 설정 유지 |
| `projectile-rails` | 제거 | Rails 전용 탐색·작업 지원 불필요. init-rails 로드와 Projectile 연동 활성화 훅 제거 |
| `sly` | 제거 | 사용자 결정 변경: Common Lisp 개발 환경 제거. SLY 전용 설정과 보조 패키지 의존성 함께 정리 |
| `sly-asdf` | 제거 | SLY의 ASDF 프로젝트 관리 연동 불필요 |
| `sly-macrostep` | 제거 | SLY용 Common Lisp 매크로 확장 확인 기능 불필요. Emacs Lisp용 macrostep은 별도 판단 |
| `sly-repl-ansi-color` | 제거 | SLY 실행 결과 색상 표시 불필요. SLY 보조 패키지와 init-sly 로드 및 관련 설정 제거 가능 |
| `elisp-slime-nav` | 유지 | Emacs Lisp 및 IELM에서 정의·문서 탐색 지원 유지 |
| `ipretty` | 유지 | Elisp 실행 결과 정렬 및 자동 활성화 유지 |
| `auto-compile` | 유지 | Elisp 저장·로드 시 자동 바이트 컴파일 유지 |
| `aggressive-indent` | 유지 | Lisp 코드 자동 들여쓰기 유지 |
| `macrostep` | 제거 | 매크로 확장 확인 기능 및 C-c x 연결 제거 |
| `highlight-quoted` | 유지 | Elisp 인용 기호·심볼 강조 유지 |
| `package-lint-flymake` | 유지 | Elisp 패키지 작성 규칙 검사 연결 유지 |
| `cl-libify` | 유지 | 구식 cl 코드를 cl-lib 방식으로 변환하는 도구 유지 |
| `flycheck-relint` | 유지 | Elisp 정규식 검사 지원 유지 |
| `cask-mode` | 유지 | Cask 설정 파일 편집 유지 |
| `paredit` | 유지 | Lisp 괄호 구조 편집과 활성화 설정 유지 |
| `puni` | 유지 | 범용 괄호 구조 편집 유지. 현재 자동 활성화하지 않는 설정은 유지 |
| `org-cliplink` | 유지 | 클립보드 URL의 제목을 가져와 Org 링크 삽입 |
| `grab-mac-link` | 제거 | Mac 앱 링크 가져오기 불필요. Org C-c g 연결 제거 |
| `org-pomodoro` | 제거 | Org 집중·휴식 타이머 불필요. 관련 옵션 및 Agenda P 연결 제거 |
| `writeroom-mode` | 제거 | 집중 집필 화면 불필요. prose-mode의 관련 호출 정리 |
| `htmlize` | 제거 | HTML 색상 변환 기능 제거 선택. Org HTML 내보내기 시 코드 색상 유지 기능에 영향 |
| `session` | 유지 | 편집 위치·기록 복원과 기존 session 초기화 설정 유지 |
| `alert` | 제거 | 알림 기능 제거 선택. 빌드 완료 알림 함수·훅 정리. org-pomodoro도 제거 대상이며 삭제 전 나머지 역의존성 확인 |
| `gcmh` | 유지 | 메모리 정리 시점 조정 및 자동 활성화 유지 |
| `reformatter` | 직접 사용 설정 제거·의존성 유지 | 사용자 미선택. shfmt·sqlformat 및 유지한 Terraform·Lua 포맷 정의에 필요하므로 패키지와 필요한 로드·명령 정의 보존 |
| `color-theme-sanityinc-tomorrow` | 유지 | 현재 Tomorrow 테마 및 light/dark 전환 유지 |
| `git-modes` | 유지 | Git 설정 파일 편집 지원 유지 |
| `gnu-elpa-keyring-update` | 유지 | GNU ELPA 서명 검증용 키 갱신 유지 |
| `eam` | 유지 | 개인 AI 작업 관리 도구 및 ghostel 의존성 유지 |
| `eat` | 제거 | ghostel로 터미널 통일. init-terminals 로드·종료 훅·C-c t 연결 제거 |
| `vterm` | 제거 | ghostel 전환에 따라 기존 터미널 패키지와 개인 설정 제거 |
| `clojure-ts-mode` | 제거 | 비활성 Clojure 설정의 기존 설치 패키지 정리. 대체 설치 선언도 정리 |
| `cljsbuild-mode` | 제거 | ClojureScript 빌드 연동 불필요. 비활성 설정의 설치 선언 정리 |
| `magit` | 유지 | 사용자가 주 사용 기능으로 명시 |
| `org-roam` | 유지 | 사용자가 주 사용 기능으로 명시 |
| `ghostel` | 유지 | 사용자가 터미널 전환 대상으로 명시. 포함 라이브러리 ghostel-ime 및 EAM 연결 보존 |


## 남은 외부 설치 패키지

설명은 설치된 버전의 메타데이터 원문이다. Emacs 내장 기능은 이 111종에 포함하지 않는다.

| 패키지 | 목적 |
|---|---|
| `a` | Associative data structure functions. |
| `add-node-modules-path` | Add node_modules to your exec-path. |
| `aggressive-indent` | Minor mode to aggressively keep your code always indented. |
| `anzu` | Show number of matches in mode-line while searching. |
| `apheleia` | Reformat buffer stably. |
| `auto-compile` | Automatically compile Emacs Lisp libraries. |
| `browse-kill-ring` | Interactively insert items from kill-ring. |
| `cask-mode` | Major mode for editing Cask files. |
| `cl-libify` | Update elisp code to use cl-lib instead of cl. |
| `closql` | Store EIEIO objects using EmacSQL. |
| `cmake-mode` | Major-mode for editing CMake sources. |
| `color-theme-sanityinc-tomorrow` | A version of Chris Kempson's "tomorrow" themes. |
| `consult` | Consulting completing-read. |
| `consult-eglot` | A consulting-read interface for eglot. |
| `corfu` | COmpletion in Region FUnction. |
| `crontab-mode` | Major mode for crontab(5). |
| `css-eldoc` | An eldoc-mode plugin for CSS source code. |
| `csv-mode` | Major mode for editing comma/char separated values |
| `dash` | A modern list library for Emacs. |
| `default-text-scale` | Easily adjust the font size in all frames. |
| `deferred` | Simple asynchronous functions for emacs lisp. |
| `diff-hl` | Highlight uncommitted changes using VC. |
| `diminish` | Diminished modes are minor modes with no modeline display. |
| `dimmer` | Visually highlight the selected buffer. |
| `diredfl` | Extra font lock rules for a more colourful dired. |
| `docker-compose-mode` | Major mode for editing docker-compose files. |
| `dockerfile-mode` | Major mode for editing Docker's Dockerfiles. |
| `dotenv-mode` | Major mode for .env files. |
| `eam` | 개인 AI 작업 관리 및 ghostel 기반 세션 연동 |
| `elisp-slime-nav` | Make M-. and M-, work in elisp like they do in slime. |
| `emacsql` | High-level SQL database front-end. |
| `embark` | Conveniently act on minibuffer completions. |
| `embark-consult` | Consult integration for Embark. |
| `exec-path-from-shell` | Get environment variables such as $PATH from the shell. |
| `flycheck` | On-the-fly syntax checking. |
| `flycheck-relint` | A Flycheck checker for elisp regular expressions. |
| `flycheck-rust` | Flycheck: Rust additions and Cargo support. |
| `flymake-actionlint` | A Flymake handler for actionlint. |
| `flymake-easy` | Helpers for easily building flymake checkers. |
| `flymake-flycheck` | Use flycheck checkers as flymake backends. |
| `forge` | Access Git forges from Magit. |
| `gcmh` | The Garbage Collector Magic Hack. |
| `ghostel` | Terminal emulator powered by libghostty. |
| `ghub` | Client libraries for Git forge APIs. |
| `git-link` | Get the GitHub/Bitbucket/GitLab URL for a buffer location. |
| `git-modes` | Major modes for editing Git configuration files. |
| `git-timemachine` | Walk through git revisions of a file. |
| `github-review` | GitHub based code review. |
| `gnu-elpa-keyring-update` | Update Emacs's GPG keyring for GNU ELPA |
| `haml-mode` | Major mode for editing Haml files. |
| `hcl-mode` | Major mode for Hashicorp. |
| `highlight-escape-sequences` | Highlight escape sequences. |
| `highlight-quoted` | Highlight Lisp quotes and quoted symbols. |
| `info-colors` | Extra colors for Info-mode. |
| `ipretty` | Interactive Emacs Lisp pretty-printing. |
| `js2-mode` | Improved JavaScript editing mode. |
| `json-mode` | Major mode for editing JSON files. |
| `json-snatcher` | Grabs the path to JSON values in a JSON file. |
| `llama` | Compact syntax for short lambda. |
| `lua-mode` | A major-mode for editing Lua scripts. |
| `magit` | A Git porcelain inside Emacs. |
| `magit-section` | Sections for read-only buffers. |
| `marginalia` | Enrich existing commands with completion annotations. |
| `markdown-mode` | Major mode for Markdown-formatted text. |
| `mmm-mode` | Allow Multiple Major Modes in a buffer. |
| `mode-line-bell` | Flash the mode line instead of ringing the bell. |
| `move-dup` | Eclipse-like moving and duplicating lines or rectangles. |
| `nginx-mode` | Major mode for editing nginx config files. |
| `ns-auto-titlebar` | Set the MacOS transparent titlebar to match theme. |
| `orderless` | Completion style for matching regexps in any order. |
| `org-cliplink` | Insert org-mode links from the clipboard. |
| `org-roam` | A database abstraction layer for Org-mode. |
| `origami` | Flexible text folding. |
| `package-lint` | A linting library for elisp package authors. |
| `package-lint-flymake` | A package-lint Flymake backend. |
| `page-break-lines` | Display ^L page breaks as tidy horizontal lines. |
| `paredit` | Minor mode for editing parentheses. |
| `projectile` | Manage and navigate projects in Emacs easily. |
| `protobuf-mode` | Major mode for editing protocol buffers. |
| `puni` | Parentheses Universalistic. |
| `rainbow-delimiters` | Highlight brackets according to their depth. |
| `rainbow-mode` | Colorize color names in buffers |
| `reformatter` | Define commands which run reformatters on the current buffer. |
| `relint` | Elisp regexp mistake finder |
| `rg` | A search tool based on ripgrep. |
| `rspec-mode` | Enhance ruby-mode for RSpec. |
| `ruby-hash-syntax` | Toggle ruby hash syntax between => and 1.9+ styles. |
| `rust-mode` | A major-mode for editing Rust source code. |
| `s` | The long lost Emacs string manipulation library. |
| `sass-mode` | Major mode for editing Sass files. |
| `session` | Use variables, registers and buffer places across sessions. |
| `shfmt` | Reformat shell scripts using shfmt. |
| `sqlformat` | Reformat SQL using sqlformat or pgformatter. |
| `switch-window` | A *visual* way to switch window. |
| `symbol-overlay` | Highlight symbols with keymap-enabled overlays. |
| `tagedit` | Some paredit-like features for html-mode. |
| `terraform-mode` | Major mode for terraform configuration file. |
| `toml-mode` | Major mode for editing TOML files. |
| `transient` | Transient commands. |
| `treepy` | Generic tree traversal tools. |
| `typescript-mode` | Major mode for editing typescript. |
| `vertico` | VERTical Interactive COmpletion. |
| `web-mode` | Major mode for editing web templates. |
| `wgrep` | Writable grep buffer. |
| `whitespace-cleanup-mode` | Intelligently call whitespace-cleanup on save. |
| `with-editor` | Use the Emacsclient as $EDITOR. |
| `xr` | Convert string regexp to rx notation |
| `xref-js2` | Jump to references/definitions using ag & js2-mode's AST. |
| `yaml` | YAML parser for Elisp. |
| `yaml-mode` | Major mode for editing YAML files. |
| `yard-mode` | Minor mode for Ruby YARD comments. |

## 함께 삭제한 불필요 의존성

`aio`, `async`, `caml`, `commenter`, `concurrent`, `ctable`, `epc`, `f`, `flycheck-nimsuggest`, `gh`, `gntp`, `hl-todo`, `ht`, `inflections`, `inheritenv`, `log4e`, `logito`, `marshal`, `pcache`, `pcre2el`, `popon`, `popup`, `pythonic`, `rake`, `tablist`, `visual-fill-column`
