package com.oscar.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.oscar.lookify.models.Song;
import com.oscar.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository songRepo;
	
	public SongService(SongRepository songRepo) {
		this.songRepo = songRepo;
	}
	
	public List<Song> getAll() {
		return songRepo.findAll();
	}
	
	public Song createSong(Song song) {
		return songRepo.save(song);
	}
	
	public Song findSong(Long id) {
		Optional<Song> optionalSong = songRepo.findById(id);
		if(optionalSong.isPresent()) {
			return optionalSong.get();
		} else {
			return null;
		}
	}
	
	public Song updateSong(Long id, String title, String artist, Integer rating) {
		Song songToUpdate = findSong(id);
		songToUpdate.setTitle(title);
		songToUpdate.setArtist(artist);
		songToUpdate.setRating(rating);
		return songRepo.save(songToUpdate);
	}
	
	public void deleteSong(Long id) {
		songRepo.deleteById(id);
	}
	
	public List<Song> getTopTenByRating() {
		return songRepo.findTop10ByOrderByRatingDesc();
	}
	
	public List<Song> getSongsByArtist(String artist) {
		return songRepo.findByArtistContains(artist);
	}
}
