Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD34F4779
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 01:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA90510EC21;
	Tue,  5 Apr 2022 23:41:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE53410EC21
 for <freedreno@lists.freedesktop.org>; Tue,  5 Apr 2022 23:41:24 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b21so1179270lfb.5
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AaD8XVb2K9YsDryXdi/t3jnaeSVSEnsi/78uo5IoYLQ=;
 b=DhxABEvwavM6pQQGdMwYcxzvuUfulhIl2UO3Iw4uIDBkOKMTG3szy6OS+2SPdsZswC
 J55roIMtDQLJPCh1yBiZ0Rw59wE/0po2RVMAtdfpzolQvfGqo8jACM9LZ/8jgHr0rHZm
 mGDObOT4ggnskoPYHXcbbSy3QahES8XmoZyq9nCJhbj3ZHEmjbRCDKSgbVO+Y4+hLpjH
 LnDlVc8IlUhDxdvNm5FLF1/HUH9PTlSc2QWniz2ZAE1trbZO7K5hiKIXgJL1xoMn0Zy0
 LvCXMf+SBBTejxEaVfF0y+Su9sYDrfEifpsJHJ4RuzRcpD3XzCmTr1NrbQ5LgspZTrUv
 wOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AaD8XVb2K9YsDryXdi/t3jnaeSVSEnsi/78uo5IoYLQ=;
 b=Ni4EVrQeBcDifWE3C/QMBLtxPzy6zg+Ka9ovrNehm99mXC7jQ66fpDzK91jTpMxEES
 F0QullkYNrS9OhSTHN/UNazeXQA/cn4LQ76LZn2X3hZkx9vRhWgRPyyLntoa4VkQK4wB
 9dieH1/Zhb55plLje7shzliJmrvjQf6N29ar4os3km0bWLKnFMa1fDBipnFKj9ticId8
 wTYTRuR/Ndj1Aq4Un56yydgrK7jtL05svdPGegp6P/LiT+g4j/uWanfyzCSMrXBEAzXR
 uc+LlCjcksf2DIPuwJt+Ljl1EAj28TZvW6VfE1SpJ1uEKdU538ggwzoBEyhmY2i8CVxV
 r7RA==
X-Gm-Message-State: AOAM533NqHgykpJjjh6z7nv08zcXY8Y4ZGkPhWics/E3FRM8r8DXAPWG
 LetN1OR0d+l22sAGFnsbnI9rSA==
X-Google-Smtp-Source: ABdhPJzylEOY8FI7d1q+yqTJ2OScOOiaZYwKkxc/K+DV54fSUY82vbXM87xQNS/CwJownyXCVwdvjA==
X-Received: by 2002:ac2:4c4f:0:b0:44a:3922:2f22 with SMTP id
 o15-20020ac24c4f000000b0044a39222f22mr4149428lfk.69.1649202083027; 
 Tue, 05 Apr 2022 16:41:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 br12-20020a056512400c00b0044a2c454ebcsm1648195lfb.27.2022.04.05.16.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:41:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 02:41:21 +0300
Message-Id: <20220405234121.358948-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm: remove unused plane_property field
 from msm_drm_private
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

Remove from struct msm_drm_private unused field plane_property.

Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ee3093890d97..3bce127953ec 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -192,9 +192,6 @@ struct msm_drm_private {
 	unsigned int num_bridges;
 	struct drm_bridge *bridges[MAX_BRIDGES];
 
-	/* Properties */
-	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.35.1

