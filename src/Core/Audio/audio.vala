
public class Audio : Object {
    public bool playing {
        get {
            return !SDLMixer.Music.is_paused () && SDLMixer.Music.is_playing ();
        }
        set {
            if (value == true) {
                SDLMixer.Music.resume ();
            } else {
                SDLMixer.Music.pause ();
            }
        }
    }
    SDLMixer.Music audio;

    public Audio.load_from_file (string src) {
        if (SDLMixer.open (44100, SDL.Audio.AudioFormat.S32, 2, 2048) < 0) {
            print ("SDL_mixer could not initialize!");
        }
        print (@"Loading $src\n");
        audio = new SDLMixer.Music (src);
    }

    ~Audio () {
        SDLMixer.close ();
    }

    public void play (int loops)
    requires (audio != null)
    requires (loops > 0) {
        audio.play (loops);
    }
}
