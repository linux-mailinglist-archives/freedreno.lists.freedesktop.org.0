Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455996934DB
	for <lists+freedreno@lfdr.de>; Sun, 12 Feb 2023 00:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E28F10E3D7;
	Sat, 11 Feb 2023 23:13:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23F210E3C6
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:16 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gr7so23952061ejb.5
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohoTDuktmPgTPKpM9UbVJ84b0US4wb2twZe0P69YWH0=;
 b=JyeYZi6iKWgf8TfvEpWzxi79ntEyS7dNsdilab9kK6HEmXI7K85Qf90dg/XkCTZL+z
 LgGaD15C9VFfozLVGUwt5kSNRTaDxBYSCN/ucZbHkUOh9T7yDmM7Koko3+P3q4Cd58zC
 9AZEqY43r5txFCPz+DrDug4px6LtegLGmzHJoP/z6OpUx+hCKKi76R3Tkq3KXpFszNgg
 xweQwAtd9dNjmzbSAUUP3d9LkLltZXQTuKJQrYn0GsaX6tWNGMIo2DvFHKoDiyxWIaqI
 l10fA5VbSzyJnJX4yjbYvmvleHKFK7Qx8cgRuTE0RxJGFP4Q769q1k2j6JVovu7sPkX8
 PRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohoTDuktmPgTPKpM9UbVJ84b0US4wb2twZe0P69YWH0=;
 b=3nxg7Cg48GVTyJj018G3auhzEUVEdGRFAH3HtyR6WUXqsnkcLKE5MzUOTmd4V1j6GO
 7wcI6107GErUr5jXhUCyBOWRVRYO03GtS8vEX0V7wtws3G40YmKnOYy4raRLTnLytJrq
 BrnPrnaXpv/4QQ+uq5HQguHrtITRFJLUBUEXUsJok34V7V9zvyzqeKpL6ehpyv2wFixA
 PwOf+kc9XOnriMBpWjVODX4aPGSsbQi8TIENxLHN4ehThxFFIWMpZ6yqkwmJK9j08qon
 zOexT+SPEmj8NdSGffXKm+3gUnjkisHrrwEmVaT3yGYGZEJq0vhuu+pykBjXDSYOsyZN
 OTPw==
X-Gm-Message-State: AO0yUKWi80KK/OmCGUEHfgR27moOUMO4nIgNEwdurwPBgHa0Ezimhgl2
 66YGrncHdxrvI3YclnpeJbBHyA==
X-Google-Smtp-Source: AK7set8abnjMfj1xE4UtRP/ZXbQlX5Pd2dn0KzZN1iScaqiDq3532s1rAr2Yi1sWJmC6rmjqagYKGQ==
X-Received: by 2002:a17:906:f0d9:b0:8af:4dab:cf6c with SMTP id
 dk25-20020a170906f0d900b008af4dabcf6cmr6904783ejb.23.1676157196273; 
 Sat, 11 Feb 2023 15:13:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 12 Feb 2023 01:12:21 +0200
Message-Id: <20230211231259.1308718-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 12/50] drm/msm/dpu: fix clocks settings for
 msm8998 SSPP blocks
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
planes). Correct corresponding SSPP declarations.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: Jami Kettunen <jami.kettunen@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 02bd8334d67c..e3460b35058f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1190,9 +1190,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
-- 
2.39.1

