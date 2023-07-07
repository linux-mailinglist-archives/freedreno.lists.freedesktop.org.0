Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AA474B9EC
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 01:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5026710E626;
	Fri,  7 Jul 2023 23:13:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4396910E600
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 23:13:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so3784013e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771578; x=1691363578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
 b=ds616ByPYtKnHjCWMMUBNDEWOUeYZK4aGfrF/YufqwbAkGs7+bDBd+U3dyk5DFb/dK
 pdEuto/fBq53Ak7RjSdwvoA1p/aVwQxjZ3mUv+XlQ+azpBcFuELXcipGNLBegmQFjqnV
 K1WmS1Z30vauiIUovIcUWq1lmtqZi8BUeXqHU1ZhM0fRI/iXq/dlDOrx0HzojS4ziw+m
 oS4RNy/IR1hUAILZUzj56IB3Kdycod8F99/f6xK+vZyru7iDqe+9i9j2gCkO8engqx65
 30rLr2Evr25Tpjv6uB5A8eq2v/gp8gJyHr2MDJfc5mFKXSgCXC9HugQwTMflCvWdlWIW
 Unzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771578; x=1691363578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
 b=bDcSt0widwZczDKlWw4c0TiwP2iPuJALfgE4++2EIBxsWD4L4pSsBIGF+AbDICLvQs
 Yt4LGrFIZYpKwwOMQiH/fUftk/gII01sRuPTGyFaicebtjn+/rVru+q+O/yyiuJaK66k
 dFisx+d8TX/CWqn64G9/khtzdqLUS1J8VSBM9/4LCk/1wZssVXMLVJWmO7yZDV/DXxZp
 p1mWnZO+NiWcn6mV4EsAHnj5HfWFEzbgu1HKCYuRten8GCArrhE3WCiyMVb5LCxdSC/d
 kubuQ3C9TC2AmiCpL6xjlKJUXsxDmdPJ8LorWm8m/Iz8zDiFmUwiL84AxePBie9SbYEm
 RogA==
X-Gm-Message-State: ABy/qLbwsboEDsJEIOC0BbSGE+KHcM5gvGCT3jKcZOcbgIyx8WxwYmtk
 UvC0iGreGfHjTnHT7QsJvF6Q9g==
X-Google-Smtp-Source: APBJJlEJ7qmgow2NSUc4iela6lVkpDGnn1Pno1NXC3MOU+/RUas42zLNbdlMacZTQUbN5aQW1ETqdg==
X-Received: by 2002:a19:ca5b:0:b0:4f9:5ca5:af23 with SMTP id
 h27-20020a19ca5b000000b004f95ca5af23mr4391916lfj.9.1688771578422; 
 Fri, 07 Jul 2023 16:12:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 02:12:46 +0300
Message-Id: <20230707231251.3849701-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 08/13] drm/msm/dpu: remove QoS teardown on
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

