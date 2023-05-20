### set up a GPU monitor
```
nvidia-smi --loop=1
```

### test run
```
workon py38
python3.6 demo.py --dump_sql=False --num_frames=5
```
