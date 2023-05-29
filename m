Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C1714AE1
	for <lists+freedreno@lfdr.de>; Mon, 29 May 2023 15:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC5C10E2A0;
	Mon, 29 May 2023 13:52:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FBA10E2B7
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 13:52:53 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f4b256a0c9so3522666e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368371; x=1687960371;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p58CUVqLSR0Tnh+edVFp6/c85yeAdv4ChlUd6Ivl4lE=;
 b=a1UO99vkagOh/S32zwT51/eizQof70iXiTgLznMSd9CsXwBvvLDZB/WA+Zjzs2yZud
 d0SYoJ1slw62ov5Xq/oh78Is5q/UPPENMXFIg5jr1lXVQ5NjoB67WwFF/N1fevNMiw0I
 qqkJaOxV/EVstxkTAK3dr5Uzgr80sycyPWtrMwP2lPn8n1LzDfWD7hhPkeWxE0VOyobI
 HSZmq1v9vwFoNpbJozETEAFSi9fk7FziFIPaTLE6tnvRB1HLVz4o8hUHo3QqbtCyTooL
 GS/Gga6SI7S3Y3ZHBGMucZ2dtJhkObBcLi5S93dgl/mzvRScLgjc5UrA83nuNBXiq66P
 ZHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368371; x=1687960371;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p58CUVqLSR0Tnh+edVFp6/c85yeAdv4ChlUd6Ivl4lE=;
 b=d9GHxaRnFI9xZg4x4/FpeVewUb972dI5ZjQn/ZBMGr3tJZBAALKycUZD5XBOL6IDDa
 SpSnyM5PGkJpnQC6lpveHBDwbnavKqx8D0qfwOfaojbGnaOD/+wU1lwaomb7PR/C4hqP
 apM4+F4R8tBgWwypRq3ixV1dX/y71OeUfUbgp1xa7QvkvsN6LiYEwW2C1UEgVjezk5++
 kvA+YWoik0zwaL65V4mDSkehk3Sdeqr+jAtT0+uPnUg3td4I2cSgs0s+2p5rDMSb1ppy
 DKH9PqNtCBmBrLZ898fLNcG0gLXbHtWFFRUIyIWj4kFkX3M6M5o5WL6w9IxWiLO+Mb1A
 6Bbg==
X-Gm-Message-State: AC+VfDxgAanz7LLyGOOuEkVpiyXd3iAy4ca12dGCEc5SiXnZv0pVeap7
 bGV6aA2xpolULr34i4cnHHHiCg==
X-Google-Smtp-Source: ACHHUZ63Z3eJuDnAvuUI83xqUyXnOhx0Q6NIV16cLmP/m8VuJGE0yGBfdp7h6Ltsv0vqYIBRm2YgEw==
X-Received: by 2002:ac2:5212:0:b0:4f3:aae3:aedc with SMTP id
 a18-20020ac25212000000b004f3aae3aedcmr3287507lfl.9.1685368371519; 
 Mon, 29 May 2023 06:52:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-18-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=1852;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XyERlWDTsfWZFtKFZysYLOHv2ihqt9U+AK25cPIEZ8I=;
 b=2n8OuzD0JlvWdAYJLyaK9eKey1cglmNCSfu2QjRZowbgEZbyhz4HvTwrDp0kby9LRkmISLbjr
 Kcr2krpAbHsBJvpoNGqk/mYX4QT+h2FMVRaFTxDXcCH1aHeS+I5R/H0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v8 18/18] drm/msm/a6xx: Add A610 speedbin support
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
index d046af5f6de2..c304fa118cff 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2098,6 +2098,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
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
@@ -2195,6 +2219,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_is_a610(adreno_gpu))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 

-- 
2.40.1

