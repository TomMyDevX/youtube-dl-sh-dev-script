#!/bin/bash
if [ -z $1 ]; then
 echo VideoID?;
read video_id
else
 video_id=$1
fi

mkdir $video_id
cd $video_id
youtube-dl -f 137 $video_id
youtube-dl -f 140 $video_id


echo "XXXXXXXXXXXXX  FILE OUT XXXXXXXXXXXXXXXX"
for f in *.mp4; do
video_f_name=$f
    #printf '%s.mp4\n' "${f%.mp4}"
done

for f in *.m4a; do
audio_f_name=$f
    #printf '%s.m4a\n' "${f%.m4a}"
done


echo $video_f_name
echo $audio_f_name 

echo ">>FFMPEG FILE Mix"

mkdir out
ffmpeg -i "$video_f_name" -i "$audio_f_name"  -c:v copy -c:a aac -strict experimental "out/$video_f_name"

echo "Completed!"

echo "Cleaning Resource"
rm "$video_f_name"
rm "$audio_f_name"


echo "Copy File Out To Top Folder"
cd ..
cp "$video_id/out/$video_f_name" "$video_f_name" 

rm -rf "$video_id"

echo "Bye Bye!";
