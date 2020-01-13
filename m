Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60502139C22
	for <lists+freedreno@lfdr.de>; Mon, 13 Jan 2020 23:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1555989B57;
	Mon, 13 Jan 2020 22:05:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BD989B57
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2020 22:05:08 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c23so4366141plz.4
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2020 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zd/53b/YzvxFSSJluHpg2s36yjG1ma0E/zaQrjFe9bI=;
 b=COPCLdzLquZ+pTd+qUGkNUztKc9ghw2B0XavyRbkLgcM3Elx5pxsZzkioDeo5ITOFL
 VGVFmmv/j0NnW8j/7RWd/2S05ILFq+ZdcFS5DzhnkEwCUtnEGMTWz6KQB0UkJDZB3DgO
 nUcESk3UDAcutgobfQAP0KuOYM3n+b0NpLSNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zd/53b/YzvxFSSJluHpg2s36yjG1ma0E/zaQrjFe9bI=;
 b=HBD2Hv2k6KQKkJbfJ+fHKSlFoxnvLaI9MpqAIJA7tPuFwtxgJdbY1xgIf+y+7Dul6Q
 qyKbUDJqHttLl0MomjxgPUan1sDYvroFY2oKJ1DPUc3btXrNhs41ZZ0fvWooZ/SNGsBV
 aepnacVpJi0OuTzBEXHfqKEFLHl3ltpVe3kcD8KBrwOPACTnJD5OShiTEoYBTCO+PUZD
 m4hcsKUkh10AJAlpz/7sLimQJTSIjDv+dj630oeU42p3Fiy1T+MPyFmqyfkPounViJq2
 NOTHIrcZqUrWJb3yhjbWujUEMPpIA/WZcHzyC3bvBvehuvbR5vgcpY5HSEpd0PhxARQr
 qysw==
X-Gm-Message-State: APjAAAWvm7xC9dMLq337otr4XlC7/p+cqEQIa5nAxOW7JUfIqLSAnBmc
 TrVyFWca1825CYsGoZnofCvY0A==
X-Google-Smtp-Source: APXvYqwSgta6aJy/jOmbS+805x0Xsc71s56AGXM8UF7sEDgc66R/QG09EQD8z34BuJIgVvxxx8lXQw==
X-Received: by 2002:a17:90a:2351:: with SMTP id
 f75mr24735687pje.133.1578953107752; 
 Mon, 13 Jan 2020 14:05:07 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v9sm14682621pja.26.2020.01.13.14.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 14:05:07 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@chromium.org>
Date: Mon, 13 Jan 2020 14:04:46 -0800
Message-Id: <20200113140427.1.I5e35e29bebe575e091177c4f82606c15370b71d7@changeid>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: Fix error about comments within a
 comment block
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
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

My compiler yells:
  .../drivers/gpu/drm/msm/adreno/adreno_gpu.c:69:27:
  error: '/*' within block comment [-Werror,-Wcomment]

Let's fix.

Fixes: 6a0dea02c2c4 ("drm/msm: support firmware-name for zap fw (v2)")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c146c3b8f52b..7fd29829b2fa 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -67,7 +67,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	 *
 	 * If the firmware-name property is found, we bypass the
 	 * adreno_request_fw() mechanism, because we don't need to handle
-	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
+	 * the /lib/firmware/qcom/... vs /lib/firmware/... case.
 	 *
 	 * If the firmware-name property is not found, for backwards
 	 * compatibility we fall back to the fwname from the gpulist
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
