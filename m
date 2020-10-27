Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F6F29A97A
	for <lists+freedreno@lfdr.de>; Tue, 27 Oct 2020 11:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85766EB62;
	Tue, 27 Oct 2020 10:23:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F656EB63
 for <freedreno@lists.freedesktop.org>; Tue, 27 Oct 2020 10:23:09 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h6so1635861lfj.3
 for <freedreno@lists.freedesktop.org>; Tue, 27 Oct 2020 03:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCnAt3Ufpnd8qDbD+eSLDRky0zifegBLynE3fwmlgnk=;
 b=oq8XdJgwY33aXp0n2GrQDQSAwWGWnzcqqi3/5sSrHBhsrCE4hn9+Kk9Na3ypkP+MKg
 ag8ZfJQEJ1BhEMtGYYZVXisWeaimoqFjFjShC97cm4igo4PgLVzgTlFq9qBeyjdCXTz1
 dgLkhfyXfHooLHjcQhVN/G4si1mLKTlAX7ApKsuwP47g2wrgC/YIPXSi8XfbW+ikUuZI
 hIMc5e1LxCeRHIqVp0bpXHR92VfNQW/a6bAvaW3Nq2lLwlLdti9vAoORe5vERzbFU9Sr
 eOwXtCZWGA8TwQwgz0Y7z1Uui09DHdTUUIt/e23yVLBmSzvar4EI/h/l9YMTqtwCkxzw
 T75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCnAt3Ufpnd8qDbD+eSLDRky0zifegBLynE3fwmlgnk=;
 b=og66xmN3PPl3bY79Kw6pq5SDy6u/qLkhPJSqFzvSIr1Vg9OMITVmWyEzyhmWiumKXk
 oUgR1KpPGi3/qt30+4d6meWMdXIu3pXYiEihfEbMxqWd7yiLVFIHC86HXkOU72B3DzRg
 R4lC2KuJYcVvsmSAwnuelwjvNoXi4PVepAqIZ4r5oEysGZREg27cbEdoWIZXJvfwAkOs
 s7+twM0Vdt3Sagc5cKY+oegt9PTdcny8AGBvBJYo3d+zPzx84iiMnUqOc0Fl9CMhczGl
 MIvOiLl/wVsOdaNh4nfkRh44FxCj5F+q2Y+yjvTwWBlaGOkJbv7VaXXpsZMmsG06MXuS
 TrBA==
X-Gm-Message-State: AOAM5328KgQWIX7/DSTjMzxIzmgljqza6uk/Ltg43Ky9OdbTEDO1Ef3E
 etd4cKuprbrpIl0/xSiSSU6Jnw==
X-Google-Smtp-Source: ABdhPJyLMOnr5LkkVIrfKPzhut//bBvlIxsF2Uhz6k9PUSL+0zZ+iGQhqxrS88DLYpePA1A4urntGg==
X-Received: by 2002:a19:2d15:: with SMTP id k21mr652619lfj.276.1603794187857; 
 Tue, 27 Oct 2020 03:23:07 -0700 (PDT)
Received: from eriador.lan ([188.162.64.248])
 by smtp.gmail.com with ESMTPSA id h2sm127327lfd.82.2020.10.27.03.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 03:23:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Date: Tue, 27 Oct 2020 13:23:04 +0300
Message-Id: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dpu: fix clock scaling on non-sc7180
 board
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
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <kalyan_t@codeaurora.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for
display") has added support for handling bandwidth voting in kms path in
addition to old mdss path. However this broke all other platforms since
_dpu_core_perf_crtc_update_bus() will now error out instead of properly
calculating bandwidth and core clocks. Fix
_dpu_core_perf_crtc_update_bus() to just skip bandwidth setting instead
of returning an error in case kms->num_paths == 0 (MDSS is used for
bandwidth management).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 393858ef8a83..37c8270681c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -219,9 +219,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	if (!kms->num_paths)
-		return -EINVAL;
-
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
 			curr_client_type ==
@@ -239,6 +236,9 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 		}
 	}
 
+	if (!kms->num_paths)
+		return 0;
+
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
