Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698EFBB5A54
	for <lists+freedreno@lfdr.de>; Fri, 03 Oct 2025 01:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C8410E85E;
	Thu,  2 Oct 2025 23:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrWQ47R7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3500310E85E
 for <freedreno@lists.freedesktop.org>; Thu,  2 Oct 2025 23:57:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592Mp3PP023327
 for <freedreno@lists.freedesktop.org>; Thu, 2 Oct 2025 23:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PWeX3pwFQajV931yQ8BTkc
 33/7zopEsdK/riLLlmelc=; b=mrWQ47R7piAFE+oAXbyOprIKNRFSpSsulfDU6J
 m02E7BDjNnGccIUWtEOsamyFzuRA5bzM4b7E2WZKxtaqShRz5C8lNJizKSgJq9xP
 HMTxNeBMXXC42akbNZcaQDrsxzwH+g8eKjzFENGfA3YnnnPBkJGITSM3KXRLRO2L
 CyKLSKcWmfoduKOlhPNTS4NiyyN33+r5IfZhXjNzwjFF4Jj1yArImQlRaPudgKMr
 kx7NVmS7ilJvGlncEol4ISklkf5laxDkTQ0Qk6KnLCdteGHSZo+wEmTpCU16UnDU
 5VKlKoeSHiayoRll/x+e0Nn0p7v1geU0kIS4Mfeui26ayocQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a69b6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 02 Oct 2025 23:57:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b6097ca315bso2668664a12.3
 for <freedreno@lists.freedesktop.org>; Thu, 02 Oct 2025 16:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759449468; x=1760054268;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PWeX3pwFQajV931yQ8BTkc33/7zopEsdK/riLLlmelc=;
 b=v3nQlMJ4VgBPfstcwY0ljRxb+IssxOXfLLJTCIuphbdq/BXGjVv1aTPfFlkTibHKt6
 lGJs9NJ90KWkQIWE+cm/6AJTB2JFGaQDK1d+bwTeYXPNQ85rEvNHNCt9GCqG2I+2jwco
 UrKwVM5VLRHKkHx16XxNefDxjsx4f+pS8fXgtTMKaceOZzt1VXZdrr3DFjyE7RUJDjJ7
 rjixwB1K5wqqRykGL2CE3p3gwQ3Tn+REY+hcJdzQpI7e5cYWk+yzp35JB+9IUsiaEkLT
 2tg0N2NiDfkOma0GJVJgIqKOzwlrSWBMt+EpnPHOTec1dW4RaRupt01W5rfLh1YhABst
 1Fmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMBPS9Ru1rKoscbX34Q1ymZrNXXGJyr3A4xMhD8iYh1ikPTp2E46Dm9O9dC0/VAhBFVwIJWbFGrvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKWhwQtG8EsEbnU+EGrnBLv2kdEhRzYhETArRVYsH1xXvndkLL
 /3FyrNUWZ0PxaA+h+0RuD186H0NRUdpX2gaNW9nrLrMg/BJHSuoC6tlKqRLq1UDRvYvoIfNtPOm
 5Xdvca+roVb6qxskgVTY4F43YRTJUDvHPzngnEXcPGnh71hhZgltKcEja+MzlQXTLUUXq6sI=
X-Gm-Gg: ASbGncupxj2gb84FY8uAthiR/+ynuUZbjuWmnOd/bGXksdwlUJ6h1QMTBxmt0p5V1ut
 NqugV0LDp410QtoUORlZOgwyUYeKL3C+UM3Kyl4ayacStAR68dTlSr7pVv12U79+iUVwXAaeEP1
 rBuxocYgHuBJwzt8/Gr6JG6RdwsyqJltvatcVr94pJPHxJGNw/ZHlGYeqqEvz8fqm/Ms/bM3sNA
 TXz1AIjSxB7I4XuYeACT8+ljNM7JmEl58eUhten6dgjGvnGV67M/SFvuaW5kTt4ArBkE4sCdhdE
 svPxW9b5e/d/Vb46U1sCKLMorbAtGnV6/qgYsoHrIsz/07M4Jt41qK724Q/Fl4/jeUpwgVBZD1s
 gqCqKD5puRx9dUjTJGd8jrjB1G25/FA==
X-Received: by 2002:a17:903:b46:b0:28e:7fce:6685 with SMTP id
 d9443c01a7336-28e9a656975mr10213375ad.32.1759449467812; 
 Thu, 02 Oct 2025 16:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt+w1yH8tjJDlpzM77QlJgNO6+lvwpEnpefV0xzKNfgoby5Ecn/s4spLV3aQXIHkcWmUi6rA==
X-Received: by 2002:a17:903:b46:b0:28e:7fce:6685 with SMTP id
 d9443c01a7336-28e9a656975mr10213155ad.32.1759449467361; 
 Thu, 02 Oct 2025 16:57:47 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1b845bsm32064985ad.79.2025.10.02.16.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 16:57:47 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 02 Oct 2025 16:57:35 -0700
Subject: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG4R32gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwMj3cLSzBLdwuT8XF1TQyPTJDOTRAuzxEQloPqCotS0zAqwWdGxtbU
 AfC2RVFsAAAA=
X-Change-ID: 20251002-quit-qcom-5125b64a86aa
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759449466; l=1286;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=bgT3hSLAPpI6ylw6xIFQ0tOWQoAvzGbHmZph6BNaMVI=;
 b=l8iBum1BMYFVeRyUUElwyPpEZN2AqzHaItOorjlKbFsSKPlE/Wlbl3eMGu6V4Bszw4fBeLeAO
 FXoo6kQLfstDYB06w7tBX7xdwDLo2BfVlqwff9d5pHGZxwUF81ZnY8P
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68df117d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=KKAkSRfTAAAA:8
 a=69LWc1rl86c1DZQ69rIA:9 a=QEXdDO2ut3YA:10 a=2MHBSq50hwYA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5ri-sSojyxc_3-NH-PdfJcjbAmc2_7M7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX8gZCpN7/34f0
 O7ROD+x1HMgbUF4SNy3a6Z2YLw/TaFhbkLFi1H2RJFI7HxQL177icpg50GgHcurUghvePUVRE+s
 nPe7gCnmxNPNW8h/pbRriOjqhw4tnxXZAO4CumnO9WIlBiHoOXqpdz5haInNgcwOF8mQCM7Qt/i
 TvtSJpMmnqfMmjkeaTb4vaA/OCPEzsjY2AJLz/1pBR/LKCZYYOTzsUQ6WSkrsciSkLzGUWo5yCE
 1BxPY1rFeL6N1yNLr131rYrJJvwhuG+tfYwDUzH9XSQaZAX3Qa9qaS8/rpKCSYIl6h6Eflqeo3n
 Pcc+r2JHqlWDboJRtf9gF74GUTX4RYaKLzlSSwcXZrGuXfwa7SVrsvwcziZGyaljW2/2p9OU2Ls
 KRZ9v0s43vg2cWsIK0+Y8RIlFD5ybQ==
X-Proofpoint-ORIG-GUID: 5ri-sSojyxc_3-NH-PdfJcjbAmc2_7M7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
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

My current email will stop working soon. Update my email address to
jesszhan0024@gmail.com

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e7515a412e9..7a712ded8f9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
 M:	Rob Clark <robin.clark@oss.qualcomm.com>
 M:	Dmitry Baryshkov <lumag@kernel.org>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
-R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
+R:	Jessica Zhang <jesszhan0024@gmail.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Marijn Suijten <marijn.suijten@somainline.org>
 L:	linux-arm-msm@vger.kernel.org
@@ -8325,7 +8325,7 @@ F:	drivers/gpu/drm/clients/drm_log.c
 
 DRM PANEL DRIVERS
 M:	Neil Armstrong <neil.armstrong@linaro.org>
-R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
+R:	Jessica Zhang <jesszhan0024@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251002-quit-qcom-5125b64a86aa

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

