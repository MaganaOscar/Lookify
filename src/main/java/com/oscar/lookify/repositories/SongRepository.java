package com.oscar.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.oscar.lookify.models.Song;

public interface SongRepository extends CrudRepository<Song, Long> {
	List<Song> findAll();
	List<Song> findByArtistContains(String artist);
	List<Song> findTop10ByOrderByRatingDesc();
}
