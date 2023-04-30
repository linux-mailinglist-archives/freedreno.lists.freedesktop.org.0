Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1B6F2AD0
	for <lists+freedreno@lfdr.de>; Sun, 30 Apr 2023 22:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E0910E0EB;
	Sun, 30 Apr 2023 20:57:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEFA10E0A9
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f0108a7d20so2245180e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888235; x=1685480235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxMIlhE+xo1ndRNL8TNhFy+W+mxe0zzz0yJ/CAW62w4=;
 b=VO/JrwDg94kbsUdw9EK5ccKxqJlrawqyw5q0ef5tpIPXaSNp03qXp3v7A1pxt9guPO
 vdg2hjQg5eTgKlvO6H8fviQRKIEdH47T6HUuje3MTVwcGMG141LyHmz1sJvWs31FNGQu
 vd4x4QeJKkiyYBAakjcorNnvPVhWfmeWxxW8UTH7V3CTtTeeiD+/VXdwQ2wOBa6Ay6Py
 ZYWmam5Zjrr0nIaaTkd4EyeRG6ltmA++AEMEXIIoDY7T1ZcPZgGVSW9rrlMP6e+ds8S9
 2YJZ77tnboxxTXCl/cIzlFSj8R+mExhpVwv8KdZBa7xOfzHU6vkRryyXxRzBSaiqSVUX
 dxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888235; x=1685480235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxMIlhE+xo1ndRNL8TNhFy+W+mxe0zzz0yJ/CAW62w4=;
 b=EYSt4PG9hIzWGyBkB+dkT+Pnv/WW7guo6pXBazSPCM0Sh/JZZc4VNqXutGZ7LgbBUS
 6lZKMjK3jE1LqY01NU47HpDMAQTVV6ygLkHOmMqbcnpCJYKIB+p5eIHzzNqAFGP3oaGN
 8ATayShkKPyfOupKnYY5OWZK/AnuCyXO9Sm84r4RfQj7vmYdOTDI4vMt0C/jUr4UGnga
 nvifgbtkucbN/9bg1ydLKRIKUbgVGSNxwoIj+V413zykw5+cO5kUctlG/WGZ9TenmBKe
 FUs4l05fsS5sAqgSaGIThodjygJSB43idkVgJ1IHNFLn7va/zpJYZC6BlOGTWArrwYwx
 vf9A==
X-Gm-Message-State: AC+VfDy6LekzXGtaKF/tKLG6frdZ0pykunFp+9PHe93J9MXhUEEFWPjg
 iFLT7UTNJ11UC8+kJMFoC6z6OQ==
X-Google-Smtp-Source: ACHHUZ75oe2mpelzwjC1zNnI6eL3nDKdEoAQfJ145W+UsY93FRLEu3NU1KQH8EG2DWSdeE9Szy27OA==
X-Received: by 2002:ac2:414c:0:b0:4eb:2e5c:e0a with SMTP id
 c12-20020ac2414c000000b004eb2e5c0e0amr3503756lfi.41.1682888234872; 
 Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Apr 2023 23:57:05 +0300
Message-Id: <20230430205710.3188230-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/9] drm/msm/dpu: rearrange QoS setting code
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Slightly rearrainge code in dpu_plane_sspp_update_pipe() to group
QoS/LUT related functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 36f6eb71fef8..4a5a58152fa8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1079,10 +1079,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
 	}
 
-	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
+		_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
 		/* skip remaining processing on color fill */
 		return;
 	}
@@ -1123,12 +1123,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
+	_dpu_plane_set_qos_ctrl(plane, pipe,
+				pipe->sspp->idx != SSPP_CURSOR0 &&
+				pipe->sspp->idx != SSPP_CURSOR1,
+				DPU_PLANE_QOS_PANIC_CTRL);
 
 	if (pipe->sspp->idx == SSPP_CURSOR0 ||
-	    pipe->sspp->idx == SSPP_CURSOR1) {
-		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
+	    pipe->sspp->idx == SSPP_CURSOR1)
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
-	}
 
 	if (pstate->needs_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
-- 
2.39.2

