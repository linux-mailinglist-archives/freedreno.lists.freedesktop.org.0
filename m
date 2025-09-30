Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24776BAB849
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 07:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F069710E4ED;
	Tue, 30 Sep 2025 05:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ii2dq5xc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6E710E4ED
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:04 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HRoE026876
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H+Y5nCYPwx7u+eftr16tQ9QPU1KFxFK+YtBkCK2a/5c=; b=ii2dq5xcszBZzzX0
 Wi7biX5+UML7GS+Tb/ZhgIoxVbQ+1qwEi/cDIlAlwf/fMA+qWG2mMqDq0E5F/7or
 CrNK46VHO1RKASZLO+qYahBGFq9ZBDEKVRtMXpcZhjOv8/Cv2DfBe0oiO/Ty0rYi
 3oKTq53euWSqlqF/2G/TEoD7vGRm3FFtUleXnsc7tixui7wh+DJjFBhZtE7gJNdd
 Yu9Zd74aPJByCatfs3g22JX1hxj7zf0s22sPpklclSv90dzTNvRcZJR+z/5orn2V
 uqTSTu09oFreAtcz+gHSTmKM4E+H+Qc34tSDcm7/H/F9d8Irz2PTIhzUpYeog369
 uSWR0A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf1c1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-277f0ea6fc6so103790855ad.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 22:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211403; x=1759816203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+Y5nCYPwx7u+eftr16tQ9QPU1KFxFK+YtBkCK2a/5c=;
 b=VNnkY7ptNy8E5nZpRu5+bK4m3U0WgqmWGylS4ywcxCdRKWKI3lz4eroRdf60C9LZW2
 92p/D4kv2INMAMn2HlI9ox1BxKoZq7YHBsX/3XJuxEvLhEW6B/Z+GJwEFVWfDgmrOr3V
 MfkPe935Pda0bAQ744cJXpMHEbm9tjEq0XP5fMCCYfy/tfuOk3H3J7vLPlknw9atSCsp
 kb6zZ9i22ngsGSS81q8NGDef0ABxc0TuQZ5EYGZDR/DDA3Gr/IZlpWvJZQ3MnN6I2q+E
 DnxyIhPtwMjRGi7BJoo/SqIvxObhs+IDP2OPIwa2CNUvplA6fnMXhxy8Qi2l0KLyNDP0
 2bnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTI1Rcd6p9k+BSW8FeEqLl0kD8XfigpUE4i4QBuST7/s3mZoHmGTPcTaGbs/hMcWOE8Ke898V1i+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyINBPVTCWqxtrG5Isnue0XuQ0/rchbvFh3v/3+G5m9Ceenh0F8
 0tit2akt9Weyue+GcdddDytX717aAHK0IyvqiZeA1xftVC4+qOVEUEVrayOHMRCmJyb3E+PuPa3
 zHCbraagVGRj293sU8Sm3/rAL+Ptvvm+1ptlw5hzmfjtU52sq/lLA607FvuT52OlpnzkI0ho=
X-Gm-Gg: ASbGncuIBLY0uu8AZe0nsdpFNYs4Ahl2leBOF3IrH+NxF6bffgDdVOP2TwpVy7MqNo8
 fFdwp83oocgZoaiOitzjK3NyTkdeD2yDGFNMNtGVxQuqaAfDkpLYt4CUN9oO37OYbZccH23PEQ3
 rpFkfefEfZxZDDTl2h03ESmedP/Aofupb+U8+cZWtfi7C3LEMEezhse7glDdMrKUco2TvRlJbvp
 M+VQ26Q0pjCj09SiacSMm+6z+Dg/DNwArVL+ka/sYYjkogq0eZYYgfpgyI1NA4ne7WpNypCfyF0
 Ijy5Gp4i0LkMSOmpqyUmvcMMAa2qcv4C2Ss3G1Gj1oDWrLpPSJZFWh7NAFMCwMv728WM3Q==
X-Received: by 2002:a17:903:2343:b0:265:604c:17e7 with SMTP id
 d9443c01a7336-27ed4a89825mr178638015ad.60.1759211402696; 
 Mon, 29 Sep 2025 22:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfxMz8cAOPh+Vs43kdCM5oU0zEFqqAy+EADwvCBEeDKHCk/6ncSzf9Kw1lSxzqRRosJ9WkNg==
X-Received: by 2002:a17:903:2343:b0:265:604c:17e7 with SMTP id
 d9443c01a7336-27ed4a89825mr178637855ad.60.1759211402274; 
 Mon, 29 Sep 2025 22:50:02 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:50:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:07 +0530
Subject: [PATCH 02/17] drm/msm/a6xx: Fix the gemnoc workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-2-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=1521;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JAlufx4bcWYhOFT96HAmSFs8ixvBu4zisfH0Ny260iw=;
 b=0SDd5GWlf6Z1edx32Bey18kAogkeePh7FfDo6CnNR1gZeWIj1Lj2prEncun2xLJyodvNcrtLE
 Us5ChPyi+I2AV+S7wi4gT4RlcjAd4tPRBxegTfXxDxVU9VnlSZRyDoS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 3DxZhDGTpylyaXtO6RPHpYtyt7UUF6Kl
X-Proofpoint-GUID: 3DxZhDGTpylyaXtO6RPHpYtyt7UUF6Kl
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db6f8b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gggc3m2WwWe7Cuz57AEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX0UAZr1KJWU6E
 JqKD1fKzRkhEef9ZYU92Kb6klRnzWpLshsbyspZ/avswPw19VTAVGjYROs++/6dWxHlEcOnBFeU
 0WQ7qAmyXQVYL4zS6tkMayw5TAo5cywCZ2CXEaifCMNOVlTHv0jsZWXRiXClL9TtrVbwfjk/GHY
 hKl5HR8/qi5IN9+pU5nrbzwJtNCOqWCgjj39Df6qIuCWPFyPey+jE1UZRy3VEU0iqURK4r25Cxi
 82agFtTlcYnEhDFNk1j+BPtmMCdovNg+rFp1AOKmyPCZc+Mz9j3JDLdZfAT4w7jTkMV/yoNOwMk
 56sVtzPjCD0K0AmCRQG3c/x/IPuq/HAple6hcmi4jHAcXZ5bHzxF9+iHFeGISBzdEfelk9XlMGL
 +Rqnwx3FYdIVQcSWjTyuUGqimEkxHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
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
and newer GPUs to match downstream. Also, downstream does this w/a after
moving the fence to allow mode. So do the same.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..e22106cafc394ef85f060e4f70596e55c3ec39a4 100644
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

