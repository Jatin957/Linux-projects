!/bin/bash


DOCUMENTS_DIR="Documents"
IMAGES_DIR="Images"
VIDEOS_DIR="Videos"
OTHERS_DIR="Others"

mkdir -p "$DOCUMENTS_DIR" "$IMAGES_DIR" "$VIDEOS_DIR" "$OTHERS_DIR"

for file in *; do

if [ -d "$file" ]; then
continue
fi


file_type=$(file -b --mime-type "$file" | cut -d'/' -f1)


case "$file_type" in
"text")
mv "$file" "$DOCUMENTS_DIR/"
;;
"image")
mv "$file" "$IMAGES_DIR/"
;;
"video")
mv "$file" "$VIDEOS_DIR/"
;;
*)
mv "$file" "$OTHERS_DIR/"
;;
esac
done

echo "File organization completed."
