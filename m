Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134D8347B43
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53756EA21;
	Wed, 24 Mar 2021 15:00:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10C56EA20
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b14so19182781lfv.8
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V5a0SElwgMSR05OnVZxlFyzafRcs18clf2FpnQ1Pirw=;
 b=FXluN6BbG0HZTXJyP6TVendzyux+n4NQNsn62YDIl3r/Qny5xdJHvNxbxGhpTrCQ7W
 gIGKyE8tqlpcLOmjhNAa8wLoN0pp+5LDqnlf9sYGsTRyR39zxWWJPEc9S9c8FMPOV30w
 ftto/Aga4NhiyCJHnsTQYOvI/mGU5s5lSrk5WT0HYFY6HKoc7WjYfQrbpN28Kd8uQnpa
 dP3k6QNk/efsrfLBbVqgQhcahr74CzaVBPh3USS9P/HjhgDUg7WrwpRISyLcKiuTOyFF
 YZA4XfiII9nut4F8PLNh2vFUPekIPM+OhNk+fLGZGWElNWcqwYcQaCR+WhvNTOdSi1lF
 HNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V5a0SElwgMSR05OnVZxlFyzafRcs18clf2FpnQ1Pirw=;
 b=Umee8/2qzWgy/6mToH9fSq4I3AKC15E/3ulFjBWUGmFZU3fypdnanLPXDW+RXZB3ve
 AHSHCxPVPnIImiFeprwCz+XqProNatbUPEWNIK6yVFiJmhfk6RC2eJzWoVmR2PUidyxv
 4txD2CThl6F0iHeKT0WA5ceoawOPPxfj2j1XS2WZAeRuOKyM2OFvuxK7OmGlnPvSNWWR
 bO47aaPJ21v2hCkD8xyrO4JKUvDSHtc7wFHMRAGoVaxJvIQE0CCcDz38Rauc49TFP3Ea
 23FD5AZi+ggeILAbRIis48aEH9hJBInjWiVu+Wdzb19P5y//S6mqN2Xo1Oe4HEMYHKqw
 +nrw==
X-Gm-Message-State: AOAM5309IT6rGieV3ahwI3A05Vq4NP7nMa6MO04J3+YWUwqF25nU0M++
 /pKY/Mb017WbCIhNWuUn/PPpgA==
X-Google-Smtp-Source: ABdhPJw6w16Zus9bj6ywWeRfCOVFk45iSfhf9EZexnbh1wiTTH2GJmAbiUgKI4AgiZpogPcSPoTmFQ==
X-Received: by 2002:ac2:414c:: with SMTP id c12mr2185512lfi.538.1616598030092; 
 Wed, 24 Mar 2021 08:00:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Wed, 24 Mar 2021 18:00:04 +0300
Message-Id: <20210324150024.2768215-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 01/21] drm/msm/dpu: enable DPU_SSPP_QOS_8LVL for
 SM8250
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SM8250 platform has a 8-Levels VIG QoS setting. This setting was missed
due to bad interaction with b8dab65b5ac3 ("drm/msm/dpu: Move
DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks"), which was applied in
parallel.

Fixes: d21fc5dfc3df ("drm/msm/dpu1: add support for qseed3lite used on sm8250")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 189f3533525c..e4444452759c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -22,7 +22,7 @@
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
