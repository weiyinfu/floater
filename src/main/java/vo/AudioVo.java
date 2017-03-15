package vo;

public class AudioVo extends PostVo {
	long recordTime;
	float volumeRate;
	int[] volumeArray;
	String text;

	public long getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(long recordTime) {
		this.recordTime = recordTime;
	}

	public float getVolumeRate() {
		return volumeRate;
	}

	public void setVolumeRate(float volumeRate) {
		this.volumeRate = volumeRate;
	}

	public int[] getVolumeArray() {
		return volumeArray;
	}

	public void setVolumeArray(int[] volumeArray) {
		this.volumeArray = volumeArray;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
}
