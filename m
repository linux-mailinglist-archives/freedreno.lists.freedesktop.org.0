Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCA4AF84B
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 18:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C738210E3EE;
	Wed,  9 Feb 2022 17:26:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8524B10E4E8
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:43 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id t14so4416897ljh.8
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KlXJh/oij3IFeqlWuJgcoMFVaedivMEjjROIIO+IawE=;
 b=f5ZNLXXB7rVo1loml3byRNJjtT8hKPJWsvT+Dro3yEZwUUfP4XiL4qcyxHy/O0aoT/
 La4BYx9p/yNVnLwO0aA9ZINZ88z+EwHkft493hjP5TrCC5DbxKPYswzsidRR2dScO2s0
 V1DZngz8X4U437JBpBbJHlk9aHt8CWur6ChS56pGlHt5gGPa2ly50h02aq/jityrxto+
 6SxgH51/ekiu2J+o9iMIDGszK3WR0ilLLyJ3xzbIZRGiXI0nsTkzlzh3yxzkarzXuslb
 cR4jKOI6kNvcNDlARF6Fe1rIsLG7k5XH87KQXATOEoEcV3DiQQoqvzLbPWU4JHfnhNec
 2pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KlXJh/oij3IFeqlWuJgcoMFVaedivMEjjROIIO+IawE=;
 b=Wma+YE6X/44yU2IXI6VBR8Fpf0ooGw9EJD9nFnWcatQjJfPTbyV86JCwL297DO4Xnf
 2QM4MD+W9IcSIyzz4KEGwFtRotZJJZlB0d8A8z51nhDrc26Joiuyuhi3YDYZnvyqfKQc
 t1ltla9oJYi3ab5TsV+wppU0QU/5RMn4XVoqEsrPp9bGwWt6MD6SnV2aXOBkUQ/bvL91
 iPDvZ4W04RFNRspEmgGqB5sWmwnx0KMl+yDCSv0m79uY03xDFl9p5+mCojAOpjta4sxR
 KMFME2SEbyVXlZD8Lkqq2NlrEn2aD5qW1ZAXqi/WfmNc5UiqzWUjkr9DHjqh0f51tHET
 kCUQ==
X-Gm-Message-State: AOAM530xge4ER1VbvCPVM9JjWoVISLS14dRBwtXIzirocYcO0he1bPHu
 isEbG7GGlGnlbBCEfH4tChxsvA==
X-Google-Smtp-Source: ABdhPJzo0yu91sEy/QMpIAkebs0iSSuz3Ano0pSi5ocsNwAm+3Jyr+JJ5CpIxpOqB9FUgXauELUtmg==
X-Received: by 2002:a05:651c:b0e:: with SMTP id
 b14mr2270897ljr.345.1644427541887; 
 Wed, 09 Feb 2022 09:25:41 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  9 Feb 2022 20:25:14 +0300
Message-Id: <20220209172520.3719906-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 19/25] drm/msm/dpu: don't use unsupported blend
 stages
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

The atomic_check compares blending stage with DPU_STAGE_MAX (maximum
amount of blending stages supported by the driver), however we should
compare it against .max_mixer_blendstages, the maximum blend stage
supported by the mixer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 637d164667e9..952ff11162c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -927,9 +927,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
-	if (pstate->stage >= DPU_STAGE_MAX) {
+	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
 		DPU_ERROR("> %d plane stages assigned\n",
-				DPU_STAGE_MAX - DPU_STAGE_0);
+				pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
 		return -EINVAL;
 	}
 
-- 
2.34.1

