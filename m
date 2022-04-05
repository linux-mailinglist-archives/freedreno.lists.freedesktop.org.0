Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39A4F481C
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 01:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A7F10E60C;
	Tue,  5 Apr 2022 23:51:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2008E10E48A
 for <freedreno@lists.freedesktop.org>; Tue,  5 Apr 2022 23:51:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p15so1179887lfk.8
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 16:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GdBxSh9sm8JFxfcg4oZuWWjNQ4XkQKxAD+ykd2e7Nqo=;
 b=a1MrN49R7Y+OXVs56RUzeKwoND1E0SLksNg3VGcWXZTzNDbb3zzEMPXJ6ku+pX72/L
 jnsqp2kp4B35YeytTJBtFtRNj8Mig39RygT8v2RsUDzsaPAxTRPL4Iks6eOQqOBZD+PO
 qrG448SjP8q+oKjNU5JRQqK/4fh28kjGZ8JH6Zqd9qFD150qhjvabZEkW49HqsC60LOa
 VSQRxwFxvmtDtXZPO1r9je3+sqTRkz6De0c1Q6QPRvdzK7iXjv6TGeluHzCjQR0F1KhD
 o9UqaYP8kkSysqjfNg049A35T64SFNz1vmHo3xaLz2MmBOxG1dcYbIZ3LAhAR03at1g2
 umMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdBxSh9sm8JFxfcg4oZuWWjNQ4XkQKxAD+ykd2e7Nqo=;
 b=D6dvX5GjasNT00xJNQL9hFL1utebkEZXnVpVEoyIVm6SxiidBGN5o7TRvg+djA54xM
 XhtZLifg8pmSkIEVlqWL5U4supTMujJWWfbP1/R0IwYaOPsJtJjo9NR0m4m86weKCv2m
 OU2zhEnzx6hnF9vTGcZqAZNWDO8hTrTfhYoPN0sK26cdph/G/VmhtxSjnxNjUboOnY89
 FavgPlQHrtwj9gEcVF2get02GKriCFae45EMKVD5QwgRQ6gcY9Tn7IFwvvXlV2BYvu/k
 9yz2nI3rV+T68DYbVZGFLrvFkU3BgM9V8aqAi1OE156V2vs0eeJvy+WG9B7Kd/GDNPPm
 JPKQ==
X-Gm-Message-State: AOAM5337duyNOdDwj9fZ2YVEiXAVZldLtmkvF4hFkrDVdRv6H/oHAZpr
 h9XhbtdUwnr3oiq9JXspHtombYXdVWTq4g==
X-Google-Smtp-Source: ABdhPJxbihuuvB0EymKlPYm1DN2/hIoDbDRW283pP9l8yyUgGD4CiLfRQ2M+4enOXS9v/1+CCveTXg==
X-Received: by 2002:a05:6512:3052:b0:44a:5104:5646 with SMTP id
 b18-20020a056512305200b0044a51045646mr4095313lfb.286.1649202662488; 
 Tue, 05 Apr 2022 16:51:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f26-20020a19381a000000b0044ad7a29b4csm1645280lfa.37.2022.04.05.16.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:51:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 02:50:58 +0300
Message-Id: <20220405235059.359738-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/3] drm/msm: loop over encoders using
 drm_for_each_encoder()
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

Rather than manually looping over encoders array, use standard
drm_for_each_encoder() macro.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 5 +++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 6 ++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d0525a9ea92b..0bc33243dae8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -681,6 +681,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	struct drm_plane *primary_planes[MAX_PLANES], *plane;
 	struct drm_plane *cursor_planes[MAX_PLANES] = { NULL };
 	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 
 	struct msm_drm_private *priv;
 	struct dpu_mdss_cfg *catalog;
@@ -745,8 +746,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	}
 
 	/* All CRTCs are compatible with all encoders */
-	for (i = 0; i < priv->num_encoders; i++)
-		priv->encoders[i]->possible_crtcs = (1 << priv->num_crtcs) - 1;
+	drm_for_each_encoder(encoder, dev)
+		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3b92372e7bdf..2ba06f979f72 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -434,6 +434,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
 	struct drm_plane *cursor[MAX_BASES] = { NULL };
+	struct drm_encoder *encoder;
 
 	/*
 	 * Construct encoders and modeset initialize connector devices
@@ -499,11 +500,8 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	 * Now that we know the number of crtcs we've created, set the possible
 	 * crtcs for the encoders
 	 */
-	for (i = 0; i < priv->num_encoders; i++) {
-		struct drm_encoder *encoder = priv->encoders[i];
-
+	drm_for_each_encoder(encoder, dev)
 		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
-	}
 
 	return 0;
 
-- 
2.35.1

