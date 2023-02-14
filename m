Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5926F696BB5
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 18:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB0F10E950;
	Tue, 14 Feb 2023 17:32:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6B710E955
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id mc25so4564535ejb.13
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7mTIcBAt9xKjMEqRxhkyslwv9ImP8F3/zPYA7ZjQgc=;
 b=Zz7CuboNHAWxl6q+hJmpjx8lB5Xi4d+tF70/vbE9hZpGX4KJoN6E5BaaBvsVppY8Pb
 hNt19jDlIb5ybaLwQbw+EF94Ui2RXSrCuifWL/raIV65/nFlfgMdo5Cgn03hTdj2eVGm
 vdIZEUjRbQMxzVTmE5dJmj3GDBysMaF3EaCu2jFRr8x25qYMIeEReBOW4N7HttWuABuu
 o55GXFTzD3TgHopbKSM2GYHhzxk5SeCQJNydS/hM+b/btdS/QqwjTUvT9jfN5fAutJM2
 RcwRBnn1ddYzEWZ7TXeBF+ccbCgkbpIT6qX/sOaqFy65akDck6mtTW/Yx8ZLj4enlPTw
 0CuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7mTIcBAt9xKjMEqRxhkyslwv9ImP8F3/zPYA7ZjQgc=;
 b=FV1BjNogTqmd1ydybQ1Y1RQjEsvQK2oB4k/9ko/u6Q0TWOpoFFKcg9uLXvral8siTz
 WV1yYc7UbzHvJGDvZn89ABLf7WBWA2H3q3MBl7uEyqobznmm/NqgaXGXcMwUd7y8z8Tb
 sbuHmt3kNz1AiDtMqXqwZZCRH8f8osHxBld8m6LdnnHvFpWUB3UdF6PzhW6ZOX2/GXan
 cjbv3lqmTxwsib/EKJInLbwXqacgyWDdbxmTqr9Jj+AZV5s5yTPdx83rfLTFhaQusCMK
 K0SWbYti3+KYQIqQQOdrQD4pCEXjiKTRC1HtdTR+Nkvditz47cPRJDI/2xx3/mOl/BiH
 bjlQ==
X-Gm-Message-State: AO0yUKXxve0hKn6iQ+XgoG0+g3+hlI0XdzhvQl03Inw/GliN5gpf62Ov
 twLAZO0etbp6GN4bIrc1ENBbJg==
X-Google-Smtp-Source: AK7set/DxweF1llsDQScksIm/PFWy8dJZGhQvVBWx3ajlHfc3A6Nzdeu/HgS5D5G+hAQNBO/AZb1tg==
X-Received: by 2002:a17:906:3b87:b0:881:a3ec:2b43 with SMTP id
 u7-20020a1709063b8700b00881a3ec2b43mr3475091ejf.56.1676395953957; 
 Tue, 14 Feb 2023 09:32:33 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:33 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Date: Tue, 14 Feb 2023 18:31:45 +0100
Message-Id: <20230214173145.2482651-15-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 14/14] drm/msm/a6xx: Add A610 speedbin support
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

A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
(trinket) and SM6225 (khaje). Trinket does not support speed binning
(only a single SKU exists) and we don't yet support khaje upstream.
Hence, add a fuse mapping table for bengal to allow for per-chip
frequency limiting.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 94b4d93619ed..f2679f9cc137 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2082,6 +2082,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static u32 a610_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) three SoCs implementing A610: SM6125 (trinket),
+	 * SM6115 (bengal) and SM6225 (khaje). Trinket does not have speedbinning,
+	 * as only a single SKU exists and we don't support khaje upstream yet.
+	 * Hence, this matching table is only valid for bengal and can be easily
+	 * expanded if need be.
+	 */
+
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 206)
+		return 1;
+	else if (fuse == 200)
+		return 2;
+	else if (fuse == 157)
+		return 3;
+	else if (fuse == 127)
+		return 4;
+
+	return UINT_MAX;
+}
+
 static u32 a618_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2178,6 +2202,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 1, 0, ANY_ID), rev))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-- 
2.39.1

