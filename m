Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05686B30262
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 20:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE3710E38D;
	Thu, 21 Aug 2025 18:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5m7PP76";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E27110E294
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9Bjn024109
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b2aaGGi9vgh1ezkBA9wTuECFddorJT4shW0GuOItXNs=; b=F5m7PP76e/eiqROC
 vH9TlsXcBMa8M91NDemycmNCAihQsQLASWEUqCp2o0y2hohDkUdhxUQx2zKT4uqe
 kU8cjQB5PsR4nEvu6hQJAnmzhHLDNX8KG+PXeCoY2kbLfu13JzBr7U4/C7KynRHO
 9DDygMSCV0AuBdA0y04UTLCHFbKYlyxM6sUKzdo3zMQOLz43Lqzb/xS46JJY5pav
 5g4IJ3Wa2zmxuVgy3W5FISh/bzXr6vohl8DNmkaPLKstKXS67hXF36qCeqh17dCf
 8PwX/OYICINDfKkAZekxKU6I7jvLE/uXF3pwMPnc+eImw1OoDrsPqQpLFzAJGCbv
 twpptg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528xgt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2eb47455so2604880b3a.3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802578; x=1756407378;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2aaGGi9vgh1ezkBA9wTuECFddorJT4shW0GuOItXNs=;
 b=m0yZaVcyYgyVx7BELKv2ake7nM6mgxl8uNlODNzYUr+gCMfzKE3r/OFg8JPwG82wCR
 jM7lZnPdO/GwbVOrBXAnwSHH6/Si9zWsNXkt7BIC8quivHPNdF4VQ/VugUMQkPy9rIY+
 /+f6hEW9A2P945eVhBYm0QUIrtoudQrLyBU6tWWlXSirAUgm34x9TzR2odzsA2g438nu
 VaGxP9/7R/6lHPSqG+5O4cPj3MuoaUL78uXbrnbFhcmPOPJ3k7igzTXbpkNefFUw/TyH
 dZ65ipOlliIyEadn2DuV8YQRau6M012WfFUMWZRgS355FUOXfFjiyOKJZ1S7enJydlz+
 4EuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw+ST2tzzETlxT2/yPCp8kYLV5XLuAfRwC+pumHYdSFogolf5DcqIwzpUzhGDA/dBHhGFI+YxdFvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP4C6q7IBCc8OVcshCqKeCuWFbUP7xNJkOzHX5qtbeG12jIjF5
 h2Wt5jfP4e7KNjUJzXYtUCr+9/8W6JSTeIQ6HYryVIe9XL/El/pD9sp4sBynwNbI0Wib9kvA0Ai
 J7Lb88FqpRs5750JxZeXHwFDbXjejj9Pz5+2UA4XrCepo2oOr7QWXtvRMoy0asp4AMcDdPQbh50
 gCAzU=
X-Gm-Gg: ASbGnct0fFuhRFzQHjAMe1+DPMubsbSEF36haAeK6/VGe9ZuFQLqbw7Y2au+qwxkaOC
 wYN4XXDfZrO6jpNFuqS8SGbtOPi3D/bSwB7ohyNxeAHGvGVKwqSxUiDuwl9xLtB2tequDV3wodZ
 PrDKuMQC/5vqvgFUmPyKMi0TIPJdPl3AOLaPS49VRVHc0WhlRv2UVjI8NrQu5GSHOEuMtGyp5kp
 UOz+aXR5ZLaoI7HTtILoen+lQZsFGcP3PQEcnVWiTSyQQL2Vw+Y0sr/azfc6s1qGSHmP6J6ibIf
 3yODKzcG4OpAes5wjzP98aH/bZCzwTRAAcDhoO3mhaXqCIJfPx4SGyRqhcNJO6MW
X-Received: by 2002:a05:6a20:a11e:b0:240:1bdb:bed2 with SMTP id
 adf61e73a8af0-24340e1c5e9mr249966637.32.1755802578303; 
 Thu, 21 Aug 2025 11:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/PvcztiKQ3+ysLQC44wdzL2nnd84bffnnBw7HXxvb3QajRBbw4ri6k6aeKp1I8dqHAddoNg==
X-Received: by 2002:a05:6a20:a11e:b0:240:1bdb:bed2 with SMTP id
 adf61e73a8af0-24340e1c5e9mr249926637.32.1755802577894; 
 Thu, 21 Aug 2025 11:56:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:26 +0530
Subject: [PATCH v4 1/6] drm/msm/adreno: Add speedbins for A663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-1-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=831;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dh5yRCCrqgo7ITPRxOGs22CFdqaavTKFG8dmxBRd41I=;
 b=/5kTakfykQ3AmdnUdoMQ4AB9+wrpS6Sg4icxX7Pn8G4w06qjqaLrqdMWxoFfR2c6gCf1yXHzU
 hcJfMlyo44VADh1a3HtlGxlKxaAgKW+a2+/QdkolNcZo5tFG1ddh8Ea
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a76bd3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=HtRe1b87dyxWHwbGPHEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: _cmNY1xUL6rFHYdj_1bhYNsJO2MCrZ0L
X-Proofpoint-ORIG-GUID: _cmNY1xUL6rFHYdj_1bhYNsJO2MCrZ0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7B/9zxCa1jIr
 7XYA53aQmiEiZKGbO2Sen+8Wf8mf+gOoe7KyWKlSROGLN5w7wJsGXsDTdeYYZ3sNDqtbNBxwn1Y
 FSBTIXp3kjvg4eDRnJWjyJTia4EY+heKYI169sj1e9iQQVMiq1PjcjWVEYENBfNsMvq76vO2RCd
 utx3nSNyNED535eULhXx3lt60Qch9HW15SVIa33kTaPzWma7q2ex2XeRSgXx/WttLlIbzlVmoY7
 zx+3php2S/TXtA7TGvjBuKS+X6U3VewqcZAllE/qf1rCyslnCztD/ZQLCvmqaCKir1PuNL9WRPv
 NXozT5oxHP2jvtkZuiLYtTJiASL6WKWh5QxqW3jXpkTbs19Vjkw0mxOW2XT0m2doISmXkdhrYdv
 +2vroL7NqmWkaP/k4N+voZJsKdaYLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

