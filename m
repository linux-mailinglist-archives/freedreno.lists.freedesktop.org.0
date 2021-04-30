Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E7737013C
	for <lists+freedreno@lfdr.de>; Fri, 30 Apr 2021 21:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979226F5A9;
	Fri, 30 Apr 2021 19:31:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A80A6F5A7
 for <freedreno@lists.freedesktop.org>; Fri, 30 Apr 2021 19:31:11 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id i14so5586204pgk.5
 for <freedreno@lists.freedesktop.org>; Fri, 30 Apr 2021 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJ+k3IkP64GrSMDN3XqhlRCKvJ7LRYhzYp66VmVBeis=;
 b=YPUpF5gx6Lu8x87kWG9G1iUmfJZTG1SZgK7pPfzpCnhg+TO/nM1cgv9t3JdcWDSGAB
 NX30bokGW4Z2WZ5U4ysecHQfhymeosrtVZDi4XJhd28gmzQi+er5E1eIRH5Aew4WAYDr
 ZcPfKN3smOIxktECGFriRt108hyAVsWrSaqyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJ+k3IkP64GrSMDN3XqhlRCKvJ7LRYhzYp66VmVBeis=;
 b=CZam6LA353RdKlgWBNvMxqDwkerQV3u5JgkuKT2qlBtADXTWBpjVtYPn+hJ+tYVXXQ
 3OoeRoeMjvTFTcRStBw1o0FmGsHFnwYu1Q8Gxk3wYHf+dXi9YiLzKckenvcJZ1pSFdDb
 0d43NA58V2hUx4IbaG+sRDyPnQ87Pci2zra/TSaNdDd+ReHTNhAttLpJczb953sj+t8a
 dzotOLJ6DVKMO7/MPz9dSb6ZeZ3Hs3k2jLtBQ6gvDG45UZ5jyWVL4pDN8lpB/HE14fEc
 zgy3O0YPK5+X4HDOwpsZDeJPgp+qvZFoqAGycPYzkGzAf4JTQMjuCyU4747GHgyITLsn
 lThw==
X-Gm-Message-State: AOAM531ddRgXifMLnPRzA6VLzS/QoxB7mA7tSHGjcV83Bq5bi1rURrX+
 i1FhqjCbAkd823U+L7GjQgiJWw==
X-Google-Smtp-Source: ABdhPJxcQu43rdPftTPt75+wh2/LKuEDDLavYiD0jFeq32eOpYBQlZf0JkfMckweSNYSpOTy6PnPaw==
X-Received: by 2002:aa7:9e9e:0:b029:257:b49:2800 with SMTP id
 p30-20020aa79e9e0000b02902570b492800mr6753357pfq.10.1619811071035; 
 Fri, 30 Apr 2021 12:31:11 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
 by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 12:31:10 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Apr 2021 12:31:02 -0700
Message-Id: <20210430193104.1770538-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 4/6] drm/msm: Move FB debug prints to
 drm_dbg_state()
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These are verbose prints that tell us about the framebuffer state. Let's
move them to drm_dbg_state() so that they're only printed if we're
interested in verbose state logging while drm debugging.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_fb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index d42f0665359a..90514d3179bb 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -60,7 +60,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &iova);
-		DBG("FB[%u]: iova[%d]: %08llx (%d)", fb->base.id, i, iova, ret);
+		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)", fb->base.id, i, iova, ret);
 		if (ret)
 			return ret;
 	}
@@ -139,8 +139,8 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 	const struct msm_format *format;
 	int ret, i, n;
 
-	DBG("create framebuffer: dev=%p, mode_cmd=%p (%dx%d@%4.4s)",
-			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
+	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)",
+			mode_cmd, mode_cmd->width, mode_cmd->height,
 			(char *)&mode_cmd->pixel_format);
 
 	n = info->num_planes;
@@ -193,7 +193,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 		goto fail;
 	}
 
-	DBG("create: FB ID: %d (%p)", fb->base.id, fb);
+	drm_dbg_state(dev, "create: FB ID: %d (%p)", fb->base.id, fb);
 
 	return fb;
 
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
