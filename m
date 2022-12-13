Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE5E64AC5B
	for <lists+freedreno@lfdr.de>; Tue, 13 Dec 2022 01:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEE210E2BC;
	Tue, 13 Dec 2022 00:24:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD9A10E2BC
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 00:24:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id z26so2304815lfu.8
 for <freedreno@lists.freedesktop.org>; Mon, 12 Dec 2022 16:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EuRIOsbxJSRJCVkuwOFtkE5bn27vzsbdYBn710S1tsE=;
 b=lmwePmqSEsF3OnAp9cC6PduAdpMwYQXJYh2fNPY863g5M9oD9ZWSLPEBTqvp3ngl4o
 9ySGQONxcxowsk7bT5fAzavUXJFT2Mm+pOmUafAwshUkw50rBcmP2m1ZHzBfyWvUtz0Q
 sDk7fOuV3OjsEv1vhYNCb3FY7izl6cNJg7dHscP3ev+wJlHMdNFYNc71G4Ld0ybIzEEi
 0F9Grk4PBB8kEWXbSDxhmnT4EKJ/XMDY8X+odIVwZaTSvKTInZK6MGwuMXWXvBkbdVyf
 nALPrAHoNvXCh7amnOwUIcnLg6b5FyAoJ/kvP8QNoNHNogg5RzE1a5yhoyrkJJx0HNvp
 rTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EuRIOsbxJSRJCVkuwOFtkE5bn27vzsbdYBn710S1tsE=;
 b=6VQtShoPITgZEZ+gG4FIWhv5HZhXZRN92g9hV0Pim2glMTtIAGlFl0ldnJkknGW9jo
 HOwY+WcMr83TgIgLBqeA40stcnX23C1VIDANYnSlcn/oV5X0eVFSMg/CmNJ4Xpnqbn5f
 fbVJBtwcu9dqtRdwIk/wLiTvAimwiImtL8SER5sNhB/mW6sEEQ6hWzF+GKpsbRttEcMf
 SQZmplHSmlOC+mJR1S6jBk8OS0tQVP70Zl3RDnVRp6UNidq6zkyK4R85URDPK+kQS8hC
 R1ygpAd2nw9jm6JO5+zwbFeqTseU0u3SnLapBiOECwSvSd13K++R+II89O55ghlLCSgk
 q3PQ==
X-Gm-Message-State: ANoB5plR89u1YzGOhkAUbNpZyiI5tYh8G8JSp8dBXR5e3+LEpvnFbe80
 DGRm9FZX2oTS5X/25hNR9OuCZA==
X-Google-Smtp-Source: AA0mqf7FsYGwTEB0R89kNgfKs8NWR0YiZJmq+AA0ekGPv+hZSJMEhTrIOyi72Pmtjg6fC0kbmH3mpQ==
X-Received: by 2002:a05:6512:150c:b0:4b4:b8fc:4ac5 with SMTP id
 bq12-20020a056512150c00b004b4b8fc4ac5mr5905858lfb.3.1670891072964; 
 Mon, 12 Dec 2022 16:24:32 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl.
 [83.9.1.44]) by smtp.gmail.com with ESMTPSA id
 m23-20020ac24257000000b004978e51b691sm137352lfl.266.2022.12.12.16.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 16:24:32 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Tue, 13 Dec 2022 01:24:19 +0100
Message-Id: <20221213002423.259039-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213002423.259039-1-konrad.dybcio@linaro.org>
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/7] drm/msm/a6xx: Add support for A640 speed
 binning
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for matching QFPROM fuse values to get the correct speed bin
on A640 (SM8150) GPUs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 36c8fb699b56..2c1630f0c04c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1877,6 +1877,16 @@ static u32 a619_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a640_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 1)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1902,6 +1912,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+		val = a640_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
-- 
2.39.0

