Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB4274B9E5
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 01:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3586210E61E;
	Fri,  7 Jul 2023 23:13:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5F410E61A
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 23:12:59 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fbc0314a7bso3954097e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771577; x=1691363577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
 b=y6X17IOX3vPU+F4eOdp6bx2ef9/SqAne0XkRYRBO03aQjzK7s0PR3x3UGHSwfbGjtl
 q2YiBydiRuXwB8txqWP4ZMqLlgX85fj91ffSHGmGJs8EggF0XWPsCJD36x9/AOPv3E26
 sHbdou8U8Yd7iWNYQMveEh9eLuaBEfhdY8JipU5KIGV54SHiU/CM8v4z2TLJAa/8o9WF
 sDk6oLSXdgfKxtcP7h12rXtxQOLwZpwEcp3IzgM7MYcGQHsKksyUm3SfRIBxGveRQByI
 B7booek+P3KUukahR7HAdp5WreyG+cIe4xgk6Kj9P5bB3BNIrhLcm187yj4J1eJfcmJW
 IRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771577; x=1691363577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
 b=bNMlgAUUzCL9jFgDnheuID7c56UEIXwTQThoq+Pvg8Eqpkutuk5rS8txJ+DOOA5hPK
 hZcXMikRoyld2C5KYi1eP8LxfScKsD5/sTYtNyK45myNIlMKmoFaL62IypUVlU60jPtZ
 GZtNCqmMRuXBOV+ua9bsScfUtGK4VJXCp049dpA4eIgh10C1R3eNuPasTdpOBM7qOoWf
 Yw4d+22gpEZU4+6h0oURKKNBpaZebeHegIZBVcJFSy/8nzG39lF7QhEwreA38CXqczoV
 yhRYX/JRoAyTuAtBf0g1eaxwAGMvXWkPQFfjs4oKSlTuwM6nY1Q3HZ+QtTYAhrekqCqz
 3KhQ==
X-Gm-Message-State: ABy/qLYOopXOX9WZrXkXgiKzBtxqFaIsAj5oWhu6GP9vkVmYSO5XBhr9
 zOxMaCt2UiAe2FFtMnLPiTsmxg==
X-Google-Smtp-Source: APBJJlEPkmOB8pJ06nDSf1tecIVwEr4jUaDXvQK5fsIYo8WkQ8uJYngo7bBisrq6+w3GPtOF2BP7XQ==
X-Received: by 2002:a05:6512:15a6:b0:4f7:6685:2c5f with SMTP id
 bp38-20020a05651215a600b004f766852c5fmr6169202lfb.61.1688771577765; 
 Fri, 07 Jul 2023 16:12:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 02:12:45 +0300
Message-Id: <20230707231251.3849701-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 07/13] drm/msm/dpu: drop unused
 dpu_plane::lock
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

The field dpu_plane::lock was never used for protecting any kind of
data. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..aba5185e1d66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -78,8 +78,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 struct dpu_plane {
 	struct drm_plane base;
 
-	struct mutex lock;
-
 	enum dpu_sspp pipe;
 
 	uint32_t color_fill;
@@ -1186,8 +1184,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		if (pstate->r_pipe.sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
-		mutex_destroy(&pdpu->lock);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
@@ -1447,8 +1443,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	mutex_init(&pdpu->lock);
-
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-- 
2.39.2

