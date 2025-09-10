Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68998B51580
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 13:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4026D10E2CE;
	Wed, 10 Sep 2025 11:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwfUD00L";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306AC10E8E7
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFEWH012468
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gt3lMrqxrsh5HFvqVveVdKW5qqiAGEIrNSWV3HoZYpQ=; b=RwfUD00LFWtG3E6I
 qKtyTpK4TrrkwOlzlHuWsp++82VkijRFCSQvCmJddvXXATjlU+h3uIzB6pZsxbRC
 fYYHhj28oiWAfiiQFMeVSDMZ7dozANHrVlGmLGMoh/Nd3j+n90/+6tlUujQ6xHDz
 styoXDDMymUjx9dZGHlS11AqskLNnd3NBFT8mmoE9jKDVf+eFEI9nxvdNGlIgS/a
 vErf1RZUznb/WyfpL0HTZvayy5T75hHKMoZV4MbYDAedpSsLWX7iHZjO8PLzVrBq
 nzcxj4gTs9x3eVCuZLGkx0tgOG9qBCvptcGGObZxugE7BOgrW/csjBCm3hgqYFFK
 2QFRSg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsbsjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-77241858ec1so6492555b3a.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 04:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503571; x=1758108371;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gt3lMrqxrsh5HFvqVveVdKW5qqiAGEIrNSWV3HoZYpQ=;
 b=FU2esBGeGW+NVOXtwcSyfcLUAqTCNQOreO67xULwa9uxvfCNW9rU72zkqAcp9UlO1q
 9/Fiao1l4bSpwD7bpq6t8rAxVvb7547zNDeZdOUhrjE98KuxYmOkLoLuhnhEYbnpKsxI
 nBfCCAdjgYUtQ3465InWPSWpO4SkVwMwVp4gGW4853RyJ0z1dvdWn48LBeNEv/WjGPN5
 W22o9ECyPzHl5Mpw8i0A4XV/+cJ+l8+hpKXJd8zDVeVq52V0oeG7US8lGF7GVEGqXX9Q
 kil0jCK3ZKtgkmSgmiulXUhmWrC5ep0e65MSvSDuZjhZ2uIkaopW4pH3sGpxRi5yv4Ex
 RrqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDuzveuRCJ/tAwYaGs/xp4dBj0rnibPt0/IKj3dQCG9ZnWYTyM6RNApwk9hqUy/JLdH46DkaEdWcU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/PMf/Us6l87FOyd4hiUtm2ZHlVc00ueFKuVzQRxGorYkpTlKv
 qGByorI4y+wUIWqcVIpaU1SrIPisE9KP6HrL2Ued4NmX9pgSNNMngdqCzrrThNvW7olsrAOWcgV
 azwLbh8vc6Md0g4WxWoWACN/vclymk2cO0eSmszt+wLtW8fH3VVGA7CBd2ZIaJ1mo5ugJnfY=
X-Gm-Gg: ASbGncvOCKJF2S16oFvNeSMcpP2OcHFBsNYqo1ZTRkLnfBcCW5XX+rlckydEeSOOSIR
 MmeuvdWAEJ3dITEUCQ+K3W3hHqQA4KiJPnhoS6Djk8ysMHyjYZKfZjUfTmEdnUNkcCxgPJdL8Ut
 oynnbE0vINg5x78/u22ah2FPSsPSIvWqtWEKMzjRdRqSlcsuISRwaoNTCgA5KmjofP7iai0qe0k
 WjSn3t0dx/b4nClJzrA/lWi87JVpWu9wuAHTZPlHiV7ezJV5357v6cU4PuAJZqDzN5J8f0syNNi
 KWW+zKQmb92islsu4zND0ITLzGRvz5Iywhe5j1K7iOr/tx2TWGYQ22+Z4sKvafYs
X-Received: by 2002:a05:6a00:14ce:b0:772:3b9d:70fb with SMTP id
 d2e1a72fcca58-7742ded7359mr21704541b3a.31.1757503570724; 
 Wed, 10 Sep 2025 04:26:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL+jXRvCFnuy9K5s7zAAadG0Sf39RWmu+cwoO05ITAyVd+5McQwptiwhwv3oQ8fuawRfi01w==
X-Received: by 2002:a05:6a00:14ce:b0:772:3b9d:70fb with SMTP id
 d2e1a72fcca58-7742ded7359mr21704478b3a.31.1757503570177; 
 Wed, 10 Sep 2025 04:26:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:26:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:21 +0530
Subject: [PATCH v6 1/6] drm/msm/adreno: Add speedbins for A663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-1-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=uzPVmN95UYA3m4eO5APKZbdkhOvUBX1OERZwHXJ9QPs=;
 b=U1kGtdA1U9VR5G5dL7kDdE3dQA4lZ77QOfk2JkSYOMau99SLXDF4cj/W5i6UUvvnnF1JCd/cA
 NOgMg7nJzKUCKhcldklSwobxAc4fXE5pFPx13Sljlvxso5+uZn5kWOc
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: uZys8AtL2QCCJjpLWCs_5gLEGZGfRFdS
X-Proofpoint-GUID: uZys8AtL2QCCJjpLWCs_5gLEGZGfRFdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX9KV2UsJB7XVk
 dB9XHBnYZlR2O+Ck/E6OQYE7OJ9RDUyRaPDAW/ntbWIyH/M2qdSNMyUVldn9gLe2d3PURLF3kCS
 X+IkOcvSxoRQII6mzHw6JtM6KabsJ12PWE/n7NoFyLqIlxFwcXnhT5YbDTnzc1yqgW4+fvMD5Pb
 J/ZPT+ZoRpf6G1/hp9Bhu18sMMk+UvqCQc55i9YrDO2MEtelBSbs4WrcZyueIMXwtR4DNXahJ/b
 Cxgg09nLoPV9aIeBFLpN41EiSFuDXJr0jAtu0w3QNNb+BPqBt6bkWtiR+MglkjMKjamxBFCe2xx
 Un+u/mwYHnZVtn8tzZmH0yC4F907oYb2PUMkWFaEy0qQcFsu9eVTl7P6KoT8wiVEzfDmKAVHrAT
 fN4gMwuf
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c16053 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=92do0itG5Mw8xxZS-WcA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

Add speedbin mappings for A663 GPU.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..2b1c41f6cfeee912ba59f00c1beb4a43f0914796 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1024,6 +1024,11 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 169, 0 },
+			{ 113, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,

-- 
2.50.1

