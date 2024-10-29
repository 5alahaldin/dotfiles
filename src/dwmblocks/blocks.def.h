#define VOLUME_CMD "amixer get Master | awk -F'[][]' '/Left:/{print($4==\"off\"?\"MUTE\":substr($2, 1, length($2)-1));exit}'"
#define MIC_CMD "amixer get Capture | awk -F'[][]' '/Left:/{print($4==\"off\"?\"MUTE\":substr($2, 1, length($2)-1));exit}'"
#define CPU_CMD "$HOME/bin/cpu.sh"
#define NETWORK_CMD "$HOME/bin/network.sh"
#define DATE_CMD "date '+%a %d %b %y - %T'"
#define RECORD_CMD "[ -f /tmp/video_recording.pid ] || [ -f /tmp/audio_recording.pid ] && echo '[Recording]'"

static const Block blocks[] = {
  /* Icon           Command                 Interval            Signal */
    {"",            RECORD_CMD,             0,                  10},
    {";Vol: ",      VOLUME_CMD,             0,                  30},
    {" - ",         MIC_CMD,                0,                  29},
    {" | CPU: ",    CPU_CMD,                3,                  0},
    // {" | ",         NETWORK_CMD,            3,                  0},
    {" | ",         DATE_CMD,               1,                  0},
};

static char delim[] = "\0";
static unsigned int delimLen = 0;