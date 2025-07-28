Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445ADB14351
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 22:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217F510E002;
	Mon, 28 Jul 2025 20:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQnJb8OL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3510E599
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlOVB023603
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=V9+fcbz7W94
 r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=; b=UQnJb8OLWP9QwXGogs/DlkXf7Vm
 zpe+3nPYqDV73hH5QmVsF1roKS4OGWEL3pbWD4iayMxZm3VJe4BZ5NZMEtKL2MbX
 A7KgUc9TvKS2opSSx9Zyf65Fhsi2r1OC4fGNmWZlCVqZ4qJe5pE/N92kvaoYyR+e
 siRfoXrTEpn/JqYkFYnQL6t/YwtpTGkBG4uLuoyqH6680TT5IjXnxxhA2+eUh9Ya
 J/nXg0CdXetsjayL53lOMwl0D6vdiDj9uNVaJTQSFbNAH7tApY1sFKfM3npPLy8h
 J15A4g04+UcUrb4/1Hp3n1EpzdqyTiJN8FeR5xFmjrRsDtrbvnbINTzmXpw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qnqy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-235dd77d11fso49860465ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734868; x=1754339668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9+fcbz7W94r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=;
 b=b84So1zcvlnOVdavtIAgQxAcPsQVDddF44t94YTsjgYu7VDOfg4xqxuoEctpP3ZTwq
 FosMOUTBPRCMmB6nseruy0UQZWTrMr/IT3/5inZBhhEX7DRHvWhWDd8X4XnQoy68WNtr
 9KAtKrniE/EOQOZeO/7ivMOc3k3YHkaRvSiCVdfLa49QGGJ7ghk6DCAjIU1/sevDCXsS
 qYlF5nRKG5nv5F8BoLJe9IS4E+Og7pnrBwaJOS1Yw1P7MZKcFtCxm8HvCVnkfxLy036k
 RWCsyfcSnfXNeMXCa+/hjAt5bHJNsyHMzDFResBz4vbjY0PDIsr3918RRi9m7eu/7F9x
 wEwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8NkIOz56eA67Et3dWuotyAz5ixG7+8RYkH8wju1I31SU52IvrWtefiMK6F6fgDARtX5l3ej/squA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuDuT5e/VTLDcXM/U0Dh631whgTbY3cdChi/IEnn2GOmCessNP
 i5B6sPJE3QPlvyXzvZtrGrSoptGcIwZdebcHWorvIeVlOMSsSnTBKRqU/yQE2MKPM5yzB4+U1qY
 a7HLwhXX1hBVd2q/cV5lPaFKTiYeuaKxULCz+ztbJ7MAB0vhCta1rOYtY7bc16vABqxoDtHk=
X-Gm-Gg: ASbGncs92CSKwlCRat2D0uCgnttKBRFvY+eQJdBaemKDKoolxezRJbbXBvNL98k0rTB
 KxyPqly6TuLe9EiEjTQVhn2BRk3AU8DTYSUMajwlNM7G4PFsaUhMvuhCZRH5c72OAJwp0URoyJH
 yKCHM4tg3W5umag0lDvnA44Rhc9vqjaXQIHtIxUKU4bRfVphcDun5mwpTpUJGGiIHcIBcxU6GPj
 GNQPARF1lN1PKPqAFgqBbvJMxD8yOuCTWb0dRxmvmOiq1FgHKsrkYixtZUjjieLE7Yt3jQnQKcf
 G+9lMrms4GycUUqWa19hAoOnAiuGQVdw9N+/ryTseL5lrQdVp2k=
X-Received: by 2002:a17:902:f083:b0:23f:ecc1:ed6f with SMTP id
 d9443c01a7336-23fecc1f05dmr88609035ad.17.1753734867980; 
 Mon, 28 Jul 2025 13:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYWCqRtE24tEVyEPFKQ+MJ3KSpNHmjoUKuOAzp/vLakvO+2T4gVctQrTsB7zyfP/q9HW23Q==
X-Received: by 2002:a17:902:f083:b0:23f:ecc1:ed6f with SMTP id
 d9443c01a7336-23fecc1f05dmr88608795ad.17.1753734867535; 
 Mon, 28 Jul 2025 13:34:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe4fd62dsm61122835ad.111.2025.07.28.13.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/7] drm/msm: Fix a7xx TPL1 cluster snapshot
Date: Mon, 28 Jul 2025 13:34:07 -0700
Message-ID: <20250728203412.22573-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX7zzLc/Rngt8I
 sc4wsMn0OwL2tOZsyGqWeAKT1rR3QKKfYIiPHIDdJLVDhHiZd2vddRSb0mcB6sjJri7Qv9ZcJjS
 Xxk+1vP1+rQf4dCA7ro1LLWt5UtdKU0jkgEBqSGFqQfuZRIQXnOodMny/Th/QzY10/a+2dABUzA
 UAPFOnFqTERi2sjpQqvvB031arA5rCH+xlBXukbzcBYcNrr7+NsscqN4acrRZ8urKraRNCyhqjn
 Qw0G4nLNSftzwse/+25J6w2EZiSN++t2nBC/VB00VhdBVRUJcrBJ0If46yUSIOAkKi8KiMwIVNI
 t0yAl8CBsR2PuNk+QW3WWVccElE2wDwiehDXbjeZKnCJirU1z63Zg+AS+rLcqWUb1aQrZMJCETQ
 amBcOHQMN2ZtogOk3DxBrGtYv3aeE4RLOigQ/WY0MNa50G6rlD5ufpDvjpI/oveVtnCNzBXA
X-Proofpoint-ORIG-GUID: -6jhKejKifY7WBzlgs5ln5Gq7Fx2nv1Z
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6887ded4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=zhZQclFZcvAaLIcfx54A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -6jhKejKifY7WBzlgs5ln5Gq7Fx2nv1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151
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

Later gens have both a PIPE_BR and PIPE_NONE section.  The snapshot tool
seems to expect this for x1-85 as well.  I guess this was just a bug in
downstream kgsl, which went unnoticed?

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 11 +++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
index afcc7498983f..04b49d385f9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
@@ -668,12 +668,19 @@ static const u32 gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers), 8));
 
-/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
-static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_NONE */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_none_registers[] = {
 	0x0b600, 0x0b600, 0x0b602, 0x0b602, 0x0b604, 0x0b604, 0x0b608, 0x0b60c,
 	0x0b60f, 0x0b621, 0x0b630, 0x0b633,
 	UINT_MAX, UINT_MAX,
 };
+static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_none_registers), 8));
+
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+	 0x0b600, 0x0b600,
+	 UINT_MAX, UINT_MAX,
+};
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_br_registers), 8));
 
 /* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_LPAC */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
index 6569f12bf12f..772652eb61f3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
@@ -573,6 +573,8 @@ static const struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
 		gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers, 0xaf80 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_br_registers, 0xb600 },
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_NONE, 0, A7XX_USPTP,
+		gen7_0_0_tpl1_noncontext_pipe_none_registers, 0xb600 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_lpac_registers, 0xb780 },
 	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
-- 
2.50.1

