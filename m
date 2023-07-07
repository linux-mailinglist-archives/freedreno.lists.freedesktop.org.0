Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E8974B804
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 22:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8297910E5F9;
	Fri,  7 Jul 2023 20:37:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DE510E5E7
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 20:37:32 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fbcbf4375dso2706656e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762250; x=1691354250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
 b=G7+9Q2ARn2AUFKr0BNkwscg8arprWHJUG8GaVp3efNf3xG5805X+tV7I7a/tehweLU
 dn//vV614BUIeXRpmsNk2hMJuuO2neek2kuX9OKUISKjchuZ1wbIOGknvTnhacoCebOD
 a430et2PS8E0p4CDOuKk3DZrqUwsZH2qnuyV+5v4md8YZCw5NZ/bI0z3ymCuZRbmvWe5
 RVYmUny1eWt4DzkGs7y1HAlVv19A70IQHcE48eUcpOoGnbIfsp5Fad5QV0NqUrbd3Kp+
 azDx8om/arizR/KPAQ5hPde4Ri4a2ovrxShl9sfpbGqrwxmABlSA+I4AekWFj8KSCKPk
 Qc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762250; x=1691354250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
 b=UcVnNq1k/0mYiDqKSdEVjTBHIj/nzgkt6sXAGhE6cda/rkIoU6mXrDy6Pk6mb+uM+9
 dCedlrlxtiHSdKn9EJaL+8GiltL7Ix7nBgOOLpXUjp4APvj6lS7sNtkO1NUuP6+J3d+K
 vLhTDQRasMT5ztwnBSnyn1V5dnfBNYqyVXBB8rhYq1VbyZ7DJWV9WEI5qZhO/bSZp0vW
 TBzdLXnQEZHeGhJvbuUI9N8rA2UrNopfHzo2HVPU4pXvBsKP/oft7vKocNuufHFUg7qf
 XqRIn6f3yY+g2E3Q25KWPGr16SzcxVbGQM89CdtYeXlnFamlrTaW0YKcYJQI54mQ1idc
 7wng==
X-Gm-Message-State: ABy/qLZKK98rpYGw8qz58NlD+imKLroXHErOFD4kSrTsYyOXleri+7JO
 KwQSPeTGoLPvikRKcA07hXLlxA==
X-Google-Smtp-Source: APBJJlFpUgpe2yRk6U8blp0u1+rL8k0xX/mnOXMJdYGITuNXoS7hY4aGbbG/jf3ZtFykxtPtQRccKQ==
X-Received: by 2002:ac2:5e61:0:b0:4f3:b18a:6494 with SMTP id
 a1-20020ac25e61000000b004f3b18a6494mr1997541lfr.22.1688762250395; 
 Fri, 07 Jul 2023 13:37:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 13:37:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 23:37:19 +0300
Message-Id: <20230707203724.3820757-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 08/13] drm/msm/dpu: remove QoS teardown on plane
 destruction
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

