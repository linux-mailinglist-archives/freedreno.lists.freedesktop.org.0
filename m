Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C875557F5B
	for <lists+freedreno@lfdr.de>; Thu, 23 Jun 2022 18:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CAF10E10C;
	Thu, 23 Jun 2022 16:09:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BFA113695
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jun 2022 01:27:16 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d129so17680358pgc.9
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 18:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HNPzzADt89xo5zs6PZNoGyHBhvApF8RGasyMsX1K6+Q=;
 b=N++oHvHRfC+7T3CL0gV+gLnhavRZnSqvLfuI3jZxIHYFyD22Vs5foTiT5ZaMCtajSC
 J2hlWmyhmX6iFjSJaUB0VBAMZdewFwAsDYGehHmdHS2TcTvnIMb02cBb4fhphhaeDdJK
 MCaSMXXBP4X7FQd3ZBWDBXPIDYTE7Uunw1xgy8FedPVeOzI/4JsDzgK+uj6Ls8nwO1pH
 XvkzEmGdG6+lAZMdXifEeRWzKRr7L3cpNQlOU6B69YFjEIAsutylz3NOwOWfd0fKT9Sq
 mglJCxPwxi8/nVLNe5HgTlpaqSvwxbFvNRBZiC6Q/qU8JPtY+r7UnNnaMqRR03rZDAZ+
 VtYQ==
X-Gm-Message-State: AJIora+HNsLGMaPKlClKp3bX15j9VwDQIFcV5KwEa6grU0keY8Mdgnv1
 lmpsuq/c+haqYKW1HvN8U6tovztN8G7J
X-Google-Smtp-Source: AGRyM1slyIMjS+dECh4SopuEF2n3vHBOXmq2DPnk2fOXCjRzZuZeUYSXEtu0dJzsatkcU1zoVwBIlQ==
X-Received: by 2002:a63:1846:0:b0:3fd:dd12:ffa8 with SMTP id
 6-20020a631846000000b003fddd12ffa8mr5339853pgy.337.1655947635915; 
 Wed, 22 Jun 2022 18:27:15 -0700 (PDT)
Received: from localhost.localdomain ([156.146.53.107])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902e74d00b0016a4a57a25asm2255342plf.152.2022.06.22.18.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 18:27:15 -0700 (PDT)
From: sunliming <sunliming@kylinos.cn>
To: quic_abhinavk@quicinc.com, robdclark@gmail.com, dmitry.baryshkov@linaro.org
Date: Thu, 23 Jun 2022 09:27:07 +0800
Message-Id: <20220623012707.453972-1-sunliming@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Jun 2022 16:09:17 +0000
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
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following smatch warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:261
dpu_encoder_phys_wb_atomic_check() warn: variable dereferenced before check 'conn_state'

Signed-off-by: sunliming <sunliming@kylinos.cn>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

