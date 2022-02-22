Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D83C4BF201
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 07:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5651210EF45;
	Tue, 22 Feb 2022 06:22:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2B810EF3D
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 06:22:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id i11so22793392lfu.3
 for <freedreno@lists.freedesktop.org>; Mon, 21 Feb 2022 22:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B35/xt4SCJGelHk6jNUJaO+E/UL5oTZkMPlhEe6zMWM=;
 b=YomQ4ZP/jD1H5vI90v10St0iBplfmy54PC26Ap+h3GmjOR+gnoHnFHPpVUjgb6uA7w
 34I3fAP25VKfcuB+fQA0iwkaxaTWciTAWNr2jDeni5IO1MLa1wpyjmQQJkvEk1Z/D5ou
 slQ8eumdxDCH6EhBCgWH6TeOL4MWQBeoDIZBy7wvU2f8kF4Cnp7CjiIAqlL47uWKstRf
 UmLRlZ3l6t7E1pkn02MCTxJDFSkKqGTaJJ+RTNK7zGHRWlLgkerz0CNYuhst5iY8Z8WA
 PXqlHFLZ51k9Kbhc+zMfhHPX0k8ueCdO1jihicO5UujGCmjGbLmIZBasDevJAWChcm3/
 Wqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B35/xt4SCJGelHk6jNUJaO+E/UL5oTZkMPlhEe6zMWM=;
 b=OGbTqThG0YIQAIC0zNfgk6c5iqax08VO4VNUncK4yUj5vIWYjtK8UIcg3rG1JJwMQ6
 l9uoLSF3UF0a+UXWLpetvHXWMLcah9J07nBrobMeEYASXLl5FLOvzf0Ps+Kr05Wf/OlU
 Wd55MDqbLNKCrrrA/xjYM1tgHU5+T7N5NKLiViKQRwrDw1RbgGo/GleTaUQSaceck+kH
 YRK91CCKQYvTkyt/+PeBM2aiAcqDZFguv1MgIBvMuwHnzd1lj6QC68S1mxGPsNKcT++R
 HXZchHdEy4kJTiW6wapBLVYCa4CFReDRrRX8LXsV272AvcfbN7TY7elY8uv+IChNORny
 VFsA==
X-Gm-Message-State: AOAM532oDwC4Oqn8O6zxkw2YDK8uWjpgv3ttxsgrIuGa2mMdLASRU9IL
 hq0mLjsiIjcTk0rpDBkaiTf9bw==
X-Google-Smtp-Source: ABdhPJz5JzjpVpvHC0qK5xpcOikwk5W1ftiXPaHBXYJ7M0dDH3lK6AXehDmgzB247Sz8ItuHi57TCw==
X-Received: by 2002:a05:6512:3094:b0:442:ca74:a610 with SMTP id
 z20-20020a056512309400b00442ca74a610mr16095850lfd.438.1645510970379; 
 Mon, 21 Feb 2022 22:22:50 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
 by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 22:22:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 22 Feb 2022 09:22:44 +0300
Message-Id: <20220222062246.242577-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/4] drm/msm/dpu: drop INTF_TYPE_MAX symbol
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This enum value does not correspond to any of actual interface types,
it's not used by the driver, and the value of INTF_WB is greater than
INTF_TYPE_MAX. Thus this symbol serves no purpose and can be removed.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 4f8336cc7911..a9b6d0955539 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -220,7 +220,6 @@ enum dpu_intf_type {
 	INTF_EDP = 0x9,
 	/* both DP and eDP,  handled by the new DP driver */
 	INTF_DP = 0xa,
-	INTF_TYPE_MAX,
 
 	/* virtual interfaces */
 	INTF_WB = 0x100,
-- 
2.34.1

