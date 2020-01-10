package com.owl.member.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.owl.member.dto.Member;
import com.owl.member.service.KaKaoService;
import com.owl.member.service.MemberService;
import com.owl.member.service.NaverService;

@Controller
public class LoginController {

	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;

	@Autowired
	private KaKaoService kaKaoService;

	@Autowired
	private NaverService naverService;
	
    @Autowired
    private GoogleOAuth2Template googleOAuth2Template;
    
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;

	@RequestMapping(value = "Login.do", method = RequestMethod.GET)
	public String showView(Model model) {
		String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        model.addAttribute("google_url", url);
		return "member/login";
	}

	@RequestMapping(value = "Login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest request) {
		// for test
		request.getSession().setAttribute("member", service.getMember("qqq@gmail.com"));
		System.out.println("login");
		return "member/main";
	}

	@RequestMapping(value = "kakaoLogin.do", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
		System.out.println("kakaoLoign");
		System.out.println(naverService.getAuthorizationUrl(session));
		String accessToken = kaKaoService.getAccessToken(code);
		Member member = kaKaoService.getUserInfo(accessToken);

		// id 체크 후 db에 없으면 insert

		session.setAttribute("memberName", member.getName());
		return "member/main";
	}

	// kakaoLoginCallback.do
	@RequestMapping("naverLogin.do")
	public String naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session, Model model)
			throws IOException {
		System.out.println("naverLogin");
		System.out.println("naverLogin : " + code);
		System.out.println("naverLogin : " + state);
		OAuth2AccessToken oauthToken;
		oauthToken = naverService.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		String apiResult = naverService.getUserProfile(oauthToken);
		System.out.println("apiResult" + apiResult);
		model.addAttribute("result", apiResult);

		/* 네이버 로그인 성공 페이지 View 호출 */
		return "member/main";
	}

	//구글 로그인 Controller
	@RequestMapping(value = "GoogleLogin.do")
    public String doSessionAssignActionPage(String code, HttpServletRequest request) throws Exception {
        System.out.println("나 와야해");
        //RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
        RestTemplate restTemplate = new RestTemplate();
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
        parameters.add("code", code);
        parameters.add("client_id", "266293759218-1i2o19cvv8p80i4q4a9q94d1dner0ksg.apps.googleusercontent.com");
        parameters.add("client_secret", "Rr4CKVJVPYVDbTlxEkP2LY-K");
        parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
        parameters.add("grant_type", "authorization_code");
        System.out.println(parameters);
        	
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
        ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
        Map<String, Object> responseMap = responseEntity.getBody();

        // id_token 라는 키에 사용자가 정보가 존재한다.
        // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
        // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
        //Base 64로 인코딩 되어 있으므로 디코딩한다.
 
        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
        Base64 base64 = new Base64(true);
        String body = new String(base64.decode(tokens[1]));
        
        System.out.println(tokens.length);
        System.out.println(new String(Base64.decodeBase64(tokens[0]), "utf-8"));
        System.out.println(new String(Base64.decodeBase64(tokens[1]), "utf-8"));
 
        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> result = mapper.readValue(body, Map.class);     
        return "member/main"; 
    }

	@RequestMapping("Lock.do")
	public String showLockView() {
		return "member/lock";
	}

	@RequestMapping(value = "EmailConfirm.do", method = RequestMethod.POST)
	public String emailConfirm(Member member, Model model, HttpServletRequest request) {

		System.out.println("emailConfirm in");
		System.out.println(member.getMultipartFile());
		System.out.println(member.getMultipartFile().getOriginalFilename());

		System.out.println(member.toString());

		String imagefilename = member.getMultipartFile().getOriginalFilename();
		boolean result = false;
		String viewpage = "";

		try {
			// DB insert 해야함

			if (!imagefilename.equals("")) { // 실 파일 업로드
				String uploadpath = request.getServletContext().getRealPath("upload");
				checkDirectory(uploadpath);
				System.out.println(uploadpath);
				String fpath = uploadpath + "\\" + imagefilename;

				FileOutputStream fs = new FileOutputStream(fpath);
				fs.write(member.getMultipartFile().getBytes());
				fs.close();
				member.setProfilePic(imagefilename);	
			}
			
			member.setPassword(bCryptPasswordEncoder.encode(member.getPassword())); // 비밀번호 암호화
			result = service.insertMember(member);

			if (result) {
				System.out.println("여기는 true");
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				Map<String, Object> models = new HashMap<String, Object>();
				models.put("memberId", member.getEmail());
				models.put("name", member.getName());

				String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngineFactoryBean.createVelocityEngine(), "joinTemplate.vm", "UTF-8", models);
				messageHelper.setSubject("[OWL] 가입을 환영합니다.");
				messageHelper.setFrom("bit4owl@gmail.com");
				messageHelper.setTo(member.getEmail());
				messageHelper.setText(mailBody, true);
				mailSender.send(message);

				model.addAttribute("mail", member.getEmail());
				model.addAttribute("show", "joinEmail");

				// viewpage="redirect:Login.do";

			} else {
				System.out.println("여기는 else");
				model.addAttribute("show", "join");

				// viewpage="redirect:Login.do";
			}
		} catch (Exception e) {
			System.out.println("이거 에러..>" + e.getMessage());
			model.addAttribute("show", "join");

		}

		// model.addAttribute("show", "joinEmail");
		return "member/login";
	}

	@RequestMapping(value = "EmailConfirm.do", method = RequestMethod.GET)
	public String emailConfirmOK(String memberId, Model model) {
		service.joinMemberOk(memberId);

		model.addAttribute("show", "joinOk");
		model.addAttribute("memberId", memberId);
		return "index";
	}

	private void checkDirectory(String path) {
		File file = new File(path);
		if (!file.exists())
			file.mkdir();
	}
}
