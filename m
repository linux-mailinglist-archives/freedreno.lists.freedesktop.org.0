Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3334DC7AC54
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 17:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A9310E8E3;
	Fri, 21 Nov 2025 16:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXXDDJ3k";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnMbieVE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0310E8E2
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALDBDN11637279
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oUlgg1pPCRCWpWfC+0yvxR/SY3w+1Dc63OiZieGMkKI=; b=UXXDDJ3ko3ob0puT
 +Jil2HT6VickYGkFpBQ3gs9MGhKNU6vDQIg+5koKpnP19JyjLY9uzULkSsYyR9zx
 czLajeBswWBTc60MvibKWzcl5vr7s+fPome07Iq9a/kGwTehA71+8g1wQsX8eBYo
 1Wq0EXqW/lgX+09QOyC1N27Xrriwo05SWIwCZxLp9qnTZLTPG7jAzbegLHHbXumX
 eCknGuMvdrh+UKjiQA0ZA4MYDRauXZxlC8uWG/TZoNiBBvX4xyCZ+NP4YRn/LgbC
 iG0WExA4tRXCIuQp3Hkk3b5G8495zv/CBCjeWj6AbvNZl2skHa5IXmGgWAhGs3Iv
 lAHb3g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagaua6m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88237204cc8so35898156d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 08:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763741641; x=1764346441;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oUlgg1pPCRCWpWfC+0yvxR/SY3w+1Dc63OiZieGMkKI=;
 b=VnMbieVE6JMIKtdLTu1+Cv6x2F4LROtM650qH0bWsmEfwcTG3BWeogCE1WfBfX0oLE
 g096HFREVw/V/Eo6fCCbPeTntvTBh+l7Wb4dgnmmcAIRz+TUp1U7EWN74w/48zrThpUF
 kiKYoONQ62IdP+H+oGOoF9zq2z1p9QSpEqaqUXc91/EXoFbRQDBtui6zOJWFc9bw+2l7
 l15wYJkhX4X0yrVUDLa+IdnMBHmjE4zgJVhVTHe8N5X6Vf5s/+p7M4B81gD3997+YWZV
 rGLSLTPx7GuksmsdP+EzNbugH9uOVIPNPDA5vf/4CQshu/aoW4588Eqwu/C2FaTti3KN
 x2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763741641; x=1764346441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oUlgg1pPCRCWpWfC+0yvxR/SY3w+1Dc63OiZieGMkKI=;
 b=QpCuZbgVPGbQgq9Tf+fHd3A/uRpXSAM+PGRQKqWlJeypmIcpmV4Xh+LzZuXs01O4nY
 Rc334vSIeLUEoHgLhkHPpoMrAxlMWO7UMVXmXL3+QPUINO9H8WGMlQwwFQfElI7Dy6P/
 5K0jdVhTPDwQwuqKAMzsiZ+3wcrZ4euD9IvEaubUjMbZ9yWlQBi/38D2vbIhU1Ij+kWK
 oxiMtnafpOgoooraS9mfAU/LAXM1PaRpDpylfNYEcAIj58vmH88iqzqwm78pr7uk3ib9
 WkigCaI7XBWJTgON548ojNfsJtITODQ1xqs0YzyOYqqgJ2DR5HEhbnT303WAzxWZqQEH
 uBSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyAvHo7eM5/A3XzhqMwa2VnnUsvYD/oKagZFadLR8Yy31VeaNdhitiaq+hu43453U9Xu0v84GoTBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD7vF5gzqR6fWo+TEz2Yn/Or/++Yctz+pyM2QJ/52bQSOt66uf
 L1V6xVDdNzy63DvkxW+tHH6KNuEV65PI1Aewl4FdsJrGHOxbSJOF/EPJslLfRx7G0N8BhtTpuE/
 33h+XB2vwGlCAWUMS6fzAOwKZ8zYS5RXDYGbWjm2kVEf6FfSPmRE0F6CBTQCR2mPXMfrF+Nk=
X-Gm-Gg: ASbGnctoJQQhoo0ga48dbZdcIS8OhsvqLbwYUJMxCUk8NRl+WmiMAJZAjs4CLbn0h5e
 Ytw8WZndcQ0q6nPd+8lUw98hUcN8PeYGOh+zzIcs35g9J73esTDSUXZURY/G4w7QZnLwM6XYYnS
 1q/W4vrmIz8N7h5tp+StF5SH03s8PrVBgWUfG1rhmfvN61HJS0mcFZwY5Wg2iRdETXbw+6Nhp+2
 4mz+y0ZrJ5BjjQzwsgTd18H0SOViiH55XQ5FxoPf5/4ZHpx/9bTa2ujiL7lL+E0TA6HwHlf6vzw
 GGgfBPQwbtwOUvvXU1eQ1T41D5aRG3fxZiPt0SsSLKyHyUPFedgV0tPJhepWOwNoWIwaP2onk4p
 IFpq+I//jMtUn1bPyLiD2B6qvE1z96mVKirq53mPFJ8lc5NZbmcT+lFn8gzzwUH5KmS4QPzJMFN
 hYT0UZYfgYyKdWHeJQ2555OW0=
X-Received: by 2002:a05:622a:1b88:b0:4eb:a24d:8c17 with SMTP id
 d75a77b69052e-4ee58857093mr42765651cf.31.1763741640727; 
 Fri, 21 Nov 2025 08:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAIs2qyphslDLXjyugoIM1u3+WnSU6pjdnjBnlzJcuugOQIwBcaGVpTnyDZE8HITlUANo9ZQ==
X-Received: by 2002:a05:622a:1b88:b0:4eb:a24d:8c17 with SMTP id
 d75a77b69052e-4ee58857093mr42764931cf.31.1763741640196; 
 Fri, 21 Nov 2025 08:14:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db756d3sm1752185e87.14.2025.11.21.08.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:13:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 18:13:03 +0200
Subject: [PATCH 1/2] drm/msm/a2xx: fix pixel shader start on A225
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-a225-v1-1-a1bab651d186@oss.qualcomm.com>
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wor0QQBjW7uFHNAj5exz5jDPpLBCWgszpFcIUarhCGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpII/DDhToi3FIm5e9ggO1WO2Eeev6bAFVK9fD/
 vvDzsbiVhCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSCPwwAKCRCLPIo+Aiko
 1fIyB/46mSe2/PTw12rhQ0CKyh7vD1D2EZAJbZBsQry1nQPNa7OaMm+VuzTZZaweeq1mSbyoVES
 F0B1HjpLvOOLhyh6HrhyVVQVburZFkT4TkoDstG7xydvnW+AjuUu6VAanFzxfaQLR1If/BmEGvk
 MH9Ea/9ZCbgdYupVpbu1QRMQfQNDLCm/Gt7oWe1LnmgV0YFgC13w8M38x3VmR2vpvtyaIhfdoB0
 r/4rr/tSepRlBFIvz50zGGVyjKA7qMMtrY7epkmaXCu6SnW1r0RA+lJrxdndEcxUmCP6kViAYyz
 sx/IDKC5n1BNPCFNeDJCdGKZH3XpsY0N97sFhU+9Q6dSZLrC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=69208fc9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QU57kMg87Go_-yqhfaEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfX4WcXPXibcsS3
 jssfFcJ0g8Iy5SCHXmkjLx/v4MGw0g9KzyvWvh/E0a9NFZPyajsZFH3TQWETUr4dZIvu+5GUmf5
 U14oCfzTtj+oRm8Vhsl2ul458Vm1eqt3swwzXv0OSRFyrZB4ZvGLWI5U9/3fzVn6Lx3cT4dUikW
 R1nQoGI4aehzx+bVNjkb4SoRGZB41SWi/VMMqudRbbdjIVGDAdtKVHgt2sQPcOMnxK8J2r5Htdo
 bgS5+pYDL0BQD1ZZQ2aUrOfeN+KapXZ9N7jr9kX/iRwyD3/q75X9eTVHrA3ilcXiypvQlNsRRvo
 H/2byfK7kaZGUM5QM4v/rEk80EXvu9uNNtKlXE+49vVqZvVTMHzBpZzDAxrymBLT3KpElT4Ojmi
 aDp7NW8JsPl3sYcqzOxeZtYCX9Rw+g==
X-Proofpoint-ORIG-GUID: muvN8xx1PFNaNRhsH26cECIFwJF67TnQ
X-Proofpoint-GUID: muvN8xx1PFNaNRhsH26cECIFwJF67TnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119
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

A225 has a different PixelShader start address, write correct address
while initializing GPU.

Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index ec38db45d8a366e75acddbacd4810d7b7a80926f..cdc24b3b7b81cce6b01aa14a74bd8e512cd8be90 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -77,7 +77,10 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 
 	/* Vertex and Pixel Shader Start Addresses in instructions
 	 * (3 DWORDS per instruction) */
-	OUT_RING(ring, 0x80000180);
+	if (adreno_is_a225(adreno_gpu))
+		OUT_RING(ring, 0x80000300);
+	else
+		OUT_RING(ring, 0x80000180);
 	/* Maximum Contexts */
 	OUT_RING(ring, 0x00000001);
 	/* Write Confirm Interval and The CP will wait the

-- 
2.47.3

