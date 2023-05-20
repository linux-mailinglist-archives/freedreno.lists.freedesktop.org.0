Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F4070A40A
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 02:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41B710E62B;
	Sat, 20 May 2023 00:28:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD3610E099
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 00:28:51 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac8d9399d5so44729321fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 17:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684542528; x=1687134528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bMGr9P2blyZdtx0k6MOAZO/VRNZnIFqyOTcs7i1nXs8=;
 b=wdiUtVE6Y2b7iJii03kWFsDYFv51sLiZSgfvaOApTOkHUhxH887H4uv599Av/l0CFl
 okZ6kDXVPDDXGD9lCKlYzo44K6IDW2EC/oPQG8Ubt/uTbdpiXVEp3Jp57zuexAdUwjub
 ZoPAfxqFmRjnYnfgg5UJOM0CxjY+g3+pgfJaFcZO7cj16F0D1Ag5RYBvKgTSBFtyQvdd
 6vxv1yT04Mqb/1XXVRtKTP1xtsPsFDqjGHp5ZOzgWd+QWgr1V/aCBewkBo1WeskjXGys
 +hwBgdK9TW1ne794ZVRkvq+C/CFkAuxTpPbQj08DS168nHL9z8kwjEC6SqS+iiC8nHb8
 aaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684542528; x=1687134528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bMGr9P2blyZdtx0k6MOAZO/VRNZnIFqyOTcs7i1nXs8=;
 b=i1FOQbTHHMzByBdlSZmPqO+TbhKP5FnyuRQ/77XvRDI/CtwjYSI9+6b/7eictkAGrm
 NkiNrUSMU/Rua9ZqsdvK/uhz8f8JTIkuLwtnfB3e2weMYLmJVCt2Clc+lepM4tJnMwbR
 8T6b/e5b21wBSIpPWm1dZZjpO+4ySyG7d4FSbaHH0VSyohXHzwUxwpfwluQ6bG7MdpLo
 GRKcRkUn0rGTneIeGjh3oJnKlRFjlDBw0clQupw+bFWNowwY42fcbEgZ3w5a1+vfQk1g
 9PPneFLrBBZvBHeOLxy6jhsVnXjLUK/VYFxnAa1s8tAARDkfJQL9hqjzxTsADByUQD6L
 M/iA==
X-Gm-Message-State: AC+VfDz5iFDq0s0SCdlD4Q+hV9UnUYDkiiX4AOqdaog0Msu9lVm1IpGO
 +ft4rnV3Hl6qU3ZgFpHhVNwUuw==
X-Google-Smtp-Source: ACHHUZ4qfx+S+98U1ygfBKqYAiEhEsclkUhCrZDXTfp6bJSfZIpVw0g/Rn6k8VUtAkuZd0BPNpDa6A==
X-Received: by 2002:a2e:8695:0:b0:298:ad8e:e65 with SMTP id
 l21-20020a2e8695000000b00298ad8e0e65mr1348947lji.21.1684542528285; 
 Fri, 19 May 2023 17:28:48 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a2e99ce000000b0029c96178425sm60950ljj.19.2023.05.19.17.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 17:28:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat, 20 May 2023 03:28:45 +0300
Message-Id: <20230520002846.2870546-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] drm/msm/dsi: remove extra call to
 dsi_get_pclk_rate()
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

In dsi_calc_clk_rate_v2() there is no need to call dsi_get_pclk_rate().
This functions has just been called and it's result is stored at
msm_host->pixel_clk_rate. Use this variable directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 961689a255c4..2b257b459974 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -633,7 +633,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
+	pclk_bpp = (u64)msm_host->pixel_clk_rate * bpp;
 	do_div(pclk_bpp, 8);
 	msm_host->src_clk_rate = pclk_bpp;
 
-- 
2.39.2

