Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MivlKKxUm2kVyQMAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 22 Feb 2026 20:10:36 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1B170213
	for <lists+freedreno@lfdr.de>; Sun, 22 Feb 2026 20:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B33110E1AC;
	Sun, 22 Feb 2026 19:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3OJR1dV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHS8J/FR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581A510E1B5
 for <freedreno@lists.freedesktop.org>; Sun, 22 Feb 2026 19:10:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61MGIsdN1713872
 for <freedreno@lists.freedesktop.org>; Sun, 22 Feb 2026 19:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Im8dZPlTzIiexo0trrH/fN
 RgOoF7knAn+6x2gD7kMBg=; b=I3OJR1dVApUGUYSs8CXmndUay51duEDEzI6fp1
 PNnZu6+iZ86sP2n4Tqa0ywR6ZXmwoezD/bx3wgyfys7+YNwK66dG3VPpgMoHrSa4
 df+sYD1uHDlz2hbNCBFFojqOCsX6u0BS6Q8HedHJ6mzdbC4uhTVpPYfCC6LWANeH
 l4Va5OrmkCwWaToHdd8fhtnSoF6vW69OGjOw1f66K+ywpzOtJDemNoG2VbhW5sD9
 G7p6Jdi8CVR1W3DQETg+TLGttIzkRG4fmymUDrsmkczlZ3fSfxJUJXI9rYcslkWs
 JsixPJaF9iRW3eyAC56n6LScTXlVfH/OBmPB7svhRhmApGDw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wytjun-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 22 Feb 2026 19:10:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a8f8c81d02so48273925ad.2
 for <freedreno@lists.freedesktop.org>; Sun, 22 Feb 2026 11:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771787432; x=1772392232;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Im8dZPlTzIiexo0trrH/fNRgOoF7knAn+6x2gD7kMBg=;
 b=SHS8J/FRh88/buWeElvTWTsHbSfU9NM2TeKTidpg636tCy4jVPqgYuUKRgVGp5ZRme
 M67sTwtMaGrCy1nDHanH5KOACJMQG0rHLyIy1wts0kWEGCBe0KqOqT/H3y8jomN11mTJ
 xGkB01PuPY9xSpU8Q/SFcrWwZdIen8w0WPqTmxAUeqIoAMmy9UXCtvghVPVgLd+lSB4i
 WIspzOGpzPBi62xRn+6++j39g9CndYibTvsbE3vlWtthDx7LZNzLr9VM/bJz/Gdd4fOX
 lqw7jJ13ghustRsk2s8EI135H3/OSrPDUetR3/YMjcrjJmcY747Ly/1+sf7Hw1n4tX5G
 Skaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771787432; x=1772392232;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Im8dZPlTzIiexo0trrH/fNRgOoF7knAn+6x2gD7kMBg=;
 b=mW93FXlbyUYW1d91RLjk2MOHNrSzSW/s/LIL4OxhmWW1Wacx4fCSVKRE/MyCMw2GhA
 0knefEuMAWIgGAMLbUXy8xkND4YiD6c8plK9Y2qx/ZNx3k813BeX3kCWSyOUyn+goHzn
 fEDkU0pqlZCc9BSrT/jQNTTqBQfNCSkaCzCLdkYeFKEd/5ZyzR+fte5SUXTXwFJswGKi
 MmNchkefmR3TIXEFoQYU2KVrAtkpKFDt6/tni6RAI4Kn0kehYlBBx7tNxIvewUsn1XjC
 R56Q1v8f3Tl8RJ70SG+Yet6mQYv0gZUxCPu8j0ZkM+Ea59gcXKFMFlVoZRPBIa09IhYO
 j6rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi1P86Hgux74mbGziVCVGp5Jy70ubYRNWi2L9v0xnmXiT41HWUbYLJcyyYRt42AwwSSRV8Uz32bcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjtBJ/sctKWaZjNOFT5ybAHDsWIM6zFTPlKKDlKLcuyG/T88u9
 c4tubUaqKypEapWDvPzuP65OontkwhJ4r5v4o2r0BPwsU+fDGqEj9ydvhhNoin0wYVzRx44+vVE
 5R8TKRP0iF5QKdF0RNxQFdHhjOYkRzfjXZNewR882ab0C9APIV+jvBGye5tGM3cm2q/0gDj8=
X-Gm-Gg: AZuq6aIVjejYbAhRVaFbFoat7Jd9XxQanKo0spl3hwrMwb3rsK9lC9G1gjBybMJrRT/
 j541bpKHiqoJZnhAnJwp+pVZu7MDzFlRUHntRDfRoLvTwIG/TPyatmGn7HDzwIBlMUwTp5zuevq
 olbarqyOw/k56XHylYBDfoBItXUJNMA/fH0vbmtEeGbBbYJQHONj2U94ei1lWT99h6/SY1AFYAN
 vGlypl6xcrNBG63QxWCryBl0+S0/5wDJJr6R36tsI8Gls4mwZ618Q5LjSirNsyUl37kawd/wfm+
 e65/tosih0prWt664v+FQtG3WTAzheQ0D1k6QEF6FTGkC4deeNd0C9i1Lb0CRCsdd0TlmDvejXs
 wfQbdqV9Bfo03tXnjwMfjjMaC1Jjz+rzBYXJ4YCjXq7M6IXrF
X-Received: by 2002:a05:6a20:6f90:b0:35d:c68e:1b07 with SMTP id
 adf61e73a8af0-39545f9cf9amr6098249637.54.1771787431838; 
 Sun, 22 Feb 2026 11:10:31 -0800 (PST)
X-Received: by 2002:a05:6a20:6f90:b0:35d:c68e:1b07 with SMTP id
 adf61e73a8af0-39545f9cf9amr6098231637.54.1771787431388; 
 Sun, 22 Feb 2026 11:10:31 -0800 (PST)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70b71810casm5249651a12.1.2026.02.22.11.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 11:10:30 -0800 (PST)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 00:40:10 +0530
Subject: [PATCH] drm/msm: enable separate_gpu_kms by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJFUm2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NL3eLUgtSixJLU+PSC0vjs3GJdS3MLc4PkJGOzxMQ0JaC2gqLUtMw
 KsJHRsbW1AJBnIhhiAAAA
X-Change-ID: 20260219-seperate_gpu_kms-97870cb36aaf
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771787426; l=1614;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=6hOyKvhbzrucOjvQeqbe4yQ/FaIfwLLcQFEZoxqbF4A=;
 b=90EVBPBr3Uc+gAd2gg8hoT5LUmwmbqpC6Y5RskSs/5RMx0bBTUShAR6f2sFKRqB4RvwWW0Cnn
 f2irSV5jiHLBWEdITo/cIU8Bxibj16MEFAcKJIuMfT/aGVY58pzZPCX
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDE4NSBTYWx0ZWRfX00LWsNV/vaVs
 Zdk1qpmqL9GgRlYjOX4l3JRec67BobymGrtSRJmnPfKW0/fkgrKXHZB7cMNrZjjaPXs0qCT6Eb9
 b7W9OsZgc2D1qEtHkJpT6izHir3zYn/d869N19IDeG+FsSICq7RUUl2u6kkE3PXdTcCgvwDaxlX
 2pW0bO/4RZDbb6wzW+u3hi6Fe4Kye+y+F5A4ur0PbzyGHMIACJ2vDTqOQzb0tmPvrJ/tlVVOAAt
 NNnn9T45jIXHIwN8YuMEXMGobnE3pS4k74pf42U8dvJen+5XRhNUYOhxlNpt4gC9OmI6RkmRS58
 VvrdK+Stcn0yqhlP01AP+Mb8RMP/mNiS5yeRhnu6H+MvAwSLglFkWJsw9N8zRw56DwBKJKW4bps
 92Ct3Aeedko1Id2EgA24ip6pBakKcaraOrvHVq11t/kldQkvQaJjiU5IPSoUtUiyQPKMFbrI4sG
 r94wF7vFc0xROzmMgQQ==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699b54a8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L7USXq9lOa_sdtJDxDQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _CuYyhotjdpJK8f_iNEuR9HPx0Hickkm
X-Proofpoint-ORIG-GUID: _CuYyhotjdpJK8f_iNEuR9HPx0Hickkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_04,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220185
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mahadevan.p@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mahadevan.p@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 08B1B170213
X-Rspamd-Action: no action

On targets with multiple display subsystems, such as SA8775P, the GPU
binds to the first display subsystem that probes. This implicit binding
prevents subsequent display subsystems from probing successfully,
breaking multi-display support.

Enable separate_gpu_kms by default to decouple GPU and display subsystem
probing. This allows each display subsystem to initialize independently,
ensuring that all display subsystems are probed.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Depends on:
	https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
	https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ed2a61c66ac9..65119fb3dfa2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,7 +54,7 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-static bool separate_gpu_kms;
+static bool separate_gpu_kms = true;
 MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 

---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-seperate_gpu_kms-97870cb36aaf

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

