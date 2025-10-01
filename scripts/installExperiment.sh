# Variables
BASE_DIR="baseimage"
BASE_IMAGE_FILE="$BASE_DIR/Pharo.image"
PHARO_CMD="$BASE_DIR/pharo"

# Functions
install_instrumentation() {
  local image_path="$1"
  "$PHARO_CMD" --headless "$image_path "metacello --save install "github://jordanmontt/method-proxies-experiments:main" MpPerformanceExperiment

  echo; echo; echo
  echo "Installed instrumentation for image $image_path"
}

install_veritas_for() {
  local image_path="$1"
  local veritas_bench="$2"
  "$PHARO_CMD" --headless "$image_path" metacello --save install "github://jordanmontt/PharoVeritasBenchSuite:main" "$veritas_bench"


  echo; echo; echo
  echo "Installed Veritas $veritas_bench for image $image_path"
}

setup_base_image() {
  mkdir -p baseimage
  cd baseimage || return 1
  wget --quiet -O - get.pharo.org/140+vm | bash
  cd - > /dev/null || return 1

  echo; echo; echo
  echo "Baseimage downloaded"
}

######

# Download baseimage
setup_base_image


############
# Cormas
mkdir -p cormas

# save image and copy sources file
"$PHARO_CMD" --headless "$BASE_IMAGE_FILE" save ../cormas/cormas
cp "$BASE_DIR"/*.sources ./cormas/

# install dependencies
install_instrumentation ./cormas/cormas.image
install_veritas_for ./cormas/cormas.image VeritasCormas


############
# Moose
mkdir -p moose

# save image and copy sources file
"$PHARO_CMD" --headless "$BASE_IMAGE_FILE" save ../moose/moose
cp "$BASE_DIR"/*.sources ./moose/

# install dependencies
install_instrumentation ./moose/moose.image
install_veritas_for ./moose/moose.image VeritasMoose

# move tiny_dataset.csv to the root of df/
mv ./moose/pharo-local/iceberg/jordanmontt/PharoVeritasBenchSuite/files/sbscl.json ./moose/
echo; echo; echo
echo "moose model copied"


############
# Microdown
mkdir -p micro

# save image and copy sources file
"$PHARO_CMD" --headless "$BASE_IMAGE_FILE" save ../micro/micro
cp "$BASE_DIR"/*.sources ./micro/

# install dependencies
install_instrumentation ./micro/micro.image
install_veritas_for ./micro/micro.image VeritasMicrodown

# download Spec2 book
TMP_CLONE_DIR=$(mktemp -d)
git clone --depth=1 https://github.com/SquareBracketAssociates/BuildingApplicationWithSpec2.git "$TMP_CLONE_DIR"
mv "$TMP_CLONE_DIR" ./micro/Spec2Book
echo; echo; echo
echo "Spec2Book downloaded"


############
# DataFrame
mkdir -p df

# save image and copy sources file
"$PHARO_CMD" --headless "$BASE_IMAGE_FILE" save ../df/df
cp "$BASE_DIR"/*.sources ./df/

# install dependencies
install_instrumentation ./df/df.image
install_veritas_for ./df/df.image VeritasDataFrame

# move tiny_dataset.csv to the root of df/
mv ./df/pharo-local/iceberg/jordanmontt/PharoVeritasBenchSuite/files/tiny_dataset.csv ./df/
echo; echo; echo
echo "dataset copied"

