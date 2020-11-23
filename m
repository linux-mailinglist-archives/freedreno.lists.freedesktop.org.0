Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3BB2C0411
	for <lists+freedreno@lfdr.de>; Mon, 23 Nov 2020 12:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A1089D46;
	Mon, 23 Nov 2020 11:19:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D35289A9A
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 10so17529918wml.2
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3KXPNPH8V5VaN08+hIMdkS9m7XFBvKiwB8Jp0+uc0I8=;
 b=Et4Ua0gbI2lsF/nKyKJ08uBA0rrN7fiwXsN2E4qh5zL4954DJ9jwj/4D63PYD3kyUF
 Bae62gQYXsR+eTWN2t3mxb4EfBd5QV/d6BO1QoiX/RSF13p0cROpkYLHPBQISJMIE5Gn
 RMG70h/fOUyWLtkn+Ljl+rwvVL9a4/lsgT8qYyqQ4piHfNihOda4Ptu23rVZnAUUU+wV
 DJauoSYMAZWRDsEoVi+JpxT6I9FCIfpp9NASJs5wsJZX7YZrsATdTWAJYB6uGXW32tPP
 y/A6akMS5XoH2LVSewX+TrlpCBw0lc7BaefRs3LL112L/h1SCCoBKeoDb0e6DS/1Y7LJ
 tTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3KXPNPH8V5VaN08+hIMdkS9m7XFBvKiwB8Jp0+uc0I8=;
 b=B9R/ITVH+yGNyCef7yUuvU4qYeRN1XuMrNK7tpM+eSdnB9PiN3+2FOzB+U/kz9pbT7
 sqdqBtrC4Gs2dalmFExoODOpxHbDLjieEY1q8QSl59R8OP4liAV5QTA0HSQEG1A466eH
 9udmWvQuKQO1jd9UxFtWlr5UI069/D3tZy4Ly7wq5N9NO/5aPCLGtVot7KJjAX2x8xPT
 DQ4hZQhbpqb5TEd1Fw273nneIe1bydg+5QDUDRCIX24DuA6M4A6Cd0StSgHhR61F0v3I
 DCyDBrgfBKJmWa6aR5zdS1W5SPEhHb4pCaq3kr03OES05IIqsmnV7VULhiCu3gKI97CW
 DXmg==
X-Gm-Message-State: AOAM533/uMdB4dg4th0XmL4zBs9Pji2Eubff6PHfFZP2TRa+6P4h0oXo
 d628/5Sx6WP7Nvj3So0tN9Fpqg==
X-Google-Smtp-Source: ABdhPJzDrFY549gFz29vbpQHsjY5rCKiA9MavwzYO5BpIySio30+OpBgTFEDe/Nci/OxlvfH5/1goA==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr22880615wme.23.1606130375735; 
 Mon, 23 Nov 2020 03:19:35 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Mon, 23 Nov 2020 11:18:49 +0000
Message-Id: <20201123111919.233376-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 10/40] drm/msm/disp/dpu1/dpu_core_perf: Fix
 kernel-doc formatting issues
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:31: warning: Enum value 'DPU_PERF_MODE_MAX' not described in enum 'dpu_perf_mode'
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:34: warning: Cannot understand  * @_dpu_core_perf_calc_bw() - to calculate BW per crtc
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:73: warning: Function parameter or member 'kms' not described in '_dpu_core_perf_calc_clk'
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:73: warning: Function parameter or member 'crtc' not described in '_dpu_core_perf_calc_clk'
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:73: warning: Function parameter or member 'state' not described in '_dpu_core_perf_calc_clk'
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:249: warning: Cannot understand  * @dpu_core_perf_crtc_release_bw() - request zero bandwidth

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Kalyan Thota <kalyan_t@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 36927fc04a388..b6b3bbab03336 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -22,6 +22,7 @@
  * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
  * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
  * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
+ * @DPU_PERF_MODE_MAX: maximum value, used for error checking
  */
 enum dpu_perf_mode {
 	DPU_PERF_MODE_NORMAL,
@@ -31,9 +32,9 @@ enum dpu_perf_mode {
 };
 
 /**
- * @_dpu_core_perf_calc_bw() - to calculate BW per crtc
- * @kms -  pointer to the dpu_kms
- * @crtc - pointer to a crtc
+ * _dpu_core_perf_calc_bw() - to calculate BW per crtc
+ * @kms:  pointer to the dpu_kms
+ * @crtc: pointer to a crtc
  * Return: returns aggregated BW for all planes in crtc.
  */
 static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
@@ -63,9 +64,9 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
 
 /**
  * _dpu_core_perf_calc_clk() - to calculate clock per crtc
- * @kms -  pointer to the dpu_kms
- * @crtc - pointer to a crtc
- * @state - pointer to a crtc state
+ * @kms:  pointer to the dpu_kms
+ * @crtc: pointer to a crtc
+ * @state: pointer to a crtc state
  * Return: returns max clk for all planes in crtc.
  */
 static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
@@ -246,8 +247,8 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 }
 
 /**
- * @dpu_core_perf_crtc_release_bw() - request zero bandwidth
- * @crtc - pointer to a crtc
+ * dpu_core_perf_crtc_release_bw() - request zero bandwidth
+ * @crtc: pointer to a crtc
  *
  * Function checks a state variable for the crtc, if all pending commit
  * requests are done, meaning no more bandwidth is needed, release
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
