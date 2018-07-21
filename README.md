# photo-classifier
Classify your files by last modified time.

## Features
- Classify in independent directory "**classified**".
- Copy files to classified directory. **\*Origin files will not delete.**

## Example
    ./photos
    |-IMG_01.jpg  <-lastModifiedTime: 2017/01/01 12:00
    |-IMG_02.jpg  <-lastModifiedTime: 2017/02/02 09:00
    |-IMG_03.jpg  <-lastModifiedTime: 2017/02/02 18:00
    
    ...
    
    Classified
   
    ...
    
    ./photos
    |-...origin files...
    |-classified
    |         |-2017.01.01
    |         |         |-IMG_01.jpg
    |         |-2017.02.02
    |         |         |-IMG_02.jpg
    |         |         |-IMG_03.jpg
