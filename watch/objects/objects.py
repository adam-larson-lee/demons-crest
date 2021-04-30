import os

OBJECT_FILE_NAME = 'object.wch'
OBJECTS_FILE_NAME = 'objects.wch'

if os.path.exists(OBJECTS_FILE_NAME):
  os.remove(OBJECTS_FILE_NAME)

objectFile = open(OBJECT_FILE_NAME, 'r')
objectsFile = open(OBJECTS_FILE_NAME, 'a+')

objectsFile.write('SystemID SNES\n')

objectSize = 0x50
objects = 30
objectWatches = []

for objectFileLine in objectFile:
  objectWatches.append(objectFileLine.split())

for x in range(objects):
  objectsFile.write('0\tS\t_\t1\t\t')
  objectsFile.write('\n')
  objectsFile.write('0\tS\t_\t1\t\t')
  objectsFile.write(str(x))
  objectsFile.write('\n')
  objectsFile.write('0\tS\t_\t1\t\t')
  objectsFile.write('\n')

  for objectWatch in objectWatches:
    if objectWatch and objectWatch[0] != 'SystemID':
      objectsFile.write(hex(int(objectWatch[0], 16) + (x * objectSize))[2:].zfill(6))
      objectsFile.write('\t')
      objectsFile.write(objectWatch[1])
      objectsFile.write('\t')
      objectsFile.write(objectWatch[2])
      objectsFile.write('\t')
      objectsFile.write(objectWatch[3])
      objectsFile.write('\t')
      objectsFile.write(objectWatch[4])
      objectsFile.write('\t')
      for y in range(len(objectWatch) - 5):
        objectsFile.write(objectWatch[5 + y])
        objectsFile.write(' ')
        
      objectsFile.write('\n')


objectFile.close()
objectsFile.close()