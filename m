Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C66C4800D
	for <lists+freedreno@lfdr.de>; Mon, 10 Nov 2025 17:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1781410E2D9;
	Mon, 10 Nov 2025 16:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pefX5QbF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8Mgp02T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B0310E2D5
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAD0w773676827
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=; b=pefX5QbFhFPxMWvq
 WEqX56c2bZF/NoxpQmnZAWt+Lkl02FkvcTAAD9ENCMOl+gw+syWgArhpcatRaVhz
 OsLx3+5UGGqGP6R4HIkcKSErnvRAi9C70jhwOWWFmsthUI6n+4BodjkgylCjZWjg
 JV2sBIsricxd2Jzi/iKtTEPxeq3fLTh2m7UYRvGVEyntoCWkYNiqJ/T/9J7nS7l+
 NUBP0qlH0EIDVg1pCVWKs5ZgD7c+WZGYCqgLV0kjXGXC/JJJRdLN2fI1ybHHiJKd
 cnTnG14zAxscCkqswdUccF4fNv5g9EUmqg49u8aCIgtxvTM4IQKoxvcbuAiVodIc
 JbU6lA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abgjh8py2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-340c07119bfso7880803a91.2
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 08:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792704; x=1763397504;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
 b=H8Mgp02TOH5XIW1xMuCC70610BxM5isfgV6UlT7f8U5LWMy/5AcUGz0DpAh1bAmb+v
 dUqMDIqTX6r2tiom61p3os11yk4A6EreeOAQqx3+zBInjXCFWTEJMKWIn1q82KOtBt0T
 kFVBfgVz8CaJyRDanjhCSBF0f7KgDxW8wsSQsF7xiDMfMnpnAa/njlKp63pDq0MQhikA
 obLECm3Ag6jt/O7ssPRgvuq+03KEEQI5lzaVuaDSDkf97n/5h3fU1hN8O31++Yv9bYsS
 mIvpifgHb1kgFdgVfWccBIL6VMa4vOK+97kh4DhpGYN3P/07D7Mha9X1/ixV+K5hdw0a
 X2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792704; x=1763397504;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
 b=wuhgIxtsJoLWp9cfImkJPa1VNxmx48f12dKO6OOVuahjSeonc4sbfkoB2gS6kCPQt9
 eePo5XJG2y2TtNadMn0Jo2Q9jRiRGWGU10h2t481ElzZyN1NuL98ETnrTfS0LNa9DHsk
 Co+30NWaUG7y2aN6V8naG7QKffGaWZagEz68w3utNYCGnJ4juCGOhlpY72iTqsPoUmBc
 w48jDLy8+tmU/PqHf2UQudrYt50DIqhqDV9Wk1ne3k4EP9kB/Bt+2XNm8jcCFRP9p3pd
 j6ngECcWZ0U3b9iWtLMKCxq2CSzBNTyQ+mbqpTnQfkrRCdhEEeoEftuK99y+6SNJgGw0
 x4uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX71oRuglH9vxnZep01FwnQzD+nCldhVBqI/g9mT3tmb1cFqmAgXTvVWMtFWdnGODmwWwMoXLE5f6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz1zm9fg6++HKyaSqVw99tDe8IbCNw2SVipL4YTVXD/gyZ1hp+
 arfQEY2VCZGYnCnfLp/RC6ygoxYua3vkcRBQx9RsvPTqo2HZXnTtpV+iCKGQngPFRZvHBF8NsdX
 E+wOE2L7fsSf1lEiZwKUPkupuIi+dbJp/V4lRNGxMcgITPMx4zLnbpfGeB2XrrsPu25Ibd4w=
X-Gm-Gg: ASbGnctSqL02tlXCfXGvzZbZ0dB7OGG69t/mGLIXPp06oJ5xSZRy0OyOt7rMS5EjwyP
 vPWRRZD0jYAprfZlmsLnk3x6S0hXB4qPIU5s+CuG/DXAtTEIjgf/yTJc81mg+IS2yO7Sl8j2OI1
 Asg5YthrA24WCrlM7v0Quz06+pziui5clGaUV03vS35NkYboR5N46GlfT5hSc0OasZIYjXQjuop
 cDKze4Bzgx5mrtXzKntZ7KAsOAoDJVsi8rDTD9ARUcjEzpaEgrs4wdHEw42DWp1l1aX33VWvZxB
 oJI81d735YfYAHU9mZWi2bAFFlOw+gsgkXGemt98LlAPWUY2CquQWQLhdUX62umpgOKXnrk/mRt
 9ep6uzM47MYuO3GryJdrg9mg=
X-Received: by 2002:a17:90a:ec84:b0:340:b86b:39c7 with SMTP id
 98e67ed59e1d1-3436cb91cdbmr12379114a91.11.1762792704054; 
 Mon, 10 Nov 2025 08:38:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoVMuhMcPsQUnqMT/Oy8cOyzF5h70KIN3Q83LoJcFWHaGhmdTuOn6UcLQhDffxl/Uu5uGmCQ==
X-Received: by 2002:a17:90a:ec84:b0:340:b86b:39c7 with SMTP id
 98e67ed59e1d1-3436cb91cdbmr12379065a91.11.1762792703541; 
 Mon, 10 Nov 2025 08:38:23 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:38:23 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:08 +0530
Subject: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1529;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B0t21POhzhnkPllkO0aJhsfTVayUVxYvYda/rajz62U=;
 b=5LGxm8q7C7nTAl599JSjm02h9F6JnfyOhlzuY9M+RH/QtTw4F1E31ZgmBsJOxt67zTsOJpNGK
 U43gtcuNh5UCTjwVDvswqSwaglhNGbvuhplr6cbwINEpI7UGgZnf/qy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX2yPIZME1QvSr
 WE2RcIUg62N6G3xPg4tBl2n2yh990jBmZgjpx976b84cWVGY8rVDc3fKgM9gUo5v/8h2tD3Nm34
 wGobLgLl+gRAx72a/iwPiK3ZgTmfc4M+Jtczb3gILwNaR3cn7Kb8peS7XGdlyMmbeb+KAnShDxa
 3xSKfQAArowa8S80LNq7XygHmNIozoYYDRH+FTjA29wm3bMCxykglxFcZoPHZOsldha5b1XqeLK
 1iM0VeNkxYUkFjOX85ZSRNxh1m04JRJqtlLMVgfn/GsXBVIHFghhih5r0s+4QGu1p80AewFbB7Q
 b8Gb5iWMxvSkq6q3GORkD8kdY1KGdIfhIp2Kd2dNTADaU51O/GOcb7ViQhIgDyUZJ4dia+SHvQP
 Rn0ArNmXGrsXXV9YvOGFg8WcSDH/sA==
X-Proofpoint-GUID: IVjyB6W1bW8RnF6kLHSQjYZCJ5hf-0mB
X-Proofpoint-ORIG-GUID: IVjyB6W1bW8RnF6kLHSQjYZCJ5hf-0mB
X-Authority-Analysis: v=2.4 cv=La8xKzfi c=1 sm=1 tr=0 ts=69121501 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gggc3m2WwWe7Cuz57AEA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match the recommendation. Also, downstream does this
w/a after moving the fence to allow mode. So do the same.

Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4e6dc16e4a4c..605bb55de8d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0

