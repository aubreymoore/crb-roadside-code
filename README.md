

# Saving code and data in a GitHub repo

There is a small problem in saving the data and code in this directory in a GitHub repo because some of the code files exceed the 50 MB file size limit imposed by GitHub.

```
aubreytensor1@tensorbook:~/Desktop/Guam07$ find . -type f -size +50M
./code_2023_03_26/object-detectors/inference_data/frozen_inference_graph_5classes.pb
./code_2023_03_26/object-detectors/inference_data/frozen_inference_graph_3classes.pb
./code_2023_03_26/object-detectors/inference_data/mask_rcnn_cvat_0160.h5
```

A way to get around this is to use [fileSplitMerge](https://github.com/usamakh20/fileSplitMerge). NOT YET IMPLEMENTED.

# Immediate problem

survey | percent trees damaged
------ | :-------------------:
Guam05 | 21
Guam06 | 7
Guam07 | 7

I suspect this drop is caused by a change in code. This can be determined by an experiment: simply process the Guam05 raw data using the current code base. PROCESSING NOW.
# Guam08-roadside-code
# crb-roadside-code
