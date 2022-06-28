Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEBD55BCC2
	for <lists+freedreno@lfdr.de>; Tue, 28 Jun 2022 02:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28510E3DD;
	Tue, 28 Jun 2022 00:52:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7BB10E3DD
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jun 2022 00:52:18 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b2so2658433plx.7
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 17:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxFLykTwoVQ3UQOo8TuHdysXUGeMP/aljqZIpHUoMrs=;
 b=wUcipppjFco4R2sKgyFAX2RU1TWE4lBECQQcqp1oMaA+MYw/j62soU7HiiX/ZlZBc+
 B3RD7eLNRSglMJw9Yik8hgXjHzw1vwAbSs88dX+MxgbIqLYzW14kD4LyoBDst7/6KzU3
 23FCt5frIwaTnxPMzL2bxJNp5DUgAqX5pU3y8JtJMxUMDBNnreJdOyyzA/1tn/HsigLs
 IOvdKZPqeUPLTRBxLmyVH1BZHlYGnzcpwPcJ4iGm+OEEPL7qKpNlcHKjcRN4lv0jHtRq
 fAFOvbAsSVGRg7eFIaJy9qqz9INi1k9g3lXAgvjDhJrXBOXCBOR6yPEYaTnRXpNZcA9z
 f8rA==
X-Gm-Message-State: AJIora++o9O48ulJObq3yIeslE43l4r5192bGDzAgQCAkwb54Jm0+63j
 bp1OYRZ8HeaVhmuXNEqP9A==
X-Google-Smtp-Source: AGRyM1ssFSnRV6rkpTstqoArtoFLNo0LWpcH0QBqlwfzE/NlvUxFtp1emTZ6QD9qEpht3qK43SlmFQ==
X-Received: by 2002:a17:902:8e86:b0:168:d6d6:660f with SMTP id
 bg6-20020a1709028e8600b00168d6d6660fmr930658plb.35.1656377537962; 
 Mon, 27 Jun 2022 17:52:17 -0700 (PDT)
Received: from localhost.localdomain ([156.146.53.107])
 by smtp.gmail.com with ESMTPSA id
 u27-20020a62d45b000000b0050dc7628148sm7961421pfl.34.2022.06.27.17.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 17:52:17 -0700 (PDT)
From: sunliming <sunliming@kylinos.cn>
To: quic_abhinavk@quicinc.com, robdclark@gmail.com, dmitry.baryshkov@linaro.org
Date: Tue, 28 Jun 2022 08:52:04 +0800
Message-Id: <20220628005204.838739-1-sunliming@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH RESEND] drm/msm/dpu: Fix variable dereferenced
 before check
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
Cc: kernel test robot <lkp@intel.com>, kelulanainsley@gmail.com,
 linux-kernel@vger.kernel.org, sunliming@kylinos.cn,
 freedreno@lists.freedesktop.org, dan.carpenter@oracle.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following smatch warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:261
dpu_encoder_phys_wb_atomic_check() warn: variable dereferenced before check 'conn_state'

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: sunliming <sunliming@kylinos.cn>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 59da348ff339..0ec809ab06e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -252,11 +252,6 @@ static int dpu_encoder_phys_wb_atomic_check(
 	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
 			phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
 
-	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
-		return 0;
-
-	fb = conn_state->writeback_job->fb;
-
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
 		return -EINVAL;
@@ -267,6 +262,11 @@ static int dpu_encoder_phys_wb_atomic_check(
 		return -EINVAL;
 	}
 
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+		return 0;
+
+	fb = conn_state->writeback_job->fb;
+
 	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
 			fb->width, fb->height);
 
-- 
2.25.1

