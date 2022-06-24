Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B03A558CA0
	for <lists+freedreno@lfdr.de>; Fri, 24 Jun 2022 03:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D5810E5AB;
	Fri, 24 Jun 2022 01:07:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE80710E5AB
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 01:07:15 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id l2so82059pjf.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jun 2022 18:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PrOfsAJIfOET38Ruitzwe8COyB98R63F6lwvMnTddZg=;
 b=g+Xxj/+FXBllo7eZsBM3bnRq/cjogtOPdisvBjW5Ib8e9hQC6AthBor1Q7dpeNgRH0
 BZwLmM5tJ2zjhw//s16XqKMuxuDSdxRF06UqnpSgU1zecoBNMbdY3gwElWUJwBNAMTIu
 XyKqVy0B2vBZ51UDYTGfRnZxsuC8J8Acd5NPhTtutHPfRI9bTRU/fIfLrZ6uB82wbUwT
 7UMDGpJDp1meh14SAeK4KTirYpHtndpD8JQSis9tboCYDmaPFyal/UTOpXXj4XTL4tFR
 9pJ9wztVYR+Glshx9IwCKO0Jt8/mll/q2zMt6ixuDwyt/g/t2Iqmz5EWrU/4NCtZNNqi
 OTsg==
X-Gm-Message-State: AJIora8daXLgZybm3/zyBD1CoPgtZFcQAkBk0BdJfBb3HuANBOnvvHFk
 sMUg8IJCyrrXawgLMBqwq8AvQ7IIlc1M
X-Google-Smtp-Source: AGRyM1ufQ4kmgn4lrWcEKwVDEb3ZW2Hpq6oqy5hDNX+3qcqD4dTRjm5nSUsdiBekVKlLSKxa6s5paw==
X-Received: by 2002:a17:902:e1d1:b0:16a:1748:19a8 with SMTP id
 t17-20020a170902e1d100b0016a174819a8mr27925718pla.80.1656032835351; 
 Thu, 23 Jun 2022 18:07:15 -0700 (PDT)
Received: from localhost.localdomain ([156.146.53.107])
 by smtp.gmail.com with ESMTPSA id
 63-20020a620542000000b0051be7ecd733sm32620pff.16.2022.06.23.18.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 18:07:14 -0700 (PDT)
From: sunliming <sunliming@kylinos.cn>
To: quic_abhinavk@quicinc.com, robdclark@gmail.com, dmitry.baryshkov@linaro.org
Date: Fri, 24 Jun 2022 09:07:03 +0800
Message-Id: <20220624010703.541191-1-sunliming@kylinos.cn>
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

