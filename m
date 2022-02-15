Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47694B6F68
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 15:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454A810E46D;
	Tue, 15 Feb 2022 14:53:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800E910E4A0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 14:53:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j7so19991552lfu.6
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 06:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCLnsVTMtDHaflKFgpnSqZKust3IH7T2akrv1b5RakE=;
 b=SiLa0SXnDqJU4mzuOMaYe8l7tE//bxQIJvXKoa2FHfpF9ssesCZ6aoK8GIhWBtaZLP
 /Fv6Kkpjyi/4O/1gfV27g3we8oHaf6AV7PQV7AaoDluExl6Nzzdpd93fhtRI1SH5cYDh
 2vb8DwxEF9swvfPy227E0fYg3WOUdJfzbmWO8+N3nkUho/LL4XzZ8+67ip6Gfp0spsQ3
 kNdSc10k5lIldy09hVn0NkpBPWFp8Wfy5+DArDSOqhVohBywAjI63gRa+GAR9zi7NmvH
 LXgcQ+minUjFOM60ajWvZmVbQIJw6dQZCepkvNnS8O80aK4pDZIe1ciUQ5UbFtG7WwAm
 9pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCLnsVTMtDHaflKFgpnSqZKust3IH7T2akrv1b5RakE=;
 b=wUykBSN9ZiZHihOylomfsksGyfn8BA5+pwO98yR49cZg59bpoNWpkV/x/yESyJ+aR5
 E5wKkUUWaaEah30BHqJIdM4SNMxrhzfl5XFiNX89vwom5lgebsa9tmgztvPhFO0w4Xh/
 qyYu1xElNu6Rdt0Y1RfbGy05YGjWMZWXDxxLgHPW+9eDKwUQi1ktnRb6d5YjCiS5tkUK
 zxJHpXzBWssaPHCUum1G1OourYO2jHzMX1w/SBtn6wUK22sGgwNn/ASYROKUZbnMYE/z
 kPeZSgD62tdmPYEJDFiyLzO5XPlPEy8XN4eWdJY0qUEz+n4PE55+2/0oMjmjxMMis9E2
 vdtQ==
X-Gm-Message-State: AOAM530eekCBrkievas3uyHinBZ3PrnhO2D/ermW+827bppHCrJ1k+vu
 PlMqwVvBeszE4MneCEw7LRpplw==
X-Google-Smtp-Source: ABdhPJw/PzUTNP/HXoGUBcKO6idIoKUQ07uo23PGIt1CsX5Zs/D52QXUhnI2EJrnNPO159PfLwUQTQ==
X-Received: by 2002:a05:6512:c09:: with SMTP id
 z9mr3397519lfu.303.1644936788846; 
 Tue, 15 Feb 2022 06:53:08 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f27sm273182lfk.239.2022.02.15.06.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 06:53:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 15 Feb 2022 17:53:06 +0300
Message-Id: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: drop unused access macros
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

The access macros BLK_foo are not used by the code, drop them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index cac0298aeb52..975ff3a4ae3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -778,22 +778,6 @@ struct dpu_mdss_cfg {
 	unsigned long mdss_irqs;
 };
 
-/*
- * Access Macros
- */
-#define BLK_MDP(s) ((s)->mdp)
-#define BLK_CTL(s) ((s)->ctl)
-#define BLK_VIG(s) ((s)->vig)
-#define BLK_RGB(s) ((s)->rgb)
-#define BLK_DMA(s) ((s)->dma)
-#define BLK_CURSOR(s) ((s)->cursor)
-#define BLK_MIXER(s) ((s)->mixer)
-#define BLK_PINGPONG(s) ((s)->pingpong)
-#define BLK_INTF(s) ((s)->intf)
-#define BLK_AD(s) ((s)->ad)
-#define BLK_DSPP(s) ((s)->dspp)
-#define BLK_MERGE3d(s) ((s)->merge_3d)
-
 /**
  * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
  * hardcoded target specific catalog information in config structure
-- 
2.34.1

