Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB35BD3A863
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 13:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D2110E42B;
	Mon, 19 Jan 2026 12:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fe/Zr1x3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfRPYjrS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD08710E426
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JB7GVK1839154
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6qC/9vKSzQzUUoZh2ZSv3mwkxmrw/IyTUO/hV1ChtFs=; b=fe/Zr1x3pNkHSHYw
 CLzWIFNmqZkyHn3sHTZV7hpcppDAM0emR/uMPBk256pr2HOWjLLn98BqQPwUaWb9
 AdctIhHq1JAhtsecMqtxt1SpLUHBnJt7qF7nCPoWfrGQAZtH5wMaQbIxn/z/vjqv
 XLRKg3xkQaSBMwQQOrOBsUQIoqk6HhmPt2epxquU+N7xAxiJBfrG07ZkFVmdWXQR
 cWyhp/kqMrYFyyX00aXtq1J1/FtSI76vhOHRiYICwFOMC11lDopEBehcf6mvzdSW
 6bZFaXxCbiIHTdn0bmDvMm6dEalE6DsvhrLcnXfvO27/pNMlsfxlXjIDdz6ZwqId
 y4q00g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskf885w5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5014d8b3ae0so97349161cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 04:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825041; x=1769429841;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6qC/9vKSzQzUUoZh2ZSv3mwkxmrw/IyTUO/hV1ChtFs=;
 b=dfRPYjrSyvE3WWhRNQgFQnRHqbSrpLiahxM6AaQACNGj1jbOIR+qviN+Jwp9CLkTyw
 PuJYbQPQJKcim94CziJHf2tPphvzaKsvn2JwH0GO3V/HkYjQrBi3BrFA6LtBaH6imUX5
 erHHebW5ZOQMcVvASHWiFhx1CxCyEfijaiN5DHgRPyqR7MemEnfZVQ467/SfzecDhuaE
 gaG2oHL02g9F4fsrcoP2UsJF7Sx1q4MX0gsB28gRyPGWMLbqvAfJGrhQzhI2xzdbEwQg
 9ZOTMrveTw/ZtCnv5dZQ/16WNcO1f/rkP4L7SBLlbzOGue1AeDior9ViMgGmOeEF5yVB
 C6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825041; x=1769429841;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6qC/9vKSzQzUUoZh2ZSv3mwkxmrw/IyTUO/hV1ChtFs=;
 b=VPuszd4Q7gTCmKWcUFwp2uKx0xeUZ14WuYwCH2LANUEieekLX8Tf3jRHJcyfwjVvbV
 c/dDQ9Lj6LsPo+3CESBZSanmIbpLdsgR3zDm4H+wjUEaIajYZKZsK95sh7fpU1U+8OSZ
 y4i+skaPPPKTHQmdtMUGrm4G/H184rG0e9pd3dxMUSNwkw2uv6r96pkc2L1WPXJyZPPs
 XX28Lhf27HrsBUfj3IWmjTnTCx5gwclPxSqlLoxuDPul9BDQ/tjlxPk1qsRswYywZeKa
 3BVpeclEPgBrTmDIqjEwtPZ6kg1uhq1PybP+omKfxbPoduI+NKhzaEcz3ReZdO5tkCys
 3P0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1PX14eCre1s4kQYrqHjBmeZ8/br/jAiRVTNVQqB9AMk3HUrEQQmPJJTCTYYtbpI25X2B6AU147oE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvktU2yj8k0DYTbSz+dBtZU6nF6bfrigXCIoN4XbOHEw0WSwqV
 j6bLCAJDI5eR8WRqZ4ybL6mOzToEGJ2rFiJO1WDKlGBj8CybbWq0XjiSVKiVX7BHFKtyu5Aty8v
 2Fzja3AZ32gPjxSoMidKj5VTGg85duxPfbSmwN1SrpfoYQFLZHg9TnT9xVEdYVxVqJxM8q23Yue
 MIf4kdCg==
X-Gm-Gg: AY/fxX7DBbfk5QGvERVoM5qhn6RazSQq18oQscONzuutJQwSMdWv68nQ+ZFjNtfVia+
 XJdlc1DvWOCUTdRR8dYJ/KOUDXDO8iwWEp5iBfbwtqHMbd9NrGGvFKBFpuMsOH6Vha3XCRISmJI
 hVTn5P0lNhBj88IkeqznzuAi0i8/QtyVBlw70+k/txW27nAKiOaskn11ojG+aGtEVMBXdR5aXmL
 wIObkUr0PnFes4X6jFqVo3jjQMxua6zQeEY0ULc4+gE2Y/aP4q1XmQ5atzIVlmUlQoVhePyC1Nm
 gZM1OA5soSODeV+NWH/OGYaJf7wjOeqqt7MgNjRx8KcLuqRDo43fRevQ5cs37BtRRmr26r9d086
 dD7F1ldDLOt6RbZaXkXGsBH2vY7dFjbK0oLrsOXsVIdYYXpE5RLIEZ2lOt9jflPOkKCDBC3Q3dm
 P6gsOLxhZwYxRfsF8OsZNnNJs=
X-Received: by 2002:a05:620a:258c:b0:8a0:fb41:7f3c with SMTP id
 af79cd13be357-8c6a66f8dd9mr1536272685a.27.1768825039611; 
 Mon, 19 Jan 2026 04:17:19 -0800 (PST)
X-Received: by 2002:a05:620a:258c:b0:8a0:fb41:7f3c with SMTP id
 af79cd13be357-8c6a66f8dd9mr1536268385a.27.1768825039101; 
 Mon, 19 Jan 2026 04:17:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:17:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:38 +0200
Subject: [PATCH v4 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-2-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2116;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZQ/HyJUBzLI4q25Cr4PA1zrRatPlEyyxDNqfDEZSTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbiDLFZ6M1k9Dzt0HQxU81lGHZ4S1WCvcUQ6j1
 i3M8BIIrfWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW4gywAKCRCLPIo+Aiko
 1cxpB/91qJ3F2Z6sVCwbnkATmecyx5/y180v0zAcduBX+E2Kd2Iox9l0bwlm7oingvUb/gMg6Vu
 i2Ft6jpcsEfxJP8LNm+ejWozDd2PUvErw06rAdh+MGdtindnXY8Bfhw9aI/ewgkNKFbK7daxaGu
 njAUPDg1TVFw4FTnWsZwd+DduBpK0ESNBKp/ER05/Lif+vyelQb/cS4XirEm2/zmnQslYYz9S0W
 M0kIi9vykXTmOvvFOY2t9NAbIpgBhKMXyyKWfkSLahLQqQkdH1b6DLZ/9luezikfV+Lbey88ugi
 zf3MqRbicIbWStMiKxerkCna3iTtmZforsH3q8yW9V/A+sPZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX4lI1P5A+d9XG
 Dn+lM2sscxU6zEG+lMkuTSPM90OxIyU3GhtGHyYzEpSDBjwxJIxgMaFynhbiDem2vLbRiuFeuy7
 RbdljdVIpSGq0xcG7bihpkOIgEocY4B1+Y9XKsR4KZ7O5IbeoszaXxNjIlDexL1kVEOu1UpcqB5
 nxCApf0+dtJNEZ7AwrckMEjyHxpDo8ccyvdzaZgoXT2s91rr/O8UiCrUZ2FiFHm2kxQXi07S1NR
 RDCyfyKj+9BWsKWQo3/+XN7NiccxnZaT/zv4yH3+HL49dm4e6MyMx3LSXrnr0yRac3rcNCljRc5
 7FY8UBOG/WmOmHAA0ImRO9pU7g2hjuwemIfwjQ55Q0ohBB7TklVEMmzgSTqI55r6o1Q/wWAaNzV
 RpkrjZVFP5d0J/TeCX03HDPP2g798F46FXbIF/Aatfb+hHdZcvh+0kAg5rRGyDx+ChaZKuTHvaa
 wSn3rrg6unf+M2K0Xcg==
X-Authority-Analysis: v=2.4 cv=H97WAuYi c=1 sm=1 tr=0 ts=696e20d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1unLKcHO38ebvhyrShMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: AuamJYdYy7z6Ce4J92nowRa1FUm0T8N5
X-Proofpoint-GUID: AuamJYdYy7z6Ce4J92nowRa1FUm0T8N5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102
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

As in all other places, the Highest Bank Bit value should be programmed
into the hardware with the offset of -13.  Correct the value written
into the register to prevent unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..b66c4cb5760c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -270,30 +270,32 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		((fmt->bpp - 1) << 9);
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
-			ctx->ubwc->highest_bank_bit << 18);
+			hbb << 18);
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_3_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_4_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,

-- 
2.47.3

