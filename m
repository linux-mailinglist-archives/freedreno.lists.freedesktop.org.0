Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1319F896B
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 02:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEE710EE22;
	Fri, 20 Dec 2024 01:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JtMeDirY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B474710E008
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:36 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53e3a5fa6aaso2675759e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658115; x=1735262915; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7bHjE0IB/vPqzg640QI5Oh3Go2fZYjsbzOVZvfoGOak=;
 b=JtMeDirYkGiK+kjn4iFrjQW3YkwwR08jnZpMAhe6PAv9hLnSr0+HKBqp3BNcYNcqX4
 /ConfmGzB1/JcKr4RaUJ2J9vJFr33K2QW8YpmMPqTT8SyFy0X02lOrtI0H2hHb6B8pYC
 jzEeVhNu/LSpzTfeU2i0yRkq0/7TLqTqKDa11x+3FzAvfjswCkl/jMnsHRiH9cln0ukn
 Zsdw0HY1Jv3PIBSPVdPsRbxi70cKNze6PVCs2KnGmV8HIjPs7sjaClfheUvUHf8tYP8j
 UEmnKKhIjHl1zPdzubJAd54Prsqpl6n6c/xZs6VWky9WYjLmUBczLj2ppysCx7CiOVX+
 jS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658115; x=1735262915;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7bHjE0IB/vPqzg640QI5Oh3Go2fZYjsbzOVZvfoGOak=;
 b=sd7k3pxkf4g7s/EUkNwHQDNVRFhakn3g6PtKfSlJKsKf89MQDhXd0L4uzM0Ll0BD1i
 6EQT0SxOSuhRjQ7PplBP0TYLa2zRUyheZBV2i5ghDhzCKf64VttCw2a/VDxNtc1tvduC
 +2+tG5Rlp/DgHiuwgMkdW/PAwAVU5862rQqZh4CvwObAjQWXB/9dKBLvkfSWpvysJPfM
 Z1QJ28zbcpBacp5vnijlxyokqFxkX7juLaoGuPbaYMRKH0DC3TY/Xh4tyJU2spcgUvAm
 6ktMhneC1X5kZ0r14M6ZRfRfi13naBHtYFg+iXojeUJpJwwu2EWITH6MlUUJwS8Tf1wT
 sfKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp3lUa9My96nw9JxAv8DGBiQ8vhE29LLfL/hcn4MdvlT8lQ3jC10JFKYft+s0d45L8cvNIhNE+rlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuN4fDPpHZK0gfYFMsJbfAJU8I4VfEhmSCkp0jZuQImkyuys49
 57zBlSYbc+z9VShZefxaE2ArkiqdIoTsvDfJHEgfDf8TVrM/E4A7XbTeydlAgz4=
X-Gm-Gg: ASbGncuQScUtwi0HHaPOlygBM4bE3Seg0R1mj8i5P/JgUBtJUqzB5AxmhOmxb6VTgEx
 NfPZnXLnNbkufwfwM9jctHA3NkjirruRh9+HlR9vmBoHu3LuQ9zv2Ld/4inCIBlV7kor9AG8Iv+
 SE1SwEGWyAqjwEFQWxp+B79VnjAXX960MhpD7dIIp6bwX6wr5CxSFxy00u+m1JwQC8GM8blktnO
 nfZZ80UMoMz2tEWeUgHGXkSdz9gEH0qv3/cWi6q89fc2Ie4g4CA2bQt5dNogWQm
X-Google-Smtp-Source: AGHT+IFkoQ1wDgLQWAyIiR/AcniX2onayOceXrfk5sMzc7gbQE21NuoTAbl5Sm7gK6XKGLR3lUJqKg==
X-Received: by 2002:a05:6512:401b:b0:540:2247:ac4e with SMTP id
 2adb3069b0e04-542212e1035mr1554510e87.7.1734658114788; 
 Thu, 19 Dec 2024 17:28:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:29 +0200
Subject: [PATCH v2 1/8] drm/msm/dpu: provide DSPP and correct LM config for
 SDM670
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-1-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2719;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8xOZo6SIWZxsw847lHaBi8XDboA4fhIU/Ie9tsdlCGA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rKCbumdReXcE032tvX8uVtkUq/Z2LV+d0SUiebi6Ndt
 m7iKJbqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEPudxMKycxy78X35p3YJn
 SvLzV++eevbUwSP9647Uss0yfqXNsmPyhwdafeG2B+yaGHyYRSSMjRXLrqi/1wqU/i1ZqS3AHh5
 kH76Nm1P6Z+z/eI64ZQ+u997bPGt2rtkE7pd2oofu5GcHOVt8sVA9JsXrviqvzqp0fwCnTsrzxX
 PzU6oW3LVJF9nUHGIRb9VTLpUVJKAdbn/J63rnt/iSE2Uxa6Tr94SeOnJJZm5SvZ1RltjEQ61Pe
 N7PSz35y6DthOZ23Xm/T/yKiFlYkK0494n26+SZivk/6t+xsAmyW8RN9T+hWZ5vd/7bi4mTXG6I
 9Wnoqd8wm250y0tXSW/NF6e9mX/TPlhJiVW8dpTV4PIEAA==
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

On SDM670 the DPU has two DSPP blocks compared to 4 DSPP blocks on
SDM845. Currently SDM670 just reuses LMs and DSPPs from SDM845. Define
platform-specific configuration for those blocks.

Fixes: e140b7e496b7 ("drm/msm/dpu: Add hw revision 4.1 (SDM670)")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index cbbdaebe357ec4a82a3c3d950aa13792a1fb2d6e..daef07924886a529ee30349ae80375a324bbc245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -65,6 +65,54 @@ static const struct dpu_sspp_cfg sdm670_sspp[] = {
 	},
 };
 
+static const struct dpu_lm_cfg sdm670_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_2,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+};
+
+static const struct dpu_dspp_cfg sdm670_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	},
+};
+
 static const struct dpu_dsc_cfg sdm670_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
@@ -88,8 +136,10 @@ const struct dpu_mdss_cfg dpu_sdm670_cfg = {
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm670_sspp),
 	.sspp = sdm670_sspp,
-	.mixer_count = ARRAY_SIZE(sdm845_lm),
-	.mixer = sdm845_lm,
+	.mixer_count = ARRAY_SIZE(sdm670_lm),
+	.mixer = sdm670_lm,
+	.dspp_count = ARRAY_SIZE(sdm670_dspp),
+	.dspp = sdm670_dspp,
 	.pingpong_count = ARRAY_SIZE(sdm845_pp),
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm670_dsc),

-- 
2.39.5

