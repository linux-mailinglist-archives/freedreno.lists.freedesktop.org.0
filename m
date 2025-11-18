Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3411C684F8
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 09:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D1010E454;
	Tue, 18 Nov 2025 08:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6Wl2jGT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHxERgH/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684EC10E454
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8DqUO2193871
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=; b=C6Wl2jGTF83SghDw
 cjpCfqtoBfgYeZlVvyVZyJymt5wmM6PXfDeqK/2pFfV7Tva0gu8TScDTvoOTH2Ya
 kIxiqmrzfD31BQHCiKybYdtfDmBxY4vPcc1wZnXyi/U6X6R+uNHsCTKu9/QVycOv
 2LchNttPmewBb5164oDXNA1jBU8emZyAGb/CorvOhTPd1XPUccfU8R24ulOHW0fR
 DRRYC6kZo3hrxloK9K1+RMccykIHzZq/XPVrvBmKYqjD8nahfqJsMlXnh3+lLzkz
 C31R3yIyWDNs6pAByqT5gTBxTmfmuMBqHLdcAgLutby8n7FBSOZXTdfI5hckgz+b
 P/Zovg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y83k9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b6097ca315bso12305066a12.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 00:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455971; x=1764060771;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=;
 b=PHxERgH/cEISdNS6Xil/fBaAOw9s/hxDrhf9gJjb9nG0PowhbApg/Rx9TIqv1lZCOW
 ppb7NhEQEvWpkwi4eSCpNNYz1xx3mBgkkKWcAwkkKVPpSVg4OpPZhLP1E1Dos8fL1sPg
 86aOA9KnkQuHe+wRTD1b/ec3TOgIe2xCo25NJqHlFAXz6yl4KF1G8BeOOIb6A9Of0dJL
 aVwn1kMUFdeUYzROtM4x4zyHFzG/J+aL0BhjLDwoP4zyjbXdPy7kV/NZ+5GJRTuS1g+D
 Qicnps4CM4DKlBkkxE29W+SAvfJOEPkRphF0wfOt7IqPVD0XXA0/GJsm1UhYgCLACP5t
 YAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455971; x=1764060771;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=;
 b=K2OzUfSy8z71ZdCsnSahzcb5zFue6MOE7HHJtpxXr8Ps4bmvTGYB4HC7W1Q6pU8/qH
 TBC31a/qmxox2msH2v6mYnj+lLL/naD0bjAVE5bUCGHAYbDJWB645CCjxd36mvwZ5l6k
 CT+Ix3KE/jjUhzSlAy0QLzaIJfejT5R0LuCtDyZlq4nz0Zg4HZwUH5zgn7ZayxLrOOhE
 tssO4kGI7X1oNzZT8Oj2h7l3G0phetytsWZwsFsS6JM8HEPHC72KTVBkgLGK1SgadPJr
 3D2+8FNZgvnnEjW+1YjIRYz/nBarxaSFSOClaFXghU+kd/fwrMCGaWGJz0/Se4cjS75j
 4/+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3r8HJfTjD1qjTle9B6mLAs+keAgV3qwbB/azumiKaTu5VguM5taIlxLMY7U5HNUI8UNzvQq8LuGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWuUxgF54krL7Qlz2A7UV3rAjHqBoMXBBYAXAGLjdbxyFun6Y5
 O1KbrbtbF/NI7QiB0K4P9r11ESg0CdyOVoZGzTSYHBMfxARAu1roF/NGXihNe2ssTffyVBR6JT0
 86THLhRCa7yZlwd1wCEJuFcJMFWzGS35RKvpf/jMhHeZBMsC0oRB1YMkhPlgSUKB3CUlMtfo=
X-Gm-Gg: ASbGnctz5SydpGxu8kmx3CDuOFnLEK0gqry5+Rxg3X4+Iyf65AIQUW0kldlF06oPNav
 abFWyjBK1rYJX9G3KyojQlibPlOEWAgcMDl1mhBm1i4E/Bqf9+M3vY3D8YRMzbBuzEcZ3bmgFCs
 vYGZEn37Bp5VdM1M1UgwRIgj5F7zvyGcHXAP9U5dE+KDONZWGJLhV2I+Qs3qvQLTPscddXTb9ao
 THj1OusVhPxFz6c9+DOMLaekgbBwCs4K5Hlo6qtBoym6qMtpsVzWFOW5KsS5bcB2AUpIyqDKj0x
 McTHv2vMrVHKFrPEdOcorHU/zhi4QpwxrRVI8xYChf1D2k8s2YJaPCr3Qruq++anSN4JANV4px0
 1tEnABJGAjy2jwfi16+4pC7U=
X-Received: by 2002:a17:903:2b07:b0:295:2cb6:f4a8 with SMTP id
 d9443c01a7336-2986a76a1edmr156640575ad.51.1763455971198; 
 Tue, 18 Nov 2025 00:52:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd2hB7SzLzqaWuYwjQZyt6QMGhA+S+3S+Uo1umciwE5IFO5bu8yrxyvQu4iby3vFSrcek1bA==
X-Received: by 2002:a17:903:2b07:b0:295:2cb6:f4a8 with SMTP id
 d9443c01a7336-2986a76a1edmr156640325ad.51.1763455970710; 
 Tue, 18 Nov 2025 00:52:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:52:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:39 +0530
Subject: [PATCH v4 12/22] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-12-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=3011;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vKTta3TyeGhxCas1ssgEN2kljhDiG+toGTM3SStGt9c=;
 b=RTi8VnHIWT8h3mjbCRZH3IO6SGjoieTo5yBHNHvoxtwhuGebkSTBl9jpJvKg+l0B9GXKeOno1
 bZ6HLGu4TV+AIaAEzsslZ9XMqZdc5d/c7TXsVihukbzwTQYTIb92Dha
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX7pQsVCf481af
 WT8j3Wq42zufd4XPCDxqvrIXwy2N0CmsUKE31m0SxYNCViJOpUak0Sv108LEnAeZKfnVl1lCYje
 62GZ3IhMUOjJfqlUdemm3R4KKDPqZKmkbr3I9SiEYiStfzuvxLqR7W/u12uFN4vhQz0Dg3VBij+
 P9h2Sb2WgGlSAybVSxv38rfoMWjw9uoEkxvkcBh3Mh6RzNnZikkhGdII4yZWxCJJFViloHu8RPo
 i6rVD2GH5tJDu3GBGu8Bve0PbbOjdmwQGr9RirsoLOwitVHlQRvXQy6bz6BGJKdB3tLPnXwV8lz
 nPvNzfl7QRTcA2xUtDOOXLzrZlao7zkpYNa0u2cnH74BmkJh9n+/UQDI/f6rlP2jA1JoWrzmVMC
 bQqCQta6kYKiUe38hib5M259GR63Fw==
X-Proofpoint-GUID: O3S8--ZjVwhndLkeuVAJkWjpn3_WAH19
X-Proofpoint-ORIG-GUID: O3S8--ZjVwhndLkeuVAJkWjpn3_WAH19
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c33e3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
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

Current logic assumes that the voltage corners in both MxG and MxA are
always same. This is not true for recent targets. So, rework the rpmh init
sequence to probe and calculate the votes with the respective rails, ie,
GX rails should use MxG as secondary rail and Cx rail should use MxA as
the secondary rail.

Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e566f3b7eab4..b76960c6d444 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1544,13 +1544,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 }
 
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
-		unsigned long *freqs, int freqs_count, const char *id)
+		unsigned long *freqs, int freqs_count,
+		const char *pri_id, const char *sec_id)
 {
 	int i, j;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(id, &pri_count);
+	pri = cmd_db_read_aux_data(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
 	/*
@@ -1561,13 +1562,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	if (!pri_count)
 		return -EINVAL;
 
-	/*
-	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
-	 * to regular mx rail if it is missing
-	 */
-	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
-	if (IS_ERR(sec) && sec != ERR_PTR(-EPROBE_DEFER))
-		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
+	sec = cmd_db_read_aux_data(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
@@ -1635,15 +1630,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	const char *sec_id;
+	const u16 *gmxc;
 	int ret;
 
+	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	if (gmxc == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
+
 	/* Build the GX votes */
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl");
+		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
-		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
+		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)

-- 
2.51.0

