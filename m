Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B33901D9
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 15:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4039A89BD4;
	Tue, 25 May 2021 13:13:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7B189A60
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 13:13:20 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id o8so38126635ljp.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j5KrzNiLkEZ7U9hbHrWEVr0lVINK2iN1124OgJJTqJA=;
 b=q9rxBoOKQtZeh7mPEbFoNf7mSDDUN77dp1k+9wiOKLfYn/mpwMtYrNRFMtbVUv0rxk
 O73NTGeM4qzA0qKeZGi++ZIrwWdOxqtsWT9FokqRqDFYyZG/bBnEBrgD6/Gw6MepZ+hz
 1NTd4jHlBsGaRydFIcvH7vV3M4zmKbrqs2OJl9kVBqS5YxlX/h3EuG49cvC3Sq/iPOOI
 tSWZuy0xRCPzpSghvM/TsDPLQyAoVUMjxMtVcAULEukAtsQhNYhYnLYQdum8umkeWDgL
 7A88iVaPBGwFiG0loCmxONvWt5A1rIlAz8sAS/85n8SVSxtJZFvChm5fpvaxFFs5FDg2
 gZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j5KrzNiLkEZ7U9hbHrWEVr0lVINK2iN1124OgJJTqJA=;
 b=tEyz9K/oFpqiVttqyQElLZrQBHWimluNFYTmeaYaTXjkfKKpxoPWqHxhLzrmtrERwQ
 nT04vcMZpHiR5Ejphd3sz6slB0ffDWymzgPqTPJcBf6bR3xzGE6DeLlcHq9R89l7VE8n
 BW4OWTmQyz24QWkfS5hFlNhEtUABG6W1k2mdfXtRVDtz4qr+Oxhjk2oFVAsF2Wscxk3u
 u9VMQHDcMvMHnobN+U/8Wj2LQXCogtzopT9aZbd8vtGDrq+yUtqb/TcXsiUqqGoMB4ss
 oCHxB0w5SD+hbGIKwpkGzHTzgy8mmVD9Cc8VDFTXVsGgJh7rG8Vel1qxlBmmKRG/3Yu6
 kXRQ==
X-Gm-Message-State: AOAM53300fQUgs+eT/BnRHt6yZoSBMMOXCl7lbTpx5t+LA22ZSndbiEL
 am0EtUjuN/Xn8v8uzuInzuhrc21Et8Lk9g==
X-Google-Smtp-Source: ABdhPJzCiFO10NhUwXxzr+XwOQfj1bjdW6iWRs5pJDqSUZ5iAcpPEuflaOWSfphJJYfC8bkbZxE6ZA==
X-Received: by 2002:a05:651c:3cf:: with SMTP id
 f15mr19851585ljp.404.1621948398936; 
 Tue, 25 May 2021 06:13:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue, 25 May 2021 16:13:10 +0300
Message-Id: <20210525131316.3117809-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/7] drm/msm/mdp5: use drm atomic helpers to
 handle base drm plane state
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use generic helpers code to manage drm_plane_state part of mdp5_plane
state instead of manually coding all the details.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 8c9f2f492178..8c29026d770d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -176,8 +176,8 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 {
 	struct mdp5_plane_state *mdp5_state;
 
-	if (plane->state && plane->state->fb)
-		drm_framebuffer_put(plane->state->fb);
+	if (plane->state)
+		__drm_atomic_helper_plane_destroy_state(plane->state);
 
 	kfree(to_mdp5_plane_state(plane->state));
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
@@ -191,9 +191,7 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 	else
 		mdp5_state->zpos = STAGE0 + drm_plane_index(plane);
 
-	mdp5_state->base.plane = plane;
-
-	plane->state = &mdp5_state->base;
+	__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
 }
 
 static struct drm_plane_state *
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
