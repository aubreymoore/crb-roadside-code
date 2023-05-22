# crb-roadside-code

This repo contains software and sample data for automated roadside surveys of coconut rhinoceros beetle (CRB) damage. 
The **rawdata** folder contains sample data in the form of 20 georeferenced image files in **jpg** format.
The software uses an object detector to find all coconut palms within the images to assign a 5-level damage index to each one. 
A second object detector searches for v-shaped cuts in coconut palm fronds (a distinctive symptom of CRB damage).

All development was done using **Python 3.6.9** on a GPU-equipped laptop running **Ubuntu 18.0.6 LTS**.

Code is contained in the following Jupyter notebooks:

* **code/run_all.ipynb** is the main program. It simply is runs the following notebooks.
* **code/extract_gps_data.ipnb** extracts GPS coordinates from each image in the **rawdata** folder and 
savesresults in **rawdata/gps-data.csv**.
* **code/detect_crb_damage.ipynb** runs the object detectors and saves results in **output/detected_objects.xml**.
* **code/create_db.ipynb** uses data from **rawdata/gps-data.csv** and **output/detected_objects.xml** to create 
a SpatiaLite database (default name: **output/results.db**).  

The resulting database, **output/results.db**, is used as the datasource for an interactive web map generated 
by **QGIS** (see https://github.com/aubreymoore/Guam-CRB-web-maps for details).

**Important Note:** Beware that installing requirements for my software is very difficult. To date, I have been
able to clone this repo and run **code/run_all.ipynb** successfully only on my development machine. 

## Installation (this section is under construction)

```bash
# Clone this repo into a new directory
git clone https://github.com/aubreymoore/crb-roadside-code roadside-test

# Change working directory to new directory
cd roadside-test

# Create a new virtual environment
python3 -m venv env

# Activate the new environment
source env/bin/activate

# Register env with Jupyter lab
python -m ipykernel --user --name=env

# Open Jupyter lab and select 'env' as the kernel
jupyter lab
```
