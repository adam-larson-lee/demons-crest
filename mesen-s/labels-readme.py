import os

LABELS_FILE_NAME = 'labels.msl'
README_FILE_NAME = 'README.md'

if os.path.exists(README_FILE_NAME):
  os.remove(README_FILE_NAME)

labelsFile = open(LABELS_FILE_NAME, 'r')
readmeFile = open(README_FILE_NAME, 'a+')

readmeFile.write('# WORK\n')
readmeFile.write('\n')
readmeFile.write('|Address|Label|Comment|\n')
readmeFile.write('|-------|-----|-------|\n')

for labelsFileLine in labelsFile:
  labelsFileLineComponents = labelsFileLine.replace('\n', '').split(':')
  if labelsFileLineComponents[0] == 'WORK' :
    readmeFile.write('|0x')
    readmeFile.write(labelsFileLineComponents[1].rjust(6, '0'))
    readmeFile.write('|')
    readmeFile.write(labelsFileLineComponents[2])
    readmeFile.write('|')
    if len(labelsFileLineComponents) > 3:
      readmeFile.write(labelsFileLineComponents[3])
      readmeFile.write('|')
    readmeFile.write('\n')

labelsFile.close()
readmeFile.close()