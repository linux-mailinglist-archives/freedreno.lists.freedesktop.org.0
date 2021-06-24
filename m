Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99D03B320C
	for <lists+freedreno@lfdr.de>; Thu, 24 Jun 2021 16:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0FF6EC28;
	Thu, 24 Jun 2021 14:58:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867156EC26
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:50 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id d13so8120990ljg.12
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4naGYo6Q7vXKVyJFMwcq6Oq3/UZm+MxRt8NyXrzXPuc=;
 b=b5Hb6gwlVgE7E9fxC+jhksQM3CacT3Ee6wIxCO13yES6cmq1+Bbv8XdeJS2xvX0KPy
 PTYO7f78kcfA0heSnreu8XuKWPgKbl7iEKlkD5RvKvvJRv0lamgXKusE7aVtr1qjnKhJ
 ze//Csgb+Kr0zTp5r+ucjAUc1M0ds+SPafSqVCK2jy2aRJcO1vnPxOseAQYVI9yFAeM1
 ton8nZ1ywugAr93GNZ7VE0XdWX4nK/n8lAKqZ1henNgcloTJapbya73DBZpJa8/HuKEa
 OP79Ki8flUDDReVM+sAbi3vKmG1O+PxbSslsfbUTAtZMGffedlNEDWK7BR133009ENE2
 eUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4naGYo6Q7vXKVyJFMwcq6Oq3/UZm+MxRt8NyXrzXPuc=;
 b=UsLXZobgQ6LMGTvI2wIhwqOtR0jqkkhA9yDi94n0z881+zHN6pGYtMBhi809p9ur7I
 FdOVm154+sGc057ePXuFtnWu/67xh4XWiHRvXUhF5VgpABcluacSK5TaEfk4p8O+CKxI
 BlM4FHov1cKtP1I7IIw1gkF9WKNOj7bj2Hhv7Hss0+h366q1BOj1T6BSPGdwxiu+n/YL
 w0mJEZ3K5NeLFlpI6Ab1SXsn+Fia/N9XnXguEp7zP0RJmfpVRd/naf2w8KVXguqvkRxC
 gHRTQxmsXQ+u7Pn6aXsas+mH6MPb5iH4xjg0u6nY+YChMG9uf8ZLo0t92ROKJ4gUP8/o
 jwJw==
X-Gm-Message-State: AOAM5307pXm5JcMgxVP0eIH2Rj92kMi7y5Gp5tFWf0KA6iM3wBzRlNNI
 u0ZpuF/Nmev9jeB/nhGG7aetBg==
X-Google-Smtp-Source: ABdhPJxUoVSVazVY3Zn8HYTwVgBxA3JQEQAxELpvDBRiC5HLPvm4PS/M8kT8Xo2G3ecdzf4RsM23sQ==
X-Received: by 2002:a2e:8748:: with SMTP id q8mr891051ljj.508.1624546668845;
 Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 24 Jun 2021 17:57:30 +0300
Message-Id: <20210624145733.2561992-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 14/17] drm/msm/dpu: do not limit the zpos
 property
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

Stop limiting zpos property values, we use normalized_zpos anyway. And
nothing stops userspace from assigning several planes to a single zpos
(it is a userspace bug, but the kernel is forgiving about it).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4658410eedfb..8a8727ff7645 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -44,7 +44,6 @@
 #define DPU_NAME_SIZE  12
 
 #define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
-#define DPU_ZPOS_MAX 255
 
 /* multirect rect index */
 enum {
@@ -1375,7 +1374,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	int zpos_max = DPU_ZPOS_MAX;
 	uint32_t num_formats;
 	int ret = -EINVAL;
 
@@ -1413,14 +1411,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	pdpu->catalog = kms->catalog;
 
-	if (kms->catalog->mixer_count &&
-		kms->catalog->mixer[0].sblk->maxblendstages) {
-		zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
-		if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
-			zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
-	}
-
-	ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
+	ret = drm_plane_create_zpos_property(plane, 0, 0, 255);
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
