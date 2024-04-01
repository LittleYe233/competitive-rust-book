# Competitive Rust Book / Rust 在编程竞赛中的应用

## 编译

首先需要准备对应的字体文件, 在工程根目录下新建 `fonts` 文件夹并放入. 字体文件列表如下:

- LigalexMono-Italic.ttf
- LigalexMono.ttf
- NotoSansSC-Bold.otf
- NotoSansSC-Regular.otf
- NotoSerifSC-Bold.otf
- NotoSerifSC-Regular.otf

其次需要安装 Python 并安装 Pygments 包:

```bash
pip install Pygments
```

最后在完整 TeX Live 环境下使用如下编译命令:

```bash
latexmk -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -xelatex crbook.tex
```
