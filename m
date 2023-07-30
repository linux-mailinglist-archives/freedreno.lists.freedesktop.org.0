Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3C768330
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 03:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B9510E250;
	Sun, 30 Jul 2023 01:19:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6D610E250
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 01:19:35 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99c0cb7285fso22822166b.0
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 18:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690679974; x=1691284774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
 b=J9H6HlmR9Y3e51QNmRQFXSa8NtX2eZFtlfvSJ1oTq1l9thQrclE8DkHzsLbc3rwVr8
 coT//6Zuik0GsyME2RKZ0oNR5jOITZUeOx6WLwOkphjwmkO1lmShROA6REBODw/FTbnq
 h5FOD+sUMM1/iTAhxAGccRU+28uzx5eEvMyn6GAydg0g1GQvxIfQG57HDI1Ij1y6nIJ/
 eb1o+GQbtIEXpdzoCWIY53bJUhfMJlFG3jXkiey80dNAicsfDDtbglVYaNt2ZWwn1bcg
 v2BojPAXEHlnnwJZixZp5SEXxln3SXe5ZubrKVHpraP8jKZTb+HwiChmc6dzYxj4Qn7J
 BsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690679974; x=1691284774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
 b=WPcAg2VsxVzE0LSzpTr5zI11onzUpFYJ4O/xYy0UCTqnv0Bz8jmXmwtJCY9uIvwfIB
 ghSA9mqWZDt92TlfSx+AIYOCR7BZBGlv1MhCbbNacm14BREmipT5CKkK5xpGu4Segayk
 ab1q18mkiw4WPVxvrOJJ3ZIf16eBg3RlgksSnYRwPPsKYzB2xlHtupvvYT4VDfjamjge
 Ztaq6Rxq6GW0M91X1C0SG965kxgIwyyn4EmbZTbyMxbBSKZHTy6ZBybXMUlu2HBy/lPQ
 UOL29O0mWiz/6wXkatUCYC6UhmGTzVYH6DnJ6KFNkvK++gKHB/h2ijp3IjYYgAgXv+sD
 bcpA==
X-Gm-Message-State: ABy/qLZ/hTGHM3BJqhUC47oi9DorGL9ctNYdcbKPBSEYuab2rg1BqxdC
 lSvTU0RG1PUcbXh3gJWPXI1UbQ==
X-Google-Smtp-Source: APBJJlGNKzI082+s3Hh7aKa5+/unvv/JBT17q7Rre+YQi87qky0rO3wYheyt4VpN1PfNXHp2tQ/YaQ==
X-Received: by 2002:a17:906:10c:b0:993:8d16:4c22 with SMTP id
 12-20020a170906010c00b009938d164c22mr2908357eje.75.1690679974099; 
 Sat, 29 Jul 2023 18:19:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:19:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 04:19:15 +0300
Message-Id: <20230730011920.354575-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 08/13] drm/msm/dpu: remove QoS teardown on
 plane destruction
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

There is little point in disabling QoS on plane destruction: it happens
during DPU device destruction process, after which there will be no
running planes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index aba5185e1d66..f114efee1b57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1173,17 +1173,10 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 static void dpu_plane_destroy(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
-	struct dpu_plane_state *pstate;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
 	if (pdpu) {
-		pstate = to_dpu_plane_state(plane->state);
-		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
-
-		if (pstate->r_pipe.sspp)
-			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
-- 
2.39.2

