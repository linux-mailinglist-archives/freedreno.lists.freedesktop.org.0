Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114BF67CFD2
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 16:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95A510E154;
	Thu, 26 Jan 2023 15:18:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A03B10E14B
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:58 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v13so2122788eda.11
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkFbFkSGCftg9vK3KhuB5C5KHQRRp5s7MFTXq3oSOXU=;
 b=Jtg30tmKUbLWZISWIXPATPJyGvDdzOARaqfHtjngPwzKZTLT00A130F95I8DgGT4Y5
 NI+FaLpiGNIYbeDMxLkmR3sIMjno9RV2nKzKo+kAkK6W6Al6xOCR2yaAcBKNvP/EyW+M
 n13ki4W+c2ATtX5UkBBkRVurGbxF64vLO1xP2f5iFFmrpAnwwZuoEJjp4ojrv/bmBqvj
 okaGgNIUX0lFkGEj0KiLfBN1RurMYenCTFEuRd0EKEGgEXgdPLMHSOKbrSdtbVZqpYsk
 NVbz+AiJwctK7n4Z8i1+bpL3ytt0IDEvBx2yVeuF3+QuptmVtEoWplRZ+zp5qdlQskLy
 E3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkFbFkSGCftg9vK3KhuB5C5KHQRRp5s7MFTXq3oSOXU=;
 b=CM54C6G6iS0kn7pAlmjfliZ02QL/BGLnLhiNN6zorIWoxkvEbL3wRE2f9vcMII11Hh
 crpSOfWo71rUAAXYBAZN1/RX3ijf+cG6C8wwY1vsXCEv+AWfTdVM9t0wfY2vPJd/yDDz
 I6mtJI6uRfXvuueOE5KfbHXfF+cSYad49hdvmR2dp6jPna2aZVMayvTHvXkCUIL6ZuFj
 T0whbvOXFsl0otw87s02jt8wdbsZfUah/Tv7xFMpPBjASrTX94LLyYAWWourBWFA3e29
 aNLw+w/PaxI3H9Cc8N3UUaD043GcZgKyQgHZh7umtXH8Ua6+GvvrW+XFFRCijjpMW1+L
 dg7A==
X-Gm-Message-State: AO0yUKVvUdFZqdEfC6xiNfKAdEISnmufOsAd65WlKlxuI4ozMIlxNXKo
 WaF2YianI0v6Qjxcq0cWPvZU9Q==
X-Google-Smtp-Source: AK7set96BkvFoMp+uw6C2kTl76s9zo0QxmZus/Wf/NGW92Dg51mUoa7BnK/qe7pjMt3PITcVKbTnNQ==
X-Received: by 2002:aa7:cd65:0:b0:4a0:e415:d39f with SMTP id
 ca5-20020aa7cd65000000b004a0e415d39fmr1699657edb.41.1674746278103; 
 Thu, 26 Jan 2023 07:17:58 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Thu, 26 Jan 2023 16:16:16 +0100
Message-Id: <20230126151618.225127-13-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 12/14] drm/msm/a6xx: Use "else if" in GPU
 speedbin rev matching
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

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6d6b71306ee5..452ba32699b2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2150,16 +2150,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {
-- 
2.39.1

