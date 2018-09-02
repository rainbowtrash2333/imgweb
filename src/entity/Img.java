package entity;
import java.sql.Timestamp;
public class Img {
    private int id;
    private String name;
    private String path;
    private String uploader;
    private Timestamp timestamp;
    private int like;
    private int dislike;
    private String label;

    public void setId (int id) {
        this.id = id;
    }

    public void setName (String name) {
        this.name = name;
    }

    public void setPath (String path) {
        this.path = path;
    }

    public void setLike (int like) {
        this.like = like;
    }

    public void setDislike (int dislike) {
        this.dislike = dislike;
    }

    public void setLabel (String label) {
        this.label = label;
    }

    public int getId () {
        return id;
    }

    public String getName () {
        return name;
    }

    public String getUploader () {
        return uploader;
    }

    public void setUploader (String uploader) {
        this.uploader = uploader;
    }


    public String getPath () {
        return path;
    }

    public int getLike () {
        return like;
    }

    public int getDislike () {
        return dislike;
    }

    public Timestamp getTimestamp () {
        return timestamp;
    }

    public void setTimestamp (Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getLabel () {
        return label;
    }
}
