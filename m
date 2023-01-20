Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B10675B1B
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 18:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE4610E37F;
	Fri, 20 Jan 2023 17:22:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6668510E382
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 17:22:45 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id vw16so15628457ejc.12
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 09:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=30fedTZc83Sm2sS1XquRpkhmYzf9pEDy2MIMxTC2sH8=;
 b=n9ESsmpquDCARkLAYw8VIHoOPjt5o5luYSoGg3/ZbL6gJVQIHxt8RS4CHZme9E4L/m
 Q5YWyf9dZpop1oJCQZzL6djrLzN+jjbP0wcSheBxibusL6zAGPYuYGCsfrd8ibRdOTpz
 D1DL32AEM20rzlRu8zkrbH6kzCynw6P5E/478OqrrZhFVgaG0cFIoyTCXPoACwtbi7Vc
 UvkT5e7ckDUM6ACl8x219OjrmaXqvg5wM48Uf62m3dX3W1NwgIf2WOcX5ANHxrDKhD7w
 IIXiaDgZDaWTYAuI+9N1FobbysIPMM8cX4sKtvloriJVvnBEicE66AKNOCdnyG0DQOoy
 slOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=30fedTZc83Sm2sS1XquRpkhmYzf9pEDy2MIMxTC2sH8=;
 b=oSyvBDKvTPVhW8KkmkoWh2LWsyU7rJdD8qchArLmrrifklMAG2UL41CQnGMMSDk8D1
 2eJ/n/aBXP2N7lT/hr8kG7/jtYaQzYjSDWZGuK4X67Dmv/MJ0QjGp62woWmX4g4pSsYV
 wUEc44aoey31gYAlez4SqELGeCSaGDx0xmZublbipRdg51Y3sJUahScwltF4vw5LD+fh
 Ok6TO7ZReAGAEFa3Ou86yq9mnLQJmNstKDMgE2mD4A3i7tZOdUAke3sMwnttHwAIGvL7
 fXdIzz1/aUUoALVgwtou8jOEgXKZTg4eYSjpQaITakNjVAGqJTFeJ4vxFA/dNg9jjxmf
 p2qg==
X-Gm-Message-State: AFqh2ko4yCObV3mJC6kwXDdVZ81NF6b2CMF3I4Zmrq4NtB+l9zDuHRzk
 1qqdscdHGlEYQqOwJBQPvPOGuA==
X-Google-Smtp-Source: AMrXdXtxZiKqmrJNEiSXFu269RBrI85UAuiJlqn4HLOioNg+vq3aXiinKmNRgKPDkuI8uVKOrFWhOQ==
X-Received: by 2002:a17:907:1257:b0:86c:a3fc:597c with SMTP id
 wc23-20020a170907125700b0086ca3fc597cmr13748446ejb.27.1674235363924; 
 Fri, 20 Jan 2023 09:22:43 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 s17-20020a1709060c1100b0084d21db0691sm18313857ejf.179.2023.01.20.09.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:22:43 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Fri, 20 Jan 2023 18:22:30 +0100
Message-Id: <20230120172233.1905761-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
References: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/5] drm/msm/a6xx: Add support for A650 speed
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for matching QFPROM fuse values to get the correct speed bin
on A650 (SM8250) GPUs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0ee8cb3e490c..c5f5d0bb3fdc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1894,6 +1894,20 @@ static u32 a640_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a650_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 1)
+		return 1;
+	else if (fuse == 2)
+		return 2;
+	else if (fuse == 3)
+		return 3;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1922,6 +1936,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+		val = a650_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
-- 
2.39.1

