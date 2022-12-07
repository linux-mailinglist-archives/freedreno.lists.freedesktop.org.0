Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F75645C90
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 15:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4BC10E3C7;
	Wed,  7 Dec 2022 14:28:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D1110E3BD
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 14:28:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j4so28996202lfk.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mfAGwvefS+g/9R3S0STarHhm4RzC0mvAwecKR+y5y0=;
 b=sXvtNEG0QvjAEGWec51FWMzEbiRXBOZg6CIdMOUyy4HlNfdmrbew2erT9yzEn0JYfN
 nbMQLrCIHht12nA3k2enrA1O4X/mOg6xh1MYvirfcUuoX+SucCm9Hv2V6/dzhXRduXkA
 NgWY9l9UzFxP/vqU39+8oIwXSDIT5Phya7qYDZJZ6fXHJywPw5+o5M0/7EmJO+UDpOIr
 WGzDRusisLPpJOi4AIGphoQqETgtSCdzeAS76nll5+P1rxFBvqAPeh6PPfFgPlJb95z1
 6E/UyNdbMA5Lfah5pAxWT4tBQPnfX2uiMza7PnLKMn1nbqVzrXmSJvx0R3z0y/ZbGIaX
 1y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mfAGwvefS+g/9R3S0STarHhm4RzC0mvAwecKR+y5y0=;
 b=YXMp71HzAuNUzaf9HUgepzjA6yk4DPVn70VB3OkbSzB8temwmh804GSk7dCjYytC5p
 hwaakQCjNKJ3ias8dIJPuzyUzlJaLSP4NkFBMdB1/nTUhiA64PTuzvAb1iTI+AX6Cx7M
 sHP9Z9pH6FAW8bdjqGjPYZvacyKM2IK407HsLG6NzboICd0HkFJf05U6Zd23tG4jzAiT
 SCMw9lrowy6WF7r5LID7qmenDl4EoOLGZCIS73FLWwYKmsICNDRrVLHwqM448N/5XtiU
 xGpv6XVPie+mJg6dSlCiwQ8rLychATXvm6OEq0hZKNa6evFfsQDCXRGX4CtU2hBY4uN5
 rNww==
X-Gm-Message-State: ANoB5pljZvWnGAPygNFe1gEwtWN+38kuenaUuIbfg/EHeB1BoJORQjt1
 gzrnVQEvF+8P+gT4iUgNAsV0GA==
X-Google-Smtp-Source: AA0mqf5maAfH+bw6f92BY7BtyIgmYJn3CtQGZlwA+JBxaNZ1iDwwhukTfbxfsy0Yk9HLyHTqnflYdQ==
X-Received: by 2002:a19:7107:0:b0:4a8:e955:77e7 with SMTP id
 m7-20020a197107000000b004a8e95577e7mr23518267lfc.573.1670423317240; 
 Wed, 07 Dec 2022 06:28:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 06:28:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  7 Dec 2022 16:28:32 +0200
Message-Id: <20221207142833.204193-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/3] drm/msm/dpu: correct the UBWC version on
 sm6115
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

According to downstream (bengal-sde.dtsi), the sm6115 uses UBWC 1.0.
Change the catalog entry accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b4ca123d8e69..a1b52b9b16f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -335,7 +335,7 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
-- 
2.35.1

