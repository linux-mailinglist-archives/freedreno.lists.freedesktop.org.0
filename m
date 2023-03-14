Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E366B9932
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2A710EA89;
	Tue, 14 Mar 2023 15:29:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9FD10EA88
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:29:01 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z42so16375041ljq.13
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807741;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/rMi4z3KYpk1VOXDtleM/+v4nMkai2X+NZaj5fWAot0=;
 b=GV/tteMajEXLkq7QRWvhGA9tMlhuJp/N2TPtYTY0YtLZQlTqkOTuIJ+KJwU0HqvSND
 xGSr/TymnSrZqWdGV3dGwJHCHSX1GpSUcYgNQe/A8PGmW7SKKznrUpk5ALLQAEMeG9rx
 /XG2RkujzSZ+Ciah38NKKTrq7vN5WRpzPlvjCFFRy/bNyFYfVt8Ef5kxiuulvIT59XoI
 vXAa566h15OVTxr35Iz+0GhOW2Nhhnr+7TqUu03lv+f2t6bBBKynYOG4NnrqcVpOFWKJ
 Zy+TVLtPGwdAQWe9s5RudeIOFXfuel+dLMcI4I3dKyvLmaAfUblEGKcxmRuzgLfwKDD1
 HIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807741;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rMi4z3KYpk1VOXDtleM/+v4nMkai2X+NZaj5fWAot0=;
 b=aqczJiccXIfgw0H8qM8V0h8AFntAUc2kAbZeQJWIzgF/o7Xw/zCP+4LGluj798BHZQ
 TqMxdMGyK61LJVm61iMP0FsOoIZCTORe38NVZNDLGDX6k4tQ4d2JwvOmggzDI1sKF9Cv
 5syXqO+xVsMP/Dhp8gBRaeLQxkxjVyQhN5JwVZgo+quSV5uobxW27bJe97g8LOMHqY0o
 WVt+zZK5T8c3aCv8nRGIPb/i09LqbHLNl0sV+6QvT26FP81Pq8gM8Mu1Pl+154XtwriF
 MLMyy96QGZa5JptJBLmbs0Tf63XaigkOBdUpHdM+gmnaWLq7Hwl5dRPIM9ebUuiUpRrf
 yecg==
X-Gm-Message-State: AO0yUKVhrETptFqmtDkLyZp5TxI9dFjgoqR6RPYDbv5qZsyYsxVC4GT4
 2uSyqXrBFprTxL+o/jNzQHhXoA==
X-Google-Smtp-Source: AK7set/JjpNvsvf8MV9aq3qP6wInMbwMOVpVCJJNFqgxlkKvmA4HfRtybbTeiYUBXGAMluTsvW8RHA==
X-Received: by 2002:a2e:3610:0:b0:295:acb9:8610 with SMTP id
 d16-20020a2e3610000000b00295acb98610mr12822310lja.25.1678807740930; 
 Tue, 14 Mar 2023 08:29:00 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:29:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-14-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=1852;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ZWxWz95kNFsOaOSTnUEHkUaKyj0DdIwF1Eu3I3PdtGk=;
 b=KpKsSEXRQhg/MQJAmTRWDZjQlF+2ofojhmqZlx7eSqwxni5o+DCOvcHjBxCErE0ijWM2Fb5c/ZYL
 mYoD898IBUAF5lQbLmP9ZrsLEqozfQMp+QSYOnwJjDo2iYl97Y1+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 14/14] drm/msm/a6xx: Add A610 speedbin support
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
(trinket) and SM6225 (khaje). Trinket does not support speed binning
(only a single SKU exists) and we don't yet support khaje upstream.
Hence, add a fuse mapping table for bengal to allow for per-chip
frequency limiting.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 27b96a335039..f9f1a6c50f65 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2136,6 +2136,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
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
@@ -2232,6 +2256,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_is_a610(adreno_gpu))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 

-- 
2.39.2

