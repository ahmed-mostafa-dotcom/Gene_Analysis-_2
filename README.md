# Gene Expression and DNA Sequence Exercises

Two small bioinformatics learning exercises: a base R script that compares example gene-expression values, and a Python notebook that counts nucleotides and defines a GC-content function.

The examples demonstrate programming and data handling. They are not a validated differential-expression workflow or evidence of biological findings.

## Repository contents

| File | Purpose |
| --- | --- |
| `Task_3.R` | Example gene-expression data, fold changes, classification, and export/plot code |
| `gene_df_sorted.csv` | Committed table of six genes sorted by descending fold change |
| `pythonscript.ipynb` | Python DNA-sequence exercise |
| `Rplot.tiff` | Committed image; its generation is not documented by the current R script |

## Requirements

- R with base packages for `Task_3.R`
- Python 3 and a Jupyter-compatible environment for the notebook
- No third-party R packages or Python libraries are imported by the current code

## R exercise: control versus treated expression

The script defines example values for `BRCA1`, `TP53`, `EGFR`, `MYC`, `PTEN`, and `KRAS`, together with chromosome labels. It:

1. Creates named control and treated vectors.
2. Calculates fold change as `treated / control`.
3. Assigns labels using the thresholds below.
4. Builds a nested list and a data frame.
5. Includes an expression to select genes on chromosome 17.
6. Calculates a log2 fold-change column.
7. Sorts the table, exports a CSV, and draws a scatter plot.

| Fold change | Label |
| --- | --- |
| Greater than `1.2` | `upregulated` |
| Less than `0.8` | `downregulated` |
| Otherwise, including both boundaries | `stable` |

### R code status

The undefined-variable typo in the log2 calculation has been corrected to:

```r
gene_df$log2_fc <- log2(gene_df$fold_change)
```

R was not available during this update, so the corrected script was not run and the existing CSV and image were not regenerated. A successful clean run has not yet been verified.

Run from the repository directory:

```bash
Rscript Task_3.R
```

The export commands target `gene_df_sorted.csv` and `expression_plot.png` in the working directory. Regenerating the CSV will add the `log2_fc` column; the committed CSV currently has no such column. `expression_plot.png` is not currently included in the repository. The committed `Rplot.tiff` has a different filename, and its origin is not documented by the script.

### Committed example result

The existing CSV lists four genes as `upregulated` (`KRAS`, `EGFR`, `BRCA1`, and `MYC`), `TP53` as `stable`, and `PTEN` as `downregulated`. These are labels from fixed example values, not statistical significance calls.

## Python exercise: DNA composition

Open `pythonscript.ipynb` in Jupyter Notebook, JupyterLab, or another compatible notebook viewer, then run the code cells in order.

The notebook:

- Defines the sequence `ATGCGTATCGGATCGATTACG`.
- Stores its length and nucleotide counts.
- Uses a `for` loop to count bases and a `while` loop to print the counts.
- Defines `calculate_gc_content(sequence)`.

For the current sequence, the length is `21`, the counts are `A=5`, `T=6`, `G=6`, and `C=4`, and GC content is approximately `47.62%`.

The last cell currently has saved output for length and GC content but no source code. Those printed lines will not be regenerated from that empty cell. To display the values in a new cell, use:

```python
print("Sequence length:", sequence_length)
print("GC content:", round(calculate_gc_content(dna_sequence), 2), "%")
```

This is a suggested notebook addition, not an existing cell.

## Scope and limitations

- The expression values are embedded examples, not a documented experimental dataset.
- There are no replicates, normalization steps, statistical tests, or multiple-testing corrections.
- The notebook assumes uppercase input. Its GC function divides by sequence length and does not guard against an empty sequence.
- Unexpected characters are reported during counting, but the GC function uses the full input length as its denominator.
- The R typo is corrected but execution remains unverified. The missing notebook print source is unchanged and needs separate review.

## Skills demonstrated

Base R vectors, factors, lists, data frames, sorting, CSV export, plotting, and Python strings, dictionaries, lists, loops, and functions.
