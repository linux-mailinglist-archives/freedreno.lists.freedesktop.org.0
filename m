Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68DA4A9F0
	for <lists+freedreno@lfdr.de>; Sat,  1 Mar 2025 10:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA3910E167;
	Sat,  1 Mar 2025 09:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RkeNhkfO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DB910E16D
 for <freedreno@lists.freedesktop.org>; Sat,  1 Mar 2025 09:25:03 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5484fa1401cso2590089e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 01 Mar 2025 01:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740821102; x=1741425902; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0JVwBbchrlGfLWd7zeEe09mlkUBfIcbBf0ReoU16PUE=;
 b=RkeNhkfOfJSdVJu/uzlhQ19S75M1pSOHlsw5iinR/4l9gQTTdDnPI0QkiU7Ac3or4Q
 z82lROBjzIX49S/cEC/jVGV2VLEnvSRYppDDl9cwmWUqnf1mlu1r+OYslKXowqf0v4wf
 H7lClAWsFqJPlMzgWrjtvOPCiL02FN6eSvRdBu2dQ9id000P4ii2gocadVLzp+iG/iz1
 2txVb1Ay4JXl1iggN3xm3Q617sFSU9dFhZF5fQ4WuwmW9OzAxsQ1VRp4LNVNFZeF/ysv
 C6PThbUwSID+NnAr4SnXEE7NpJf8K/+WEk9mg0lSxj3721NA3JAjHVbs4+I+YyeuyMSg
 Bf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740821102; x=1741425902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JVwBbchrlGfLWd7zeEe09mlkUBfIcbBf0ReoU16PUE=;
 b=Vdsp/V7E1fXzDv1qJFYOG+2PhuvD9gZFk0NZl/r0RcadR5VGX1ADayTo+xfrUSF+MI
 PLdNREkStmal7+SUjJB1XM7l0n/uT1PE2tW4IbV8Zh1AK43qhogQTlASvhwsHRVF6Wsy
 AcgycDlk/4tHcsjwMuFyu0/gARexSO1t7EX47LQEbRc10QhMIBT61Grf8eIMaf8i/n07
 3JubMGKTiwxX0efFA4A/3wv+JRsz301azRarZHxFb/6UrZckvNd4rfQiQCZkN5cP7FdJ
 tjPL/tKlgrNqXaPmvmRYpwFETbONLKznY8SoccqAT7wZxV7wPz5211pvFJkt0aDqOZg0
 sGPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKkk8jBwBQQ4d1AmzhH7g7UQ+0Vxq2tGFyWLwL0+AFvYfCaLqvQg64I5b9S+4mU6L/st+Kt20S+cw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyonZ1tnY6T8LseTZE1yJgWkmV2fdwcRUBGdSK9Mg7eYEYbv+xW
 yG9hHdCAkzBI8W4GXqVWhJgUbsNakListH+wE5fUuYiZLhjZ4MWrqOtFXp5E4NTQFDQ2BNCRvZO
 rg2I=
X-Gm-Gg: ASbGncs8E402hg1WRt9pNyHXCgpwZB+oDrq7NvMpzILEljZvZsuGkcQJHFPPKKkLN3k
 lGZmqHE+0F0dgHEwYZsrIADbCPj+YMLxAFA5wC+wkjCrQRVewoxCImyqoi11h+zsbYPH1VuWBGC
 VPU8NYwyYIlvY+GifluxSG1v0+4YH4YTdwxLAMf/Cr3aANAphIV6/yiz2QrodJMq1cfkFq6V1Qj
 n/4z3UpTITkurfwc0cgKJD0RD7uIZWA6+Trfy9knw9r5/d9T46Hmvpbum26QQ2rvNbMRe5LOsbC
 Q0WVdw8NKdno066+SC8o87g4qP4dTxjAhHyvUguhBHb8i9HVBIt3
X-Google-Smtp-Source: AGHT+IFyI4K4ofy4rt283J1E493B2LFgM14L99NpHlb5eH+sLu5qjueAHc56DM5e2fZC/5lr7A1fIQ==
X-Received: by 2002:a05:6512:158f:b0:546:2ea9:6666 with SMTP id
 2adb3069b0e04-5494c37d8b1mr2545975e87.34.1740821101846; 
 Sat, 01 Mar 2025 01:25:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 01:25:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 11:24:54 +0200
Subject: [PATCH v2 1/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dpu-fix-catalog-v2-1-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6iPuaAjsYMeQVkUS24obUEbYrmaOHTnqfR5LGKvkJrI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwtJn4QALW4Yp9jHaAiSTff5oWqqXJrWsumAXS
 yBUql9GT86JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8LSZwAKCRCLPIo+Aiko
 1bKaB/0TSkQtXBypTrGIYYMHCArbLA2WM5wcSRk1VeH/6Oy/jD6i8npth08Pb7n3qqv42TSGdFP
 9Ah5kV7z1VZiMxs16n5Zqq/sUNCXg4gVnuuNUTp/Q0RQGDZdwMyhANgV7PFR//V6/UVDw0BKhub
 t8ehERkXMhY00pPHTnpuTRlqvUkbpsWNx8xy801MR0qAm4NSJ9PFmWbiaa7+zbDlpSxoU3g6kog
 AlLCfhbQ1mQpBiCGvxrFEvOayxMX+Qra03tg/D9jtulkr8Qyn52sfGmKsoMENLpc7PBh5isfGBE
 w1iRAIAElUBfHMniHEFWvPnwro0GxfbQZM5s+GTcwVjZCYk6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The MSM8937 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index ab3dfb0b374ead36c7f07b0a77c703fb2c09ff8a..a848f825c5948c5819758e131af60b83b543b15a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),

-- 
2.39.5

