Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E1D3A132
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 09:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06BA10E3A8;
	Mon, 19 Jan 2026 08:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5nFLgAY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHg3EEhY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5964110E39C
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7sMc81742447
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 87X96O69HjPFMulPg1QR+SL19iQWTFSZSdfYbuNZu7Y=; b=f5nFLgAY1HDPwSHD
 z9EAo74k2884XGgOpgA4Ti84KPi8+DgA+VPSkYhElavI7IETWl7mWZ+uG7tY83lG
 3qgnB1M5m9Yxa5FYrUsNFwzymaWMyqgpuXrzxDwDo+/Hn9GIB8Gwz0GDTYXZ4/Nv
 C6KofOe1SxF/nSKY5VkWKZZg9GrJjhCl8R7uLzGjJ+/QauDAbBB2ErEinopnhqnM
 c+pic2gOvwWBuj5eBs71QbxsGojWfS0ulG0kT9PJ6dGTlji3tMVt86PUIJ6Tq1tv
 pc2OljToIW50KavPmsd8HHuZZkGyybAxlzR8wlsCdv6DCS5wi+ORnluXPWiK00/k
 6R/dxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu83xp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8ba026720eeso1246210385a.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810643; x=1769415443;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=87X96O69HjPFMulPg1QR+SL19iQWTFSZSdfYbuNZu7Y=;
 b=cHg3EEhYNpL9uO9xWrShXMsFt+DlxsaGWVfvaNRvtBAFJaRalaxhVmyzJ2YYFp6nHN
 qbqPaCsb9epcdAGREDIsCTM6k/KndbSV1jP+o8GloOtYou1HpNOSLlmVic7mH9B3D/T1
 PZ6N3s4lv3TPvkTZO8MBczZ8G8O+dR/lWKuvoMs0wcSlPDYVKSQDQey9Ly84gp9oNCDg
 r3C8lxfhA5vS5ch/LvgcXZuceq9Yl1QK6DXN/2WDdGQCUeSmg8YGYyz34MKxqw4zTyyz
 dXQt1NZtWnDFleokY0cgNItbNqqOEOxblkWpHn5UYggGiL3lBP2zdM44dOlvwDdipkIi
 PkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810643; x=1769415443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=87X96O69HjPFMulPg1QR+SL19iQWTFSZSdfYbuNZu7Y=;
 b=GDVGbEYiKvCWcGPwIhPMUhP48vRfm/fzmZJ/jIoh3UzwE7vUT2PtfhDZ0iib8e2Y9K
 uAYRnzKjL44SlRgjL0Ip9dPD75L04GrMA40uBuzfU6PR5My9/RLLWfyXR05XAkmpTChq
 CUBKoeWqOD9UlOoLgfa6cQhM0jMB9RSxSWis/0oNb0hUwm9EStT8vMkElYz/4M08aqjK
 Rz6x7+Fm16f/jmA7fv2gnfi0Z6ujOw8nZzis9kWJea49VLOl5LrIAtu97CVU8RLF5vJ3
 8Y+cwt1al8qzXIJ2NbHtKTxCvwpwfGtLZtg/ZL/sAH2NUrQSDpdv+FYuIRhAqR5kby9M
 mDZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQBqkQRd+HNxy/bB/5yfUhirMobE96PeT4xch8vtx3gEOTaqOx2Mp3v8hm18RkRd2gDFt6RScPze4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymMphqvmGb7l7Dc5/ekN7Smvnq3Au6utEPLM9sUKcx7rOCTodB
 SHdflVk7dML3LHKwR2Ecdt09Bb8kot2e6YytM1jMDTjD44tM16sCaqGskU+WvOU240mr5dlR/Ui
 71LTyN7vEtGK8Srlc7+Xl5dm2osPs6b70bZTIx0s3EpaOoh6WT5K3d9rIorBpWYGe/hXeJkxIAU
 sCBBY=
X-Gm-Gg: AY/fxX5Sqgi/NYo3t+7GwYwyE0yE+cU9XNDAVoJOsbFFQ88Ch6+iCAhoGk+OQjGc2kE
 kZDYyWvMmCirUDw8Xv2F1ikI44XDkwc6ykyD4CvZa0B+WGf0SW0h6AtPfNTs546fNfV5mIdLaYH
 lUC+kLQKf3lxIdSgScJPXw7PARNX4j7qGFqz5W71rsTKF7XbQjLLLtiRMrSAF9JRoBMbiIurXvg
 Kbo9KNnmLzpDbJbm2Va9iOXkdvGchqyTSwKB+yB/V3cDiaYzbVwpB4Tg4HSs6+veW+RYQOM2buc
 MYN35mpYDa5W46IjfK3wSgWAc4NUFnShPBqH38mDN5z8PH0sAcxxN27YaAYmaDwg0N9qqVY2ZUZ
 wRfzzA1pw4AGGwNl+oa2JwZkvCScbYWqz8dShlGY7YbS5/PE9ywaJH02W0O0StX0fwzzE6cGBoH
 XA+uviTfoWJL4tUaeSvxcKLjQ=
X-Received: by 2002:a05:620a:4049:b0:8b2:ec1e:fe30 with SMTP id
 af79cd13be357-8c6a6768664mr1454263885a.57.1768810643256; 
 Mon, 19 Jan 2026 00:17:23 -0800 (PST)
X-Received: by 2002:a05:620a:4049:b0:8b2:ec1e:fe30 with SMTP id
 af79cd13be357-8c6a6768664mr1454261285a.57.1768810642692; 
 Mon, 19 Jan 2026 00:17:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:17:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:17 +0200
Subject: [PATCH v3 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-4-34aaa672c829@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2955;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9rYsLNuEACuzhywI0tRJ339OJWdDN6xkayUa/9Ma/Po=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiLLojkLl0l+zM1+h0l2qpcUidmSQV1rw+h9
 D+WwgtfE22JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1cGZCAC0A7tmbVhi9GlkQf5dplKw2Mi34dw/Bqiahw6XorhTYT5UCjmIMBhkwgtvJT7mPbwp875
 gcQKMZmC5tXIHeSNPStlBtQzk9Q2Ty1NkjB+cLjU37G4qdcdVxr6ppbhywf5bQHsDqPdcTicSEY
 uerl5IVtPd0pqryeyTuOTUvqQYo+pllR3oNpC47OayU2ZwtENSE1HVKR5qFAdKn4SzcWy9ty7DZ
 /ksQKWtv6pOGTrE3efVoZfpR6wU2ZbJ9QBO0p2tp4LDJwnVbby7HNZu5gWawdBYHCLR+1xS6UK9
 XPTC1wSjeiO0mIsiV1e4WZvuGqkiCLW3PWl7x9lEIvEXQzxx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfX85oLXWQJLs6K
 PmTTKLag7uHSdxd7NRck9ltKqhL+XALaVEyAG0NIpasSzYlIp/d9Epn+BbZpwtzGdipmFurkjY2
 ioEOp3Bv4ljAgS8JNQqwJYFi0diooxhoK7u+QKrLREvb758Yij7o3QfUeLQbFbJb2+pZG/vVulv
 REayo9LzjV/cMrQHopm0SkbhWPZD/Rk4nyYt5idJVDZTOpUC4Si8ycOHl9NTZTjojOHu7Rz6hCB
 pUGm4FP5bY+6Huk5k0ev83EiOaGE7ZH5zUDSpXEBMA5KDvj182j3p/JHoMdG+aj0S7lohxQmEQ1
 Zz5WZsNRf84NhsYwz2i8Weo6hbHHVxwkF4tLA+FcPJ8OMbmdScarTqpZG0hFzfJjZGVcvx5MISK
 E99c3Hw+zSsWOHFJPkAL6tww+9gaGMKogtyxhArK6IebJAzZy400oBsv/MRcm3ZUgFfymwjulFX
 MOHs31fqf4JH1yGkjvg==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696de894 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7FpWx5GjbivZIX0HvvoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1EoZxz3Lj6SXFESdeQsO2TwxKwCPiZPD
X-Proofpoint-GUID: 1EoZxz3Lj6SXFESdeQsO2TwxKwCPiZPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190067
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

Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
than 4.0. Replace switch-case with if-else checks, making sure that the
register is initialized on UBWC 5.x (and later) hosts.

Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 44 +++++++++++++++--------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index a99e33230514..80a9fb76b139 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+		u32 ctrl_val;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
@@ -286,30 +287,31 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			hbb << 18);
-		switch (ctx->ubwc->ubwc_enc_version) {
-		case UBWC_1_0:
+
+		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
-					BIT(8) |
-					(hbb << 4));
-			break;
-		case UBWC_2_0:
+			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				BIT(8) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_3_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_4_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
-			break;
+			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
+			if (MSM_FORMAT_IS_YUV(fmt))
+				ctrl_val = 0;
+			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
+				ctrl_val = BIT(30);
+			else
+				ctrl_val = BIT(30) | BIT(31);
+		} else {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+			ctrl_val = 0;
 		}
+
+		DPU_REG_WRITE(c, ubwc_static_ctrl_off, ctrl_val);
 	}
 
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;

-- 
2.47.3

