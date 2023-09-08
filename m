Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA587980C8
	for <lists+freedreno@lfdr.de>; Fri,  8 Sep 2023 05:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E0E10E854;
	Fri,  8 Sep 2023 03:05:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFD510E760
 for <freedreno@lists.freedesktop.org>; Fri,  8 Sep 2023 03:05:26 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bcb0b973a5so26521001fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 07 Sep 2023 20:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694142325; x=1694747125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FX3U4Kv6boSoIeXiFA0GqPmb+Xk7f6TWSY7AwcdRtXw=;
 b=Y+S0fjxYOQ9vdF6wm/8JWTuB4NTjsY8X+sCyE/gCvTeFu3uQuNuYO5kzRB72Dz8Upl
 GpOYzLOs+pQL6A0YfnaJjIUBCit24JOhcbBNtTVcunJtqw5qcAtVZ2AsYZ0LfbYNSZtB
 RTrN4JGhLSM7GdjNv8NNsZKaG9mSk6ISTxixLGkNg490z8gKHwQ5jI+A57VsoRYiOoDA
 MmFu4SAhYLxpfuSrh5fa3uxiporgnuv8Uhr2plp/u3XfyBXBZZ9mQBpfd1BW1WSQeWNs
 bxyDKt4jMdsFLUR09iLv1vZTm3kG5FsUP9QKTbSqhphBnCYNwQjCKLzfAV8H9d5pxBBh
 M6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694142325; x=1694747125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FX3U4Kv6boSoIeXiFA0GqPmb+Xk7f6TWSY7AwcdRtXw=;
 b=lUFxZN2CavGFRdalPxFigl1DrwsWhnFKm9q8E5PgOcCt1gMMVDAteq5gkkILtmSuLm
 KrDHEvZ7+gpQ+6cxUGBh3V8C2V7BSXpWqZ5AN82FdzOMb7/y7QILCUM4MiWjwDYaBPB0
 TwD9s7H40lg4M7Tsa5NTNKddBSJ9bM7H1NWQh6x4TbGU/PCBndMt5FJEL68/A9rqp6Ga
 HnJkV0VtPpXtUx/JQbkJd6XD/QkmRc6/+Hax3ZB74wh+TvRWfZn6RP5aqjBLFlBlsM6F
 ZjESw5lUFY7j1QfzvR5KcrXxiJ1+E0jEXTigfa/6nx1KtImNZ4FY5kHLFJ7FOpwSwlaZ
 S5EA==
X-Gm-Message-State: AOJu0YytRci4MEHUvO/TTVsBQ+QQZ0Me3XfA3+Ii71a9HtN2Wygf/oq2
 xfBAyrA1wuyh+DgNuM4CoSZzng==
X-Google-Smtp-Source: AGHT+IE1UWo6gyoG9WOKNs/u/38JmWyXkL5hWEPnw8XhwXskinhp5YUgh8TkpIKV0TF6lTqgb7Va+A==
X-Received: by 2002:a2e:97d7:0:b0:2b9:f13b:6139 with SMTP id
 m23-20020a2e97d7000000b002b9f13b6139mr782892ljj.20.1694142324853; 
 Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Fri,  8 Sep 2023 06:05:19 +0300
Message-Id: <20230908030521.236309-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/5] drm/msm/dpu: drop global_state_lock
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since the commit b962a12050a3 ("drm/atomic: integrate modeset lock with
private objects") the DRM framework no longer requires the external
lock for private objects. Drop the lock, letting the DRM to manage
private object locking.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fba2294e329f..ee84160592ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -328,11 +328,6 @@ struct dpu_global_state *dpu_kms_get_global_state(struct drm_atomic_state *s)
 	struct msm_drm_private *priv = s->dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_private_state *priv_state;
-	int ret;
-
-	ret = drm_modeset_lock(&dpu_kms->global_state_lock, s->acquire_ctx);
-	if (ret)
-		return ERR_PTR(ret);
 
 	priv_state = drm_atomic_get_private_obj_state(s,
 						&dpu_kms->global_state);
@@ -373,8 +368,6 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 {
 	struct dpu_global_state *state;
 
-	drm_modeset_lock_init(&dpu_kms->global_state_lock);
-
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
@@ -388,7 +381,6 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
 {
 	drm_atomic_private_obj_fini(&dpu_kms->global_state);
-	drm_modeset_lock_fini(&dpu_kms->global_state_lock);
 }
 
 static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index b6f53ca6e962..ed549f0f7c65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -84,7 +84,6 @@ struct dpu_kms {
 	 * Global private object state, Do not access directly, use
 	 * dpu_kms_global_get_state()
 	 */
-	struct drm_modeset_lock global_state_lock;
 	struct drm_private_obj global_state;
 
 	struct dpu_rm rm;
-- 
2.39.2

