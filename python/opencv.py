#-> Beispiel:
#!/bin/env python3.8

import cv2 as cv
import sys

#connect to webcam
cap = cv.VideoCapture(0);

while (True):
    #if retrieve is false, it can't read from webcam (retrieve = False).
    #otherwise a frame is stored in frame (retrieve = True).
    retrieve, frame = cap.read(0);

    if retrieve == False:
        break

    cv.imshow('windowname', frame);

    if cv.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv.destroyAllWindows()
                                                                                                                                                                         
                                                   
