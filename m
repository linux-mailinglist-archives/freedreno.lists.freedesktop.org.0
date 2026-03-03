Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI9XDAPspmnUaAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 15:11:15 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF81F1220
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 15:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2B310E823;
	Tue,  3 Mar 2026 14:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQKy2X29";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StzxkHHM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE15210E823
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 14:11:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mgFh2613794
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 14:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EqLIOXPjjHT0v3jLmjFH4RwB
 q1pmp+cieEt3IvpmSaY=; b=GQKy2X29FtuoJafQLP/6CovjyoJe3eV9sTRgxkTP
 7S1hsC89vMn2mR1WHrPPcsjUtn/VkATrlOHrE9+yCUSPkAVipRtWQtIWD0/o4hAQ
 44pD/7Sn/5CdR2wZjJb07SoWZWO3ZIdGIYb8eLS2xANNj+v5LczC0JJ3KuVwE80F
 y4M+4TfFWElWrs0vs63x+RRtMAXtPA7SoaoCnBIM4aCC+xeG1alOibmEeADd2XaW
 s20ziYE7JXB3Mq1e9eqRHNDIXDz/zVqQh7gTi/tPgVtfj0KEOYlvQ/vEdJkoY3gi
 B+nknYaJevhh2+1tWk7THyKYZ4P68cDu/HjemPDYbylNpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxf8un8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 14:11:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-503342386c7so69192151cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 06:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772547069; x=1773151869;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EqLIOXPjjHT0v3jLmjFH4RwBq1pmp+cieEt3IvpmSaY=;
 b=StzxkHHMPFo7FdMdH8ykSw9j2ZyIK9ix2F6V6KqrBYCCbrhrSb3NRfsY4e0mn9KUDc
 8zG+o5nSbb61V4ku8M8rzHCpYiT8PSaC20RKA/Tev4o2aKMuW9Hkqk1MC2GSsF4l5WxN
 9MNSi4irMG3lyTsIY0I0B++miOhOI+IpgEWYI9Eg+Acf/7Vfj9zGTKLLSu535zcrLY7m
 LxKOSFoZW5q12DFvjGkLOEtTTggS2wHK3tKT8qIZzyIhIbxESWdEy/JXgNd78T+LMmmC
 ibM1Yab4tQ3YxxTXXXRwb2itGxsL0tJYi+X6LguQsyrxnz3na9Nb14DDTFzCDpvPoMNa
 Y03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772547069; x=1773151869;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqLIOXPjjHT0v3jLmjFH4RwBq1pmp+cieEt3IvpmSaY=;
 b=L0cn4nQ+ORIv6LD6Iz0M2ffNvLv06A7TKhVa6CBkvUWOzLTc9Ikj/GJuUjhd/AJ0lq
 VniLD1nck3k1bp2QQzbOlolOjFbyDGNmxG5aerygNkPc8LN8jvwM8SnRvKJtZNjq4pgv
 DT1Ojl0/N4rXmeJvjmXYXSxXf/+oJTGY2ng9geCgNDxYCH44qKEOgAJc5u+W/Didk0MM
 gv9DX9qsXodhQ1LX3qA2wrFQClHtcb3efcKcO2DIMNezorGdvXAxV9ZU08BJbz9YgnS8
 gaaiViMqjwgA95cIWsH1O92zSqqmI/1TvQ+kNqXxrjTwmukYV0d8TcXSjUl75p7DJA4+
 kjDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM7LWFRhuVGScjyDnFpHmbxgPQziQM0yubzJ/fs+tb5rT/lty56yJscMuiAJcor8qRYuHvedoPc1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznKW3Rnt3n5Fi34siFubOYoqM7oToDfIvw4VZZQQaFxNyEAr81
 O6XQhqbk41P6T0fGJdNSqkEZnmGJ3ylndMmD9jEN8Y5pHVh4fkyMKeU6mkwzIVXybRPl0ZfY3jB
 vOSInnQDKu0dqILdkAsj7QTJleSEGiV3Hx5r64EZeqPc67VsRyoBJPQszBWmXgTLRGFxt4NU=
X-Gm-Gg: ATEYQzx0RYczsx61xECehz2rG0cj9Z+dsYJE6tGKZAePpKIjo7oAfs7C/ye+YZEBjwN
 G0jTK+0O0V0FBKpFb+reb1qoMndOnJijc8djXtUOdkmVgpI4fXs+b8rIf+RRcNrVOiwJYnkLzkQ
 Z45Qrq5J6g7wb//6DL20DMB7zHfy/aYexU+gHuaVhT1J9JlWfPCuFyJuXt0oiZp43yeWzIRWZIV
 /UFhIpckXXKzpLjcX98u/B7jx9IFua9tHLQr1hxB/VGRf8yXT4UlRjUPvYqz67hJBvesSmSMYX0
 SS4paOMiZwOUZieMGwEEnPK1GjgUf3dIawef82p1ZDHHGjux05uQGOt6tya2quCW5jnMu2LS1z/
 6G5uvoHRFw4h4DNSJveWPtxi/cwMG8im92BYRp3BE92iG7iLxxNTNM+VvJbyCwClTivBw8lxy6s
 hUa81ycQslKtowzekClgcyURUuOfC1FclD26U=
X-Received: by 2002:a05:622a:30e:b0:4ff:c04c:3d75 with SMTP id
 d75a77b69052e-507527cc0a7mr178882201cf.43.1772547069103; 
 Tue, 03 Mar 2026 06:11:09 -0800 (PST)
X-Received: by 2002:a05:622a:30e:b0:4ff:c04c:3d75 with SMTP id
 d75a77b69052e-507527cc0a7mr178881641cf.43.1772547068551; 
 Tue, 03 Mar 2026 06:11:08 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12356ffb2sm605664e87.88.2026.03.03.06.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 06:11:07 -0800 (PST)
Date: Tue, 3 Mar 2026 16:11:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 8/8] drm/msm/mdss: Add support for Eliza SoC
Message-ID: <p7daur6flndawb7a3o72gli6mvkbph4dko7crly3gxx3c2iqbi@3bp4foq7o3po>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-8-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-8-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExMiBTYWx0ZWRfX7yTsFcK7YMFd
 z2FUfOLFcNbgKo1uZKb8YCn7L6w7kjLtX8eJwHkP5c3Q8QI2M7smgomb6ktJSRqeL99Ee5wI13Z
 ZOsTyit3KiiMBlXk6IpIBVs2xQEA4hC28coKbTqs8TaWpiRB/3E7ADKzDL2vQ7mKrYaZDXgiloY
 q5H9hR7JdlTNBOtcjFJukpZ98bU5XlN9c0YRCa/fBke6Sd1k0QK0d6kSfcCcc/LF/xl9pLXXR8r
 QJX0vxemFjibXJbiGFflq4D3fI3uq/ohfwyZOsvBwfECzrSH95M4aKKR62x6CW2gD8VtqaCc3pL
 Obg3wXzhRjC51Fe0aHIKUJ/yVWQpWlqkIIp1AK53W70h70l7sAZW7rCoTZWpzsjVV7p9gye50qA
 z0Pb3c0oA07DtHrOAxHzwL1MUnK9XX7K5HaFxzdXv1CaBnTSL8UzEwtXe0AHBFuAlkmjzEEEaL6
 0g3rvCIfh0Zq1I3YQnA==
X-Proofpoint-ORIG-GUID: E8nxHQhvBw-elYOIQ5NtLI9x1NqwryQi
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a6ebfd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dHc4CrXR-K1SG7iiLmMA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: E8nxHQhvBw-elYOIQ5NtLI9x1NqwryQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030112
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: AFEF81F1220
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:58PM +0100, Krzysztof Kozlowski wrote:
> Add support for the Qualcomm Eliza SoC platform.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
