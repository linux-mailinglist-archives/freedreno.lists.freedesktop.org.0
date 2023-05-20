Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4070AACE
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 22:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A13910E1A2;
	Sat, 20 May 2023 20:01:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3667B10E1A2
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 20:01:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f3a166f8e9so2578282e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 13:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684612864; x=1687204864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/m15tgiwhJVpYle1UwrR9+q7qYpgbGWpHSlEeT8UPN0=;
 b=t1mexu5qxJBbBJltPPFF13MB0UFh19PpxpRwP6BJZkVT+8+Who4LFtvR5rRPJ6WZlf
 aF3vLsZKI/6m47koGyPqkQ70UlK6+FCGKwPDvOrnbFC8PNQfhP0qiApWMylsy0yMZfQU
 xvfiVtXg8VSS4yUPKmKCyljjLAAZ6erdXVUaW0xoQUQzWEmQ+vEWGSuF9Rl6a9+GwK04
 MjvFr6NVTJcMeOwmNqAvDtJoBI3hfXJWSgSWQh37YGFopku6dwx6cXsg41nbNgzynZi7
 bz1RCJHueQJ/y9/P6dR+NQfrYqmcGufHo/y4g0Tcz/g1fqtxutbRF7N1sgijjpkaOBXD
 JYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684612864; x=1687204864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/m15tgiwhJVpYle1UwrR9+q7qYpgbGWpHSlEeT8UPN0=;
 b=Gh/NFPSev8FsbRJ7h+a8mZvA84YJs2fyTBaj6C59ZyX5smsBqofE5Z0n4h+Zm8aIgd
 9FwCv14hYmuMMsWtlobJpwdx60ia9hNxwT05nhGyLFbgjoZbw7HxwRabtKJoG5YJtDd0
 SjfiXNStLTYaDQEAlnsNbPeZQjU4NXDeEpIHeuZqY+4YnRGIj+dpKU6XlRqU3jSnnSEQ
 s2RCoF5slKgwTP4XgTLrEVCESsdZX1mdEUN4TYzGzkHVYhObt5jF75mUa1GEbCx5bmVX
 zN1IUqKBP59xRkMhymNS83y25d1eLsHE1eBEwyy7gzViO/Asa2jAUxAISlBIGUWhKbTF
 gDGg==
X-Gm-Message-State: AC+VfDxFe9f5ozIiVOCD0i2sdo1NLqWoWsEpk82uxbIk9TDA09ZUuzQT
 O66JdG4KSCNY+v3+z0JoM+wFbg==
X-Google-Smtp-Source: ACHHUZ4JAZCnM9aejw/rIPOad6sYyqPsXDK/bsqCMQMPQLijIi9hM33boelYXdGRDoI5/m9y8r3qjw==
X-Received: by 2002:a05:6512:1048:b0:4f1:276f:a25 with SMTP id
 c8-20020a056512104800b004f1276f0a25mr2170344lfb.5.1684612864403; 
 Sat, 20 May 2023 13:01:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05651c014400b002ad9b741959sm418061ljd.76.2023.05.20.13.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 13:01:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 20 May 2023 23:01:02 +0300
Message-Id: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/2] drm/msm/dsi: remove extra call to
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In dsi_calc_clk_rate_v2() there is no need to call dsi_get_pclk_rate().
This function has just been called (from dsi_calc_pclk()) and its
result is stored at msm_host->pixel_clk_rate. Use this variable
directly.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Fix typos in commit message (Marijn)

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

