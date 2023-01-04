Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9F465CF29
	for <lists+freedreno@lfdr.de>; Wed,  4 Jan 2023 10:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362F710E510;
	Wed,  4 Jan 2023 09:08:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859A510E504
 for <freedreno@lists.freedesktop.org>; Wed,  4 Jan 2023 09:08:52 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so23514457wms.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Jan 2023 01:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WprIPOLxeNcgWUttCw+DqHxkS2tICIGh8IzytcEHCm8=;
 b=aOBxY7T1bzKenUwbAgBCiC9qyOhIhX5SgHS+q5PYj5kOxxynDGiq+l0l9OkMygd0tZ
 gVIUj6PI0VOYVunHIROncM2hceMnJRmwA4eZwpKnz+88nNbtzQesLbD5JhK89tzmEMzn
 gflz4qai5/nDVsQK3pKSGv15ATF/6RhdCh2Zt4aNnBRFOdFqViTIYsPo7aeHdekdkgRq
 QzFr2H02mgop+dfr0b5m2TnkHi8hJFjDIuHTBwg7UCdRTzx9Tf79SWj6nz0S/1H4caVR
 qO+qXN0yMNATfLeQCaubbvrUTVystcHg2phdTo+JQ7wur0MjvrwjAU+cq9qDl84iBRnO
 5Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WprIPOLxeNcgWUttCw+DqHxkS2tICIGh8IzytcEHCm8=;
 b=g2mGf4kdkUnE13cd/wFZxJ6e+Wn1VrJwc6ywTiNFv8JeWSeR3sBJIJfPd/L6aicUOV
 XsCGmjhpegCYUytYGAobNFMqw3d8Gji4KJVTevA06NuOCrHRdhJQ3q6SqBs7ESWV8xHk
 oCSjjF6k54FPaFIxd7HjMTw03cQLkd2mNsT0P0rSu5TI7/yrRY0q8ZtcSAgoxfk7ytaz
 IC/CgUNJS2QlsqJEmDNZmk8/cC5T/jRAaBTpYANch/iGl5pf1x++lPun+ZoqsUH8jO3y
 KKQCvnB5fvJg+bueGFir29DsyirXlDrhe7agwrfBNRxlzLv7AuHbIiZu6e5r4Eexr4wY
 TsuA==
X-Gm-Message-State: AFqh2kpx9AcevkvNPrWABs1aHnaAhxo/I8cOqJ5lpiMwQbhK1DP2P6CO
 roKSzP6PXAxsX5pZelorUYSExgcSukT5X/rM
X-Google-Smtp-Source: AMrXdXslBasQ4LdObbKLPkGGFzFif/3uHl/3JGpxTA8fN4C2Sl34fkMwGmjVnZ6wwIzofFscQhqTjw==
X-Received: by 2002:a05:600c:3d0e:b0:3d2:3ca2:2d4f with SMTP id
 bh14-20020a05600c3d0e00b003d23ca22d4fmr35783226wmb.36.1672823331097; 
 Wed, 04 Jan 2023 01:08:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003d98438a43asm36124622wms.34.2023.01.04.01.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 01:08:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Jan 2023 10:08:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v1-4-9ccd7e652fcd@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
Subject: [Freedreno] [PATCH 4/6] drm/msm: mdss: add support for SM8550
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8550 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 144c8dd82be1..54483fe30ffd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -288,6 +288,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
 	case DPU_HW_VER_810:
+	case DPU_HW_VER_900:
 		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
 		break;
@@ -521,6 +522,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
+	{ .compatible = "qcom,sm8550-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1
