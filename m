Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E359C543
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 19:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625208BF28;
	Mon, 22 Aug 2022 17:44:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A6A10E258
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 17:44:20 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id l1so15782821lfk.8
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 10:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=pPgFBD7q3E3eicH1Pv3awZm8nZwSgddbX6vYO9NgS5s=;
 b=tKiS5nRGw+aixKb+4e2oD8qwOCfiuLqBi6o0G0b5aXjKruh3Wk+aVld6woWNtrkcoA
 FVXQbgyR/r+arZ5Qro+NmeaAeUm1J/BXKtkgtxX5Fkn3vnSrKw/Dtfr3a+jrZj1O9G2i
 mODLBzcL9eyDtvnVphp05DjRwPFFkBjkAaAHUN7rgybymq8O9egjysKQifVSqt7oMfGD
 lkFyQvrrZV0sdydZLd00P+qqRxKblnvLYtoPXn4F89CdSPis7tdHz2RlkFSZRYYyJqbR
 WLHb7Usvg6UDZuF2aDrVL3T1leXrFNMbtz36x1WXYPzc718DT8/bE6wue7GgEBn304ek
 ncFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pPgFBD7q3E3eicH1Pv3awZm8nZwSgddbX6vYO9NgS5s=;
 b=7QUKEOPJVTMzdXIvmSyo4WoiJKY7zDfq1cfz2hVaOt50TXnl57rSY9Nr5OJg7L+Wpf
 JD7d2b/XDq//6Jq4u41idMNi2Vt7M4AqRCveMjDNwwyIxzDNo4JcenHCk/0CLUhX+9Rl
 ooA5aHKkl6jThR/0K7QpSDPQnyMT9VFFzEQRUIDTrdUPeIVmAD+ALg7GEUMhaXwQUDjH
 UU37OupxnksLnLirp7pK44otLuuwZY0h4nRTB0XhTLs4LWr1rzXW9nRmPA9b5jJuyllE
 OaAeAbD1nbT3EI5wf0N2M3JoTHJY8GDmGdnQO2hjI+RcWDv1rB74XnH+CK87361BOINV
 wLrg==
X-Gm-Message-State: ACgBeo3OR0s9Dw2u/ojJD39OAe5T7y7G/RQslpmZWJcP+puwNsV/1Ha1
 +gEYNBDR7UPde6uN3zj/oRx2Ug==
X-Google-Smtp-Source: AA6agR7TmR9HnV5ntDFtZKkSVFvPlc09+DbRAW4QsmCohy13NJfdZ/NlptxVK9QM16q7uQVJB8vl2g==
X-Received: by 2002:a05:6512:3a94:b0:492:b321:8f75 with SMTP id
 q20-20020a0565123a9400b00492b3218f75mr7393314lfu.366.1661190258966; 
 Mon, 22 Aug 2022 10:44:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05651203e800b0048b13d0b896sm327180lfq.141.2022.08.22.10.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 10:44:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 22 Aug 2022 20:44:17 +0300
Message-Id: <20220822174417.292926-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dsi: drop the hpd worker
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It makes no sense to have the HPD worker in the MSM DSI driver anymore.
It is only queued from the dsi_host_attach/detach() callbacks, where
it plays no useful role. Either way the panel or next bridge will be
present and will report it's status directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a34078497af1..43bf84e92a7c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -144,7 +144,6 @@ struct msm_dsi_host {
 
 	u32 err_work_state;
 	struct work_struct err_work;
-	struct work_struct hpd_work;
 	struct workqueue_struct *workqueue;
 
 	/* DSI 6G TX buffer*/
@@ -1500,14 +1499,6 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 	return len;
 }
 
-static void dsi_hpd_worker(struct work_struct *work)
-{
-	struct msm_dsi_host *msm_host =
-		container_of(work, struct msm_dsi_host, hpd_work);
-
-	drm_helper_hpd_irq_event(msm_host->dev);
-}
-
 static void dsi_err_worker(struct work_struct *work)
 {
 	struct msm_dsi_host *msm_host =
@@ -1697,8 +1688,6 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 		return ret;
 
 	DBG("id=%d", msm_host->id);
-	if (msm_host->dev)
-		queue_work(msm_host->workqueue, &msm_host->hpd_work);
 
 	return 0;
 }
@@ -1713,8 +1702,6 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
 	msm_host->device_node = NULL;
 
 	DBG("id=%d", msm_host->id);
-	if (msm_host->dev)
-		queue_work(msm_host->workqueue, &msm_host->hpd_work);
 
 	return 0;
 }
@@ -2126,7 +2113,6 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	/* setup workqueue */
 	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
 	INIT_WORK(&msm_host->err_work, dsi_err_worker);
-	INIT_WORK(&msm_host->hpd_work, dsi_hpd_worker);
 
 	msm_dsi->id = msm_host->id;
 
-- 
2.35.1

