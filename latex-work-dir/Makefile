BUILD := build
OUTPUT := output
UNESA_TEMPLATE_DOCX ?= ../docx-format/TEMPLATE FORMAT SKRIPSI KUANTITATIF.docx

.PHONY: all prepare fallback ci strict doctor proposal skripsi check check-strict clean cleanall

all: proposal skripsi

prepare:
	@mkdir -p "$(BUILD)/fonts" "$(BUILD)/assets" "$(OUTPUT)/proposal" "$(OUTPUT)/skripsi"
	@if grep -Eq '^[[:space:]]*@[[:alpha:]]+[[:space:]]*[{(]' refs/references.bib && \
		grep -REq '\\cite[a-zA-Z*]*[[:space:]]*\{' chapters pages formats; then \
		printf '%s\n' '\showbibliographytrue' > "$(BUILD)/bibliography-toggle.tex"; \
	else \
		printf '%s\n' '\showbibliographyfalse' > "$(BUILD)/bibliography-toggle.tex"; \
	fi
	@if [ -f "$(UNESA_TEMPLATE_DOCX)" ]; then \
		unzip -p "$(UNESA_TEMPLATE_DOCX)" word/media/image1.png > "$(BUILD)/assets/logo_unesa.png"; \
		unzip -p "$(UNESA_TEMPLATE_DOCX)" word/fonts/BookAntiqua-regular.ttf > "$(BUILD)/fonts/BookAntiqua-regular.ttf"; \
		unzip -p "$(UNESA_TEMPLATE_DOCX)" word/fonts/BookAntiqua-bold.ttf > "$(BUILD)/fonts/BookAntiqua-bold.ttf"; \
		unzip -p "$(UNESA_TEMPLATE_DOCX)" word/fonts/BookAntiqua-italic.ttf > "$(BUILD)/fonts/BookAntiqua-italic.ttf"; \
		unzip -p "$(UNESA_TEMPLATE_DOCX)" word/fonts/BookAntiqua-boldItalic.ttf > "$(BUILD)/fonts/BookAntiqua-boldItalic.ttf"; \
	else \
		printf '%s\n' "INFO: UNESA_TEMPLATE_DOCX tidak ditemukan; memakai font dan logo fallback."; \
	fi

fallback:
	$(MAKE) clean
	$(MAKE) UNESA_TEMPLATE_DOCX=/path/that/does/not/exist all

ci: fallback
	sh scripts/check-workspace.sh --ci

strict:
	@if [ ! -f "$(UNESA_TEMPLATE_DOCX)" ]; then \
		printf '%s\n' "ERROR: strict build butuh UNESA_TEMPLATE_DOCX yang valid."; \
		exit 1; \
	fi
	$(MAKE) clean
	$(MAKE) all UNESA_TEMPLATE_DOCX="$(UNESA_TEMPLATE_DOCX)"
	$(MAKE) check-strict UNESA_TEMPLATE_DOCX="$(UNESA_TEMPLATE_DOCX)"

doctor:
	@for command_name in latexmk xelatex bibtex unzip rg pdfinfo pdffonts; do \
		if command -v "$$command_name" >/dev/null 2>&1; then \
			printf 'OK   %s: %s\n' "$$command_name" "$$(command -v "$$command_name")"; \
		else \
			printf 'MISS %s\n' "$$command_name"; \
		fi; \
	done
	@if [ -f "$(UNESA_TEMPLATE_DOCX)" ]; then \
		printf '%s\n' "OK   DOCX: $(UNESA_TEMPLATE_DOCX)"; \
	else \
		printf '%s\n' "INFO DOCX tidak tersedia: fallback mode"; \
	fi

proposal: prepare
	latexmk -xelatex main_proposal.tex
	cp "$(BUILD)/main_proposal.pdf" "$(OUTPUT)/proposal/Proposal_UNESA.pdf"
	@printf '%s\n' "Output: $(OUTPUT)/proposal/Proposal_UNESA.pdf"

skripsi: prepare
	latexmk -xelatex main_skripsi.tex
	cp "$(BUILD)/main_skripsi.pdf" "$(OUTPUT)/skripsi/Skripsi_UNESA.pdf"
	@printf '%s\n' "Output: $(OUTPUT)/skripsi/Skripsi_UNESA.pdf"

check: all
	sh scripts/check-workspace.sh

check-strict: all
	sh scripts/check-workspace.sh --strict

clean:
	latexmk -C main_proposal.tex
	latexmk -C main_skripsi.tex
	rm -rf "$(BUILD)"

cleanall: clean
	rm -rf "$(OUTPUT)"
