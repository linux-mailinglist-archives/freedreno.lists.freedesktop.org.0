Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE0692D2A
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1859D10EE7C;
	Sat, 11 Feb 2023 02:11:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5479310EE76
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id rp23so20178901ejb.7
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgGE+UvO2DykI7PjN9lp8qIR8SaI7P9Rb5o6dNXewDE=;
 b=d8ls8QoIzBMFEgOUHUHMImyZyYMYN3K62ITN75nScJ010SVDazT7zFYiHhu89EBQuP
 AtlpI680hfx9JBewm7DvNDiaMQ/F4i00gT14y5uVks+QCB4qLtiBgzv9wOTkSxQ084BR
 +dRy7STjHfQmDXQDR3GfNzMri4HAqp6pbVzdQs9bRKQqeWxI86rzYYz9/BzF8gsYaqqZ
 MsIn8F6Gc+NqOcRgGD25l0gwa9NR/Pj1KwA39xKwOND8g+EVLrO2MkEdo4PPUBq3zGeX
 36nioF/wwNQ/KjvapGwzO7Xy8pGMUnUuT+ItYTfKSZJbFJpb3lcvtZE86m0HBFIKsn5+
 017A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgGE+UvO2DykI7PjN9lp8qIR8SaI7P9Rb5o6dNXewDE=;
 b=BX/lD+kdMmgiXJ0ce/SPm6NCR8pzNs0dtEa9xCB4lvAVcOG332JiC6QTpWN/8cP/c3
 fqunoBn4Hp81yDD1e8fGUCLDNSu3ZEuUc3wAAIsAORUdpcySHgzoG/DKm8eJD6LStCT1
 fgIpua4uf7HWqSAa9c7nbPykArGsVGt86bmztN2p1usZivCE1uF8datM2iDts+aKCLkM
 m2QeeF705RO/XM8o50pihIlXB8jKTvuEqTQJ94NbFixpqMBb3k2PiCOMBLw0+AygJyXR
 yzPqdh1P+I+c3GKut5QlMTxl2tA+pJlqzWQvCgjdQqWmjuLPwFMZnaZxPzeFT5xUnapu
 +5KQ==
X-Gm-Message-State: AO0yUKUi1soj3DJq+9fFp0ykra+SmlcLyCYYS3tWEXijFLEXfHllbetd
 wBxExKxfvZCmCy3Ueq+WXpX17g==
X-Google-Smtp-Source: AK7set+glmpH6FX7PJu9Dm5/rI1d5FhpkIWO70cpsmHIqLIVP8ubqErpqrw+WfFjI9eWGY3Qe717Xg==
X-Received: by 2002:a17:907:77c8:b0:882:835c:1951 with SMTP id
 kz8-20020a17090777c800b00882835c1951mr18204624ejc.64.1676081487963; 
 Fri, 10 Feb 2023 18:11:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:41 +0200
Message-Id: <20230211021053.1078648-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 31/43] drm/msm/dpu: rename VIG_SM8250_MASK to
 VIG_SM6115_MASK
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

SM6115 is the only remaining user of VIG_SM8250_MASK. Rename the feature
mask accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 547af53a8082..edd8bb55dbe8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -35,7 +35,7 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 };
 
 static const struct dpu_sspp_cfg sm6115_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM6115_MASK,
 		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0d637eaf1e02..dc55a036744b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -30,7 +30,7 @@
 #define VIG_SC7180_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
-#define VIG_SM8250_MASK \
+#define VIG_SM6115_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
-- 
2.39.1

