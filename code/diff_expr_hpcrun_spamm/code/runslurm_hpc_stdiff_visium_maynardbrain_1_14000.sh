#!/bin/bash
#SBATCH --job-name=stidff_visium_brain
#SBATCH --cpus-per-task=1
#SBATCH --output=/home/4472525/spatialge_stdiff_manuscript/stdiff_hpcrun_spamm/code/logs/output_visium_brain_%A_%a.out
#SBATCH --error=/home/4472525/spatialge_stdiff_manuscript/stdiff_hpcrun_spamm/code/logs/error_visium_brain_%A_%a.err
#SBATCH -a 1-14000%1000

cd /home/4472525/spatialge_stdiff_manuscript/stdiff_hpcrun_spamm/code

args=$(cat ../data/visium_gene_meta_combo_maynardbrain.txt | sed -n ${SLURM_ARRAY_TASK_ID}p)

echo "Start analysis: "
echo $(date)

module load R
Rscript /home/4472525/spatialge_stdiff_manuscript/stdiff_hpcrun_spamm/code/spatial_model_tests_spamm.R $args

cd /home/4472525/spatialge_stdiff_manuscript/stdiff_hpcrun_spamm/code

echo "End analysis: "
echo $(date)
