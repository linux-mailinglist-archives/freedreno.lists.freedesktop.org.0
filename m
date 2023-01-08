Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDA9661701
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 17:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C25810E1FE;
	Sun,  8 Jan 2023 16:57:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E0710E07D
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:02 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bf43so9535594lfb.6
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
 b=LOaWt0nMZCQMlu/kyhyiFkMmbHnIEYfWIz1Lq09jNRTVo9RvD556KCXF7kHX4y234i
 0rDkmmIB0QA6oY/xLhBvWM17IM3Pt7GcoJHb/5CoYsW2JoNAiUiCUgiQPaWeBO/uyB/p
 8l+r0OY1ZtPu3xYYYGZN+gJPQcMnoAzbQ0QaQn0S+xSqdI8ZInYY+tn9SVFVitOmRCrY
 iZdeFZJgYpMmVvMrXOuu608o2DzR3ylTMiD9vxC0PhdJvOJMRoDWzF3HZq4S+8v+i1Xr
 UO5yrSWKMJaKe7aNESA1UgBPwBiRyMwScg+kZikbtVZdCFzH2LEIa4uhZzQLYOg2/y8v
 5QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
 b=Hqu1bprHQsOeqISuPof1c7s++/4XqMVsW+Q1F3bX3LbL8qle73i+CgwsJg8TAJT+Hf
 nqi1yse+PdRHSc3HD9jPG85kMAwqP0NxGMh9Tz38RBRNx7C4TMsWaEhQO3dU6j02MrqZ
 QiD/PRFiCJZhl/f5ueOdDPfuPGGmiIIUnIcqIS+ADsaknBJZ/KfDmSiGZqz0ArBxbABr
 6ZTOinoXYq40n3N317rIeKRiFuD1HIMQVvxfwxeeG8JJLg7uZzuzrFnIqHzddD2+IP7X
 Y41C2n94V96XR7FdMO8YwRhYcDimBdxWXQ0x571BxHH302J/IekHG+EajaxszMHKQynf
 Kr0w==
X-Gm-Message-State: AFqh2kpxg2ZVtg7jHwO+u9WcK+n/vEdBC9Hof+TqgWLO38WfEJGPVeN5
 17usvDBlT+YceG+y2HxcMHCD9w==
X-Google-Smtp-Source: AMrXdXtCpM5eXruHKS1u8QD4S2xnCLMW2hGmMU07tlOqcgJWEyfhmZKtxavj5iYb1WxbM18EFmM9Sw==
X-Received: by 2002:a05:6512:31ce:b0:4cc:7258:f178 with SMTP id
 j14-20020a05651231ce00b004cc7258f178mr2109800lfe.59.1673197020705; 
 Sun, 08 Jan 2023 08:57:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:57:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 18:56:47 +0200
Message-Id: <20230108165656.136871-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 04/13] drm/bridge: lt9611: fix programming of
 video modes
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Program the upper part of the hfront_porch into the proper register.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index deb503ca956a..f377052a45a4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -187,7 +187,8 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 
 	regmap_write(lt9611->regmap, 0x8319, (u8)(hfront_porch % 256));
 
-	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256));
+	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256) |
+						((hfront_porch / 256) << 4));
 	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
 }
 
-- 
2.39.0

