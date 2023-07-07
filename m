Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 371DD74B7FA
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 22:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6735310E07C;
	Fri,  7 Jul 2023 20:37:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BE210E07C
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 20:37:28 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fbcbf4375dso2706578e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762246; x=1691354246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
 b=K8SzyygLZhcJ1NCDc8Nb0SWwAqFFS2xoH1sytz/vUwBxBpSQtlnoQHDjWwOfp/ouv0
 2kVmdSDs3nVZJhQxv9eqU2SxBNhkndxGfI2+xMgpmalZ6YU+oNyri8jTbu0WqvXBEBmg
 QlqfFPd1sNWIroohbwJbuxndDJ6llL5CZfKMHJ4jrPjPcMutJ7rCnUnGLwFBqVpevcm+
 rHnj5HPdlclbNN6dacK0tnRutFs3AVM0s4xpFzcG+m6UbgULzjJ3xJQ9zz7IEF9Enn0G
 DKjlxzbeKbdvVaVFvQzRBsM29tCNq4HfCyIBrklLUcKZWdtYGE6TekYyNrcneNAn+0r8
 njQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762246; x=1691354246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
 b=SyN/PzFWO6WL+EKDWWfXSHAgF881HlELioWtHDAOL/CohLhUJ66N4IqImifT+G9iCH
 eWsECHzWS5v6f0m1VExFasQMsPCNNYTuVQOsV0svG8dUlGIBWjOJD1h950UlV8GeYaTI
 fKEOiIzHVL7UYkfA/jKvix3qiNFQ831aRiCCJ90zG5Kex4Uu33M/S3bK2jhDtI7jLHq1
 1suGzOBlfukusX7bjORwL1Qg9P3/EGwHo7EOZVn+mQobOx5qBcvLiRjAs0AzbkjvIqVw
 Ceo48vkX9fwwH4sUgrzZLdz7o6kNlJmKv3wLEhHWLtJLXalfQMxMbaWS+/qxItXVPICe
 je+A==
X-Gm-Message-State: ABy/qLYc2OgdTzQeVNX18TOXbAFU2ApeFtgVQV6aWr+ChLre4/DZklyb
 syqEbTi+foKQV4/BPpLwVO5EVQ==
X-Google-Smtp-Source: APBJJlEEEGlGG49xFjzciptjIKA5rT715Bv8VLBJcooIHYOgOe71L3exff/WPaP46GEbKhlCVAlihg==
X-Received: by 2002:a05:6512:e86:b0:4f4:7a5:e800 with SMTP id
 bi6-20020a0565120e8600b004f407a5e800mr3257908lfb.10.1688762246383; 
 Fri, 07 Jul 2023 13:37:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 13:37:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 23:37:13 +0300
Message-Id: <20230707203724.3820757-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for
 dpu_hw_intr_init() error handling
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7ac02e92f42..85b8c9cc99ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1096,7 +1096,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

