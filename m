Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA9F487011
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 03:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F6A10EDEC;
	Fri,  7 Jan 2022 02:01:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318BE10EDBD
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 02:01:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id o12so10316113lfk.1
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 18:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OHbsyEqfteS19OgRRcOzHQJayCE7Kspad11GnKSJ9XY=;
 b=XSClUiDypO5YErliO//FA6YKgZb1nKZcX4VYG3rMZJ39C3UsrGP+GpaRA6Z6h2qM+v
 GIbLcKHSdf5qY+XBsm0rkxj44+wzTQbt0vwSKBH/5DPNzRVzKVIx3ePwCND5L+txbZCg
 tSc+0sSjh2zNu8nDsdElL4GeIXixf9Ewlg8lXNB8riuFuRUR8cPIfWXKKNr5DmZs8Eud
 cJBO8Ev3OU2uHU0690cM92iFddrIMJx9SrPFqAKKx6N/Q+xv3TkTlIaF2gXWgSCy+Bq8
 YuR8JTWcVb5ZGRstoDj8m0YKFILxR8lVSBIybfVjWLWQozpK85LuFqMKhZYqM03OZh9K
 0Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OHbsyEqfteS19OgRRcOzHQJayCE7Kspad11GnKSJ9XY=;
 b=AVc1wZXo+D66Yll09h+EzWPAYDXWHXAnQkCDbpR3nDvmDdgl9Rj9JdzlVTVrbqv4LX
 Vc5egDDFEdRzzFqU/7LYHz5wqT8AC44pOtqfgeCrsymghUHBZG7S8yASTbO4w2tawyTV
 NSkJhMYOcg09ZwrL00RaMN0ClNqATLrW0NhliTq3HzW5Zvqf1WZpzWFzJfcoxU57WDqv
 8LX0RWPK7yUiJ1gBqFsW/IpzRViJQfjeDk5blvYUwecREXBsHtCUobOaYE7KTDcCY+Ap
 7jwdO32Otws0nL9xJ6ccp+c6nA11EHTf1ILzYGztTl8cRoX3mr+jj8yS/5PdVoMVTulF
 5mbQ==
X-Gm-Message-State: AOAM533wsxZWgeHiH4hCvzSkgxHVQhuN2Dbm3HcAB/WlwVAkA/VCbRJF
 nqWPi/+G7xbDAJ5AvfmTOhHHdA==
X-Google-Smtp-Source: ABdhPJxWuoABGW1szvhXbVPJleMmIshIUx7TC2kgz2wI6G4TwBcxecCnri+QDRzjYAmY8GBjTv7t6w==
X-Received: by 2002:a05:6512:2149:: with SMTP id
 s9mr53882517lfr.96.1641520900476; 
 Thu, 06 Jan 2022 18:01:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 18:01:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Date: Fri,  7 Jan 2022 05:01:31 +0300
Message-Id: <20220107020132.587811-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 6/7] drm/msm/dp: remove
 dp_display_en/disable prototypes and data argument
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

Remove unused dp_display_en/disable prototypes. While we are at it,
remove extra 'data' argument that is unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e63d6056e39d..720e80ea99cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -559,9 +559,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data);
-static int dp_display_disable(struct dp_display_private *dp, u32 data);
-
 static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 {
 	u32 state;
@@ -841,7 +838,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data)
+static int dp_display_enable(struct dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *dp_display = &dp->dp_display;
@@ -878,7 +875,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_disable(struct dp_display_private *dp, u32 data)
+static int dp_display_disable(struct dp_display_private *dp)
 {
 	struct msm_dp *dp_display = &dp->dp_display;
 
@@ -1548,12 +1545,12 @@ static void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (state == ST_DISPLAY_OFF)
 		dp_display_host_init(dp_display, true);
 
-	dp_display_enable(dp_display, 0);
+	dp_display_enable(dp_display);
 
 	rc = dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp_display, 0);
+		dp_display_disable(dp_display);
 	}
 
 	/* manual kick off plug event to train link */
@@ -1591,7 +1588,7 @@ static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
-	dp_display_disable(dp_display, 0);
+	dp_display_disable(dp_display);
 
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-- 
2.34.1

