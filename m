Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12559C68499
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 09:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03BA10E449;
	Tue, 18 Nov 2025 08:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG6MWYFm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zl0kG9w9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1352F10E447
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8VMZs2249861
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=; b=kG6MWYFm56FyS/dY
 diVBK7hBFx8rRM4vKOd/gDWtBy5atPPXqh736uHfkgPth0FtmszfkkNkx1Al1Ctz
 hn/znHNRxvEpkE7EVk9/tEtpMINtxH4qN/WQHA+oWq5VzVWYilZ8j88RssNxzy7W
 LQeouQChS/YLGHmgDxJd6lUPl98Pc1+GvDWy9jUyAFVcbh2YZDgtB+vP/0bFAeOs
 4uqf/7o3HkLwGcGtfa1yeEYTW02L3HXzEBLplDER9cjVE2ZVj0QmRNmwumGkjL2U
 zbSKkQ7CzNI5S/wLh+rf/i4WumDKsKNUTCNyTCSmOBpMG/DUOhtgALIi0LfklkFO
 PrerhA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5g1p6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2955f0b8895so72396665ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 00:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455901; x=1764060701;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=;
 b=Zl0kG9w9s9PRas5YUMDElm7zf6Rghz3z2bFGeMV3Kb5pfkPRczwfy8SW25zZeziXH/
 9rpdYkErXqE4NagHF5Aipjwio3xSj0Al15TMh6WERIW1aV7X+cy/c7NmRq9biJmJYbIQ
 kpLOiJ7nawZPrMVFrB2hFV7hEADXgFk5mjRP/pSJw20WHnC/H1Nx4dCNEIxD4vE9Ahn+
 OBaCh3aHA+RzdK/VS/k1noRvct9bNoqxFizFJygwBCnvk0Hcbeph9KR6zT7v2RKjfvRg
 gWJZZVOz/K3B4BElzNI1WQ+fw6fW7E4FZrpKm9E1MHcKOuJUlYFpniyyNFb+XMUkSd4w
 ufuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455901; x=1764060701;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=;
 b=IzbwNRm7WGCS/Q5yabe6OqgOYqqL7U9OS6rzHWa3C2bQEoLytKuGDLUEEOJh5Yv7wc
 4OdnMS2EExcwz+5IDNrxrfAOJV1Q+Onb2MOMkF2JB2g90UZrJLWA8ruP2TqClYusa/0x
 MrnkeZZpNRDt68sTz6/bdoYBzGRW+oM4SrTOqoofX3YOPelFBroSXE9a+v4J142nhAi8
 xvPjG0CWgSVxS/nWyinCI8U9u9/1Sy886zIOsQR44btbWlTKT+U/u6tXOMXkTOS2Ahxt
 xBMyI1MzQT9RgZOmNbPIvhyhAfBu7oVXACy3sSZuyb2qjEVW0IXJa9PN0Sd0K7y5WdX4
 3Few==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqYNPUTInv6PIUUlhv2Spz6fMc9s0MACz54pOsPXalVFm7EbmQoXQ3eSVlltooc73TMm7SxhRKjcw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9M79sNDcwtv7eeEx9c4r4O5+/2rFsLa9fAlQQ+FyFzHvX5vsM
 SupH91D5IaQjIo+EA1HraS5YEz3RBOFaJDPJGuVczm7J9CQePrqy7OggNZ29HXVjvwmmilExEVa
 bf6/V+3PX44fltCBPNHJlXyvqrBA7+wLckxmrT8h7oxiUCaijxDKcEU9kVNNka5Hwb/dWV3I=
X-Gm-Gg: ASbGnctyU2+JvUcXT1Heu2/TwQY9kI+VUhU52UJW0o7seyPQR4LTkPL/0zJ71OSyFuX
 ujgpwb+SdhxXEnM6s+0+I1j/b8amtgT4LOWrXv7O+hiQ3v8PPEcsJO+NcH7BWnhBpG252dKPCZM
 VVbOtE1EwS20jrhFJuChWXj2LPmLt2jRH6evzzt9pjxrsujr2akUSWLfWJ42YSTdZVxEJGeMfue
 O1SR7xl7KgXkX3D3O0FN01AIp0yf0rPr44rlSMfQqHyi3DXXA5tt5PvkTDGKMsll+dLrIp1O1Ca
 Qb+HC9EOv9eJrZFAJH2mljGGsSdX2sG6qyKtTmiopNRwY5O8fmOrVzWoBN+U1VB3pgdPCoW6Xnq
 6RbrSoMgemZy0sLuAIl+ghtY=
X-Received: by 2002:a17:903:2c0d:b0:282:2c52:508e with SMTP id
 d9443c01a7336-299f55124b9mr25185005ad.8.1763455900692; 
 Tue, 18 Nov 2025 00:51:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCsVUT/gyxi19V6NNcgQ1Bhhk7hd0QU8Q3IwF4m63Apgo8HYRSB6+A4jdvCpbIXf22MBDTag==
X-Received: by 2002:a17:903:2c0d:b0:282:2c52:508e with SMTP id
 d9443c01a7336-299f55124b9mr25184705ad.8.1763455900192; 
 Tue, 18 Nov 2025 00:51:40 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:51:39 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:30 +0530
Subject: [PATCH v4 03/22] drm/msm/a6xx: Fix the gemnoc workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-3-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1590;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9A5anEH53GnLLVd9MMQtmEBnjJez85XhahSgwIYwj+o=;
 b=GKVy5XYk8J2atz7vVd9cbq8c445N4UJwCVBFzNslb6yr289XyqRF14cJW4/UDx5T1sgwFfTBe
 gLOlQU5BxT6CV9lRW2Re59yEwx79W/9ih/7ktY1yUUPaQPppV5gcEHU
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 5fMIdDIrR3nV6prbj7bZCVIGCWzhnm0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX3CiVLABz08wV
 Jh1blKTAionw/O18QiFhxefYVxeU9bJgKSR9o6SDB23VnZDKa9Gi0/sTO88OPQpTL4zFMkIcEiJ
 gmt/m9easccogpElWKh+txKKM8DEDsIiM49EeRF9d3AE9C3WeXUX06d/opJ8uTJm8L3NiX8o73u
 WR/rKvR8PFRgyczUmNfIQf7CNcgCJzUwjzqN/97sVCNetwQHNrxaj1rEFCLUV4YJ4YZqsuifz91
 TLuq+fbm0IkT9g9Ds9jJdEoehioVkoVTED20uAScoJndx5bSxg6EU3VRdKvMIZFNIRhNmcJjbRO
 SJdzt96xP7ASDMY0HTQ1alr+EaGoLHFNr5w5fBY6FzLCQTIxiseqPNKU/3RiDAlLThSuJ0N6giy
 1LurnC8IzPC1s/saw07ijGeO18cRfg==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c339d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=twmNDnkDfZCprR7-lykA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 5fMIdDIrR3nV6prbj7bZCVIGCWzhnm0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 72cd4fe0905c..52653ad376fc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -511,8 +511,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
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
@@ -548,10 +549,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
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

