package owl.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommonRestController {

	@RequestMapping(value = "/FindPassword.do")
	public Map<String, Object> texttest(String email) throws Exception {
		System.out.println("in FindPassword");
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isMember = false;
		String message = "";

		isMember = true;

		// 회원 경우
		if (isMember) {
			isMember = true;
			message = "이메일을 전송했습니다.";
		}
		// 비회원 경우
		else {
			message = "존재하지 않는 이메일입니다.";
		}

		map.put("result", isMember);
		map.put("message", message);

		return map;
	}
}
