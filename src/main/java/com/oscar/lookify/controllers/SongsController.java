package com.oscar.lookify.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oscar.lookify.models.Song;
import com.oscar.lookify.services.SongService;

@Controller
public class SongsController {
	private final SongService songService;
	
	public SongsController(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> songs = songService.getAll();
		model.addAttribute("songs", songs);
		return "dashboard.jsp";
	}
	
	@RequestMapping(value="/search/", method=RequestMethod.POST)
	public String searchArtist(HttpSession session, @RequestParam(value="artist") String artist) {
		return "redirect:/search/" + artist;
	}
	@RequestMapping("/search/{artist}")
	public String showSearchArtist(@PathVariable("artist") String artist, Model model) {
		List<Song> songs = songService.getSongsByArtist(artist);
		model.addAttribute("songs", songs);
		model.addAttribute("artist", artist);
		return "showArtist.jsp";
	}
	
	@RequestMapping("/search/topTen")
	public String topTen(Model model) {
		List<Song> songs = songService.getTopTenByRating();
		model.addAttribute("songs", songs);
		return "topTen.jsp";
	}
	
	@RequestMapping(value="/songs/new", method=RequestMethod.POST)
	public String createSong(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if(result.hasErrors()) {
			return "createSong.jsp";
		}
		songService.createSong(song);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value="/songs/new", method=RequestMethod.GET)
	public String newSong(@ModelAttribute("song") Song song, BindingResult result) {
		return "createSong.jsp";
	}
	
	@RequestMapping("/songs/{id}")
	public String showSong(@PathVariable("id") String id, Model model) {
		Song song = songService.findSong(Long.parseLong(id));
		model.addAttribute("song", song);
		return "showSong.jsp";
	}
	
	@RequestMapping(value="/songs/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") String id) {
		songService.deleteSong(Long.parseLong(id));
		return "redirect:/dashboard";
	}
	
}
