Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FB465AF2E
	for <lists+freedreno@lfdr.de>; Mon,  2 Jan 2023 11:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E22810E2E7;
	Mon,  2 Jan 2023 10:02:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E187B10E2E7
 for <freedreno@lists.freedesktop.org>; Mon,  2 Jan 2023 10:02:05 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id g14so28609188ljh.10
 for <freedreno@lists.freedesktop.org>; Mon, 02 Jan 2023 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uUvNSUQPHRgkJykKaq60wHpn/k1eJNyp+U1eUmaZ3RQ=;
 b=iCYYVJ9YOn2urXXQ5oAg/nIvLhmW16eVFVswPtvi7YU1Ol8ahihnipPCpixMxuwB5k
 Dib96+ylAQwD5TvlJjvjfGBrCvwuoG/tH7K7xfLL226pY21IRFTjZYkeP0qhm/idmdz0
 +rAuYkYaIFdtYC2JFVRITVbmbsRbmWbbUlKqzZMqmY27YRwKjRIqGIeQX7IwnX7FG+Gk
 UMfVAzA9ju+x1Ow+GuL/CGvt7dEIGsPXQzuEzrMktBdJ/xgFBfMhFfKuB/wGz/NqB7zH
 fWRRpJc0W8j3jVUa8kC0BUJg1kpQ3QR/KgAh9QfmAELdtaOkRNQJlO3/zRAoLFTedp72
 jq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uUvNSUQPHRgkJykKaq60wHpn/k1eJNyp+U1eUmaZ3RQ=;
 b=7JAi/Tr21Vx6ppKwfhL0zTVSJPQVD8lnpA9OGDJFCATyY9NSCXEMP46uzLqeZH/pA+
 Oh4Y33QG2I2VpfO16RfUq+tDLhQTH1k7sdWrEFhbT93nkcCnqUU/C55rwlMT0aSMJAY5
 7MUxwelbmJa05UfqynrNdtz9cJ9bQRNICj3s0P1owzjlr/fFqUZVB2kWYxK+Lp7rsgES
 t4W21If+bAUTuJ1WxDQxUdOA9OyoSEVB3eLAeLwgbAZGDVX6s4MBUtuUK+Isv2AWTYFW
 eNugsjL7refN2GnQwZoMZiTpQAwS4WE0e50+VeyDc8ZR+0D83JDl5uPf0p7pfW9q0eE8
 Qe/Q==
X-Gm-Message-State: AFqh2krLxxEeMA76B0gmVr7l/7XOMgosjNsrRISP9VsblUPwXw/nA8tA
 jf4T85D66u/N/6Cz1Zzv7O0bRA==
X-Google-Smtp-Source: AMrXdXvfLsZkvxPPh8PFHQUMvkJ0H+nafczyfPXnm02C8MEAtMKQUqjKxuCdl2/VXh4468x7Y+mGOQ==
X-Received: by 2002:a2e:b011:0:b0:27f:e512:f2ef with SMTP id
 y17-20020a2eb011000000b0027fe512f2efmr2463676ljk.44.1672653724222; 
 Mon, 02 Jan 2023 02:02:04 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl.
 [83.9.2.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a2e9a95000000b0027fc14cdfa5sm2132001lji.42.2023.01.02.02.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 02:02:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Mon,  2 Jan 2023 11:02:00 +0100
Message-Id: <20230102100201.77286-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm/adreno: Make adreno quirks not
 overwrite each other
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
Cc: freedreno@lists.freedesktop.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

So far the adreno quirks have all been assigned with an OR operator,
which is problematic, because they were assigned consecutive integer
values, which makes checking them with an AND operator kind of no bueno..

Switch to using BIT(n) so that only the quirks that the programmer chose
are taken into account when evaluating info->quirks & ADRENO_QUIRK_...

Fixes: 370063ee427a ("drm/msm/adreno: Add A540 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- pick up tags
- correct the Fixes: tag

 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c85857c0a228..5eb254c9832a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -29,11 +29,9 @@ enum {
 	ADRENO_FW_MAX,
 };
 
-enum adreno_quirks {
-	ADRENO_QUIRK_TWO_PASS_USE_WFI = 1,
-	ADRENO_QUIRK_FAULT_DETECT_MASK = 2,
-	ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
-};
+#define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
+#define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
+#define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 
 struct adreno_rev {
 	uint8_t  core;
@@ -65,7 +63,7 @@ struct adreno_info {
 	const char *name;
 	const char *fw[ADRENO_FW_MAX];
 	uint32_t gmem;
-	enum adreno_quirks quirks;
+	u64 quirks;
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	const char *zapfw;
 	u32 inactive_period;
-- 
2.39.0

