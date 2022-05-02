Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FFF516BFB
	for <lists+freedreno@lfdr.de>; Mon,  2 May 2022 10:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D5610E62C;
	Mon,  2 May 2022 08:24:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8B110E62C
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 08:24:23 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id v4so17505834ljd.10
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 01:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7s59/Q17Za6lJHQStBvDJic0/FOMAAkP8fNiF1n5RU=;
 b=rKwwxI4qcnZjlYF1CIXizaLM0mRyTT3aNe6ZMZpubtf31o5Lel5CdUNlQiobr/uitA
 QmhE9hlCPMEjiK3yvipxDRQsv/E8qT20nIg24rLZaSLWyKoJGuaNSFwPkNN5l0+Dcm9h
 lo+joRO6K/bFoqVxa7+RyQaWzb3LY6f4jX/n9elPRxJpLu6uI5xbb746n1ASEEi/l4Kz
 DUdq8Wl3MWpsGn5yenuNdBRhUARySy/2NqaS9g7viu3cxujCFPI7BuND0s4Ax1Vgzy9Q
 sZpxNOqesqOt21ER+EdFaQL9grOoptsjXrU7ZI96SRcD6P6zUFK+HewGJVYk31B8p4nh
 e53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7s59/Q17Za6lJHQStBvDJic0/FOMAAkP8fNiF1n5RU=;
 b=Jvgcaz2QRmc1Y2NrZUNASXLV78dUIy+rKMVnPv/M20lZnhQGgasevicVsKUmiLi4/T
 JrGN/iiAkr8gwxVH+vRclyMNO5FYuI1xI0x3wKtNvxNbs+BGT6zN361DZavmu9Usx3Pp
 byzAx+fRwPsQbSrUSxPVNPDWfwN8u6GN66Q0iOs1TZdMmfQ+lkf+R2DLccGOt38aYIIA
 4WUA+nEEaMdfvxMjIgOAYIUucrSB16YbMYXfqODRcFqpRqRHHxZXMdHydtz18vz/uo9Y
 T+FeFWmCshZcYvSmw5n9DSPHXhluNw6PNyKLbb6ey5CdGAVp6+dKvIrXy3LmeeEyGFTC
 zd+w==
X-Gm-Message-State: AOAM531Kel+ti5xW4ujGNSthjwWT9mIKl0Wsiqy+a1IizSwfYhtY0eLO
 /zQNmnEe202lGOhuivWll5rNTg==
X-Google-Smtp-Source: ABdhPJzCKDUJ9dajLmL2juVoQAnLpONDDplg6cI7LPzhbPdaUY7FmF9Lu77YXD0cgh7lE49BERTIBg==
X-Received: by 2002:a2e:8657:0:b0:24f:14b6:4556 with SMTP id
 i23-20020a2e8657000000b0024f14b64556mr6931890ljj.369.1651479861379; 
 Mon, 02 May 2022 01:24:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z22-20020ac25df6000000b0047255d21166sm643562lfq.149.2022.05.02.01.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 01:24:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon,  2 May 2022 11:24:20 +0300
Message-Id: <20220502082420.48409-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: don't access mode pointer before
 it is set
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Move the initializer for the mode variable to the declaration point to
remove unitialized variable access from the DEBUG_DPU macro. This fixes
the following warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:250:37: note: initialize the variable 'mode' to silence this warning

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index f4a79715a02e..4829d1ce0cf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -247,7 +247,7 @@ static int dpu_encoder_phys_wb_atomic_check(
 		struct drm_connector_state *conn_state)
 {
 	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode;
+	const struct drm_display_mode *mode = &crtc_state->mode;
 
 	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
 			phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
@@ -256,7 +256,6 @@ static int dpu_encoder_phys_wb_atomic_check(
 		return 0;
 
 	fb = conn_state->writeback_job->fb;
-	mode = &crtc_state->mode;
 
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
-- 
2.35.1

