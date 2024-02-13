Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E64853B4A
	for <lists+freedreno@lfdr.de>; Tue, 13 Feb 2024 20:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61C210E907;
	Tue, 13 Feb 2024 19:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TixsQV/Q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D8410E4D6
 for <freedreno@lists.freedesktop.org>; Tue, 13 Feb 2024 19:39:34 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5118d65cf9cso3157020e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Feb 2024 11:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707853172; x=1708457972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KS+nZriVXEOlOUhqDmz6bynpER81YQ2GlHfDyunox3A=;
 b=TixsQV/QKbxv2c+G1lUzRvVbzFYINNDmlr4wQycFDwtUTNAm1MrIQnxIhSoicHnBAW
 WZfWh2V6L1L2j0dHf79YLNpw9eYdecfoW+LmSFxMimrjxS0iluVoZNjX4jtJM/WajMCP
 8rKb8xYXR5PLGkAv52R3kz424w28U6D3B06e52rISJagedGJXlgcNLt90KVXS6DKNGVE
 /tdMJ0MGkiAFEUoxeBVE2huYsqSwqBKPDH3T9clUsiAOmouArXg1/udSG7GhZsGJWV+i
 CVO4k9lFZbkGQpECs3PdxtB1O/3pX46M5FEnG5+HG0U0HwSrQWf12IDVEt1dFQ4j3rmy
 Amew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707853172; x=1708457972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KS+nZriVXEOlOUhqDmz6bynpER81YQ2GlHfDyunox3A=;
 b=MsqlbOKAtaXdxcXJC0FhbEIgnKsKE1lRobpSCzxyjlJzBQD1nf75+eINp1sTE4iYuw
 EJD5dLtgWVHKvtBZ1la1Y23cv1ScBJDOcluqeDFTZ8/lf/f1XZERH88wShItw9kxxcPD
 HgP+LATRsF11bPAqXM0a1aqBwsOy/li+xMM0z2GRx8SaX6XvbZk/VBHg9VXSZ8/CH8lb
 ZhmVbdoEdA6rpZFxLMoQRdRPSdMsi3KJ9/r18I8dn1e1kB9LQj5knYnfTPlGUsQvWNmR
 uzxpCUmN9Y0/AGUGAqxO7W6uq9WZHbp8ZF2bOB3gAA0cFoGtDJTSVTgGtUBAyFnCu71A
 qtRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqbjlL6PXQ4NoGnp42IUURL6RNwu50SfmvYybKG87MswIVBkpDmiTGC76zgDfIlqrsgGxrslDy+WT+8NcWDHhbRhwB65O7QNY9sQaPYx+h
X-Gm-Message-State: AOJu0YzVLIs7AsnLcqW55a7brlBHkqdgL9fMLXgPaSOPg2rYwJayK8wX
 psgCVk17771N2zRu0HmtqnT/piYSPbv8TJnMPXfNZLmAvdjSdNpU05d4ieFGFKo=
X-Google-Smtp-Source: AGHT+IH7dW95cPuN7+RBRc/qxtYwNeyEb6fJNfD5rZ1ck+OTWOfqAtrkhCjcxiRkuJE0+EJZ76m0cw==
X-Received: by 2002:ac2:47fb:0:b0:511:4175:8d16 with SMTP id
 b27-20020ac247fb000000b0051141758d16mr311735lfp.55.1707853172142; 
 Tue, 13 Feb 2024 11:39:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX50LG5uJynhzj073kpTvcvBhBl0Nb3LkP4QB8K/+QvnZXWX71PydWeYYhwBRAFkXL9Ap5jxiWhTBRZfxVrOxlMsT2HzxBsikuJDvE14kgbHs3dce6qyBO/0SRnNgFDkb9k3vdJxhe5kyXbRNGrfawY/q/jWgvUo+jG7Y7w6NYnIoN00vwyciL3SLTNtZfvIyR40qkW7CuzOseovz46cMUeaFBQVKZTnOAJ76VGmwXXp1aWYfObc4g9ElX79hDMid/N7xIeAU27XmQb8KUtBkFxJavU7P7lg8uydCZBWqDf7QEv0hbmW/AEnJwylsH9+IKH2HES1tlQhnBhknwbWeohscii/xHxICUJoq3vxdZApsPu
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y5-20020ac255a5000000b0051186931619sm1181823lfg.146.2024.02.13.11.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 11:39:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm: ci: use clk_ignore_unused for apq8016
Date: Tue, 13 Feb 2024 21:39:31 +0200
Message-Id: <20240213193931.2300211-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If the ADV7511 bridge driver is compiled as a module, while DRM_MSM is
built-in, the clk_disable_unused congests with the runtime PM handling
of the DSI PHY for the clk_prepare_lock(). This causes apq8016 runner to
fail without completing any jobs ([1]). Drop the BM_CMDLINE which
duplicate the command line from the .baremetal-igt-arm64 clause and
enforce the clk_ignore_unused kernelarg instead to make apq8016 runner
work.

[1] https://gitlab.freedesktop.org/drm/msm/-/jobs/54990475

Fixes: 0119c894ab0d ("drm: Add initial ci/ subdirectory")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/test.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 355b794ef2b1..b9f864e062df 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -119,7 +119,7 @@ msm:apq8016:
     DRIVER_NAME: msm
     BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
     GPU_VERSION: apq8016
-    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
+    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
     RUNNER_TAG: google-freedreno-db410c
   script:
     - ./install/bare-metal/fastboot.sh
-- 
2.39.2

