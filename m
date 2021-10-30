Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C590C440AC1
	for <lists+freedreno@lfdr.de>; Sat, 30 Oct 2021 19:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28906E055;
	Sat, 30 Oct 2021 17:51:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2ACA6E049
 for <freedreno@lists.freedesktop.org>; Sat, 30 Oct 2021 17:08:55 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q187so13039361pgq.2
 for <freedreno@lists.freedesktop.org>; Sat, 30 Oct 2021 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+W1GMLw6C5reaVE/Y3pI1gn/PZ+dci603n52uqzIAc=;
 b=K6IFILSEntzkjF4zAJE53lfbxpsnnRNjTX18tiLglLxJt0GORz7bgiSEoN5mAxVgsh
 mGFKli7c6RMXqSX9ifPiVEt2g7fVDBii20SQgVDzVo4LR3co8CO0nNOsWbIk2ue/DqJO
 qUXF3lMtss5oMddUcgBFo0PkgV8queNnOxfeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+W1GMLw6C5reaVE/Y3pI1gn/PZ+dci603n52uqzIAc=;
 b=XuPgNDscPbyEG8V6WzMr6oQURyCkMXA9Fbcu7fC5KQ2rvHG50hsES0zQ5S9wCm5NdZ
 XildMdSH93huvpeiiajeHMbsBbMrQN/VKeVJNOe0L0+pRONQJCTnWEYPO5IfgN6BgFsm
 7rq8kujvbQry+Yc7aKRlidezZRvLwutZV1YLU34svsTaxcf6WMRiwtn06/rTRev0NJSg
 FuhaQIGO5BpeljXgn1EeNAM1Fxky3hzj9AN2WmeWCgO4irGyWi28CnnuyWvgqxrAbSYI
 EyA8dnmoive2V+CkrZjjU8dmqbf0a5Y/c8KzBFrIz22OTSeBg+9DhgZKMi6TaHNM3jlP
 ypPQ==
X-Gm-Message-State: AOAM5305R8oPDFpGxp0CgUW2PyQ3yBWIm2p/lANbM/lsvr9/57Dq6Ug1
 rHtqWqvwkdXlgvseNLHTz6269Q==
X-Google-Smtp-Source: ABdhPJwSmUoGp7LXb7jUr28+7PBB+QkgoTQGz8UyV8ymunRt9JTMHBCp+cX19W4PjQ1KMU+pSedPog==
X-Received: by 2002:a63:ce0a:: with SMTP id y10mr13812030pgf.133.1635613735258; 
 Sat, 30 Oct 2021 10:08:55 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:f63c:4559:725c:b6da])
 by smtp.gmail.com with ESMTPSA id i7sm8565390pgk.85.2021.10.30.10.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:54 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: dianders@chromium.org, swboyd@chromium.org, robdclark@chromium.org,
 Philip Chen <philipchen@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Bernard Zhao <bernard@vivo.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Viresh Kumar <viresh.kumar@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Date: Sat, 30 Oct 2021 10:08:50 -0700
Message-Id: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 30 Oct 2021 17:51:47 +0000
Subject: [Freedreno] [PATCH] drm/msm/dsi: set default num_data_lanes
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If "data_lanes" property of the dsi output endpoint is missing in
the DT, num_data_lanes would be 0 by default, which could cause
dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
by the bridge driver.

According to the binding document of msm dsi controller, the
input/output endpoint of the controller is expected to have 4 lanes.
So let's set num_data_lanes to 4 by default.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c86b5090fae6..a32eb33dfc14 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1696,6 +1696,8 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	if (!prop) {
 		DRM_DEV_DEBUG(dev,
 			"failed to find data lane mapping, using default\n");
+		/* Set the number of date lanes to 4 by default. */
+		msm_host->num_data_lanes = 4;
 		return 0;
 	}
 
-- 
2.33.1.1089.g2158813163f-goog

