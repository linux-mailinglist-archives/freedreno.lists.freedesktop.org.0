Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FEDC85C9D
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 16:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01AF10E43A;
	Tue, 25 Nov 2025 15:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjoQccNK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fa6Z83Tw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DB510E2D7
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 14:27:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOE8SV7078473
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 14:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=0HW5XLCUu/d+MIz/UiAcX3
 6i++Er1qyFHbbeEgya9aY=; b=TjoQccNKnIPMb4XQ4/AQYLSBhgCUwdQzVxJJ93
 CTdd2SHf6kgDaD6J4tKZv8OFwePXEmaLMRQyxZJ3gynWH1LnVu1bdlEtSWgT7vzd
 pSWspuZPoP25MBLLnYCgdxGG3uck8q4tdJSQC6cp2Z8esY888Kvxe2QwmNfGr4jK
 IE/d1xIYQIp2nCYTo6scYTPCqAkTQBrY4hnI694nHPIf48LcQmZa2Atv+jN/WFCA
 lzbPhAqEE/TeW8z9/Vkc6/I8LTe5AT7ldm80I2CTEMR06/AVjtYddIOIrXcTrrF/
 QL3+SiPvFjtPlXryxeGBtFdvfgU3c2X5EMw9MwmERM1HBBNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amrv681fb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 14:27:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-29809acd049so87140775ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 06:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763994432; x=1764599232;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0HW5XLCUu/d+MIz/UiAcX36i++Er1qyFHbbeEgya9aY=;
 b=Fa6Z83TwmtxN87xsJPlggnQTzORKSC6RRVaD6UKChZ6WQr0R1WUbvSGnISNx1hEdEv
 FmxRmgD8Gtl/c/Ka6wY8piRDQ93sXDVN/L8CZaM0UupwUVcP+H24Jwt/UyhM1Tfm/Y2u
 qq1l4bv7Uo8bwv7hAHRNxLwfmwf6KcpSQFWzQdzMGpoWwSHY65Hko3KmcY5ffVEajv+D
 PAiWGSendTkZ/FxVSfqC2aY9W5f/JZWMdMlIvC9Je7rEl7MwYFO7M3LqXbUU480S5Uv9
 5aJiDl8046jHKonvzNysqtFeFma3SeNkqBL2+Tmcdr992X5+XU16OTDzEm2r0s6CswWd
 9Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763994432; x=1764599232;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0HW5XLCUu/d+MIz/UiAcX36i++Er1qyFHbbeEgya9aY=;
 b=o6xFOpGTxi/J/s5cHNVz2BTjanIjmtemcJwpU/uY3njzriwJMeYuYUaierjwFDjeJX
 jE35FaY00ZnNf1lMNlstQnhdrWqGZ27YU4qwN5V0SzSEVvRb7GwvCnb5TQzAeBEChZoL
 yFLeS6Qj2ioV87mTs+89zr+/nHR9y8pChrGQoXojjq/ouCpSFLPOW2SIRT3P34rclJjO
 fb2YtjwP7Va051evbJVzdkzRtFldDE/rP6hqpGr8IrYLP4etSQbZrExI1zV3qJqT7hJH
 XRS6f6pXWNkl2uBSXvtUDWqY11rvbkpjPwFW2eD9NvELM4zpCc8mQywJYKe6nrSC+vc8
 1IIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnQFGAXjvEe+dDhKDrR2g95deptm/qhZ/oXru2UZexqCcSzDwOr0aN6+sBmQ7wpS5LbVZreqfHd8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5WdUdiMP2+4sROzGiZG05cfiFNNBswlD7rTu4xw6oWmbPcMsL
 meQ6sAMF6r8HKHD//RTzgJwAJIYOYfaVhq1bmrWOlwwgrCzdDTO5E7c+tNJc9jHDBscM9mysIMY
 Az/3DCdC/8ngArAEP/hfdXINhS1aGB9xdyc91KNZTjtNaVAJ8RoTFIvfXkRzbXr+mSpvYij8=
X-Gm-Gg: ASbGncsAGJdu14MLhj7NEQSr0RnLxhNKmOBhYZ1E6pGYUR5zyGf4X+5wfHCHsXeO4U1
 XyanBpkQAahKJTOpRk9KbqmWIbusidu5/e8AQFlhIoc7U6qtf5NvhRVUhw1lY+wpdVvJOyja2/Q
 N2BE7zVT89QSZPS4PxIgFBEup2A9kg+KUOfAfNNvxZtSJeAMMY4HUfIoQJQGxy0Q3v3hrqjkPNT
 ZPO+UWYhLpgUZQHQ+8k2sta4vPceIiGiDRFxFxNDF+UMfWqT+ZbJrLcuCqCeEKe99Ao9Mb/G/7q
 guGEDuW9RFyaxSV9cJIvGyKVKdhyej1AK22VfTMbSBKgjiXN8fcZbDK9BgQlzph6A/zksitlz+W
 qFE8ivtvw1ltzyY/ScLxO610b8s4M7TJnZCOs
X-Received: by 2002:a17:902:f60d:b0:298:1288:e873 with SMTP id
 d9443c01a7336-29b6bf841fdmr150523315ad.56.1763994431897; 
 Mon, 24 Nov 2025 06:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvj5vvlpXKGpda7uqJ0yoxGLT7O0Qfxwh8v6kPITKB/su/JLICLN0aRP9xSR2chCAxHf9+KQ==
X-Received: by 2002:a17:902:f60d:b0:298:1288:e873 with SMTP id
 d9443c01a7336-29b6bf841fdmr150522895ad.56.1763994431266; 
 Mon, 24 Nov 2025 06:27:11 -0800 (PST)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b25e4basm135549715ad.47.2025.11.24.06.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 06:27:10 -0800 (PST)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 19:57:01 +0530
Subject: [PATCH] drm/msm/disp/dpu: add merge3d support for sc7280
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADRrJGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMT3dzUovRU4xTd4mRzIwsDXXNTo5SkxORkY9NEEyWgpoKi1LTMCrC
 B0bG1tQAHNqsDYAAAAA==
X-Change-ID: 20251124-merge3d-sc7280-752dbacc35a4
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763994427; l=2380;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Cqakb/xfljPG9dtjKNPYMpTRNnHruMaDQIKf8YD6vOI=;
 b=hiN+PFBJeuzG5CK/eZUy2WYBNdpKWqLzNd1hHDYTDzrg3A4OsVtpRjp7+F0vbtcvd8hr1R7JX
 xAh5y2fgq1LDLgSqZ21crIfK0gRyYma8AbydGXwBJ/a4Ij+rncXTD+A
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEyNiBTYWx0ZWRfX8lbgZG6uvEtw
 lJloWHiRWaGE3RXpAPBtzGeSCeGD0IFH2Rbt01GwEDJFqnoe0NLl29qubquQWui2dd6dvoENWVP
 vK7MpfCXBL7ECQyhpj36JST+UXvAQSXrAHxciG94UcRaTpPbdg7yCbchR/bV3BMZCs38KDMJPrK
 mKF2nye2q7USkKjth5z3NTeLdA/bqSt+ntfDPu+QoNCH6MFhd20gzql5sXGxfOwTS41u9T1Zr5d
 GCaoPKADYqaAjeFuSvFqd7kTBqx+pd1dexs0Q4foEXTjMacrNHlpaOcWbIJCxA7dvNHe0S6iZkY
 /VpRxk8iBCPlmno3IJ0vOqBj47YEgZewfSAib21RwCZkbbq6mrdA8paZGNxgIIbaXVA8he3p02K
 YffnBSm6a29aAJgFSYCVkMsxDfzPUQ==
X-Proofpoint-GUID: _zhbcmjvE3y1bc7CGoxqQlcJLLrW2Hzb
X-Authority-Analysis: v=2.4 cv=f7BFxeyM c=1 sm=1 tr=0 ts=69246b40 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5FlqbPEWv7NCXEe-mtIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: _zhbcmjvE3y1bc7CGoxqQlcJLLrW2Hzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240126
X-Mailman-Approved-At: Tue, 25 Nov 2025 15:33:28 +0000
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

Add support for the merge3d block on sc7280 which will allow
merge of streams coming from two layer mixers routed to single
non DSC interface. This change helps to support larger buffer
width which exceeds max_linewidth of 2400.

Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 8f978b9c345202d3ea1a7781e4ef2763b46c6f6e..2f8688224f3430ff6d2aa80836b72262ed5b7058 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
+	.has_3d_merge = true,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
@@ -134,17 +135,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
 		.sblk = &sc7280_pp_sblk,
-		.merge_3d = 0,
+		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
 		.sblk = &sc7280_pp_sblk,
-		.merge_3d = 0,
+		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	},
 };
 
+static const struct dpu_merge_3d_cfg sc7280_merge_3d[] = {
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+	},
+};
+
 /* NOTE: sc7280 only has one DSC hard slice encoder */
 static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
@@ -247,6 +255,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
 	.pingpong = sc7280_pp,
+	.merge_3d_count = ARRAY_SIZE(sc7280_merge_3d),
+	.merge_3d = sc7280_merge_3d,
 	.dsc_count = ARRAY_SIZE(sc7280_dsc),
 	.dsc = sc7280_dsc,
 	.wb_count = ARRAY_SIZE(sc7280_wb),

---
base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
change-id: 20251124-merge3d-sc7280-752dbacc35a4

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

