package br.com.pub.controller.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Pub;
import br.com.pub.service.PubService;

@Controller
@RequestMapping("mobile")
public class MobileTeste {
	
	@Autowired
	private PubService pubService;
	
	@ResponseBody
	@RequestMapping(value = "lastPubs")
	public List<Pub> lastPubs() {
		return pubService.lastPubs();
	}
}
