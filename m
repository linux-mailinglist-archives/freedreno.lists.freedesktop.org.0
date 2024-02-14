Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F8C85441F
	for <lists+freedreno@lfdr.de>; Wed, 14 Feb 2024 09:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E543610E469;
	Wed, 14 Feb 2024 08:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ayz4q27C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534AF10E2F2
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 08:37:11 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so20647771fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 00:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707899829; x=1708504629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fNyVYl5PFuqcAOEEMT/+9lJuDqPpS3TsSRcu66K/yHg=;
 b=ayz4q27COHV4yWCtnJqUJ4S5HDmSEIp8sc3WHBnxkogu+O+QyMgFQZzj7sU8H3BsEt
 P/WpkcBxdco/x9z26S0SvDoTmdZEZYSWeH0aDKaSp44dpe+xyLxjeyI+oh3q10fPUP7h
 dRsrJcjwepkSRh35vPp892m35aJKGMMUIilFJwTcKqtOByRzA6piePvZRN0GsX1seh4k
 /+UO+wc13FuOLRt8L7Bp3BkafhXV/BgxuDl9niGkvK2UCdHroxPJ8MCPGwSRzM5P9N11
 n3y4tlwCzXi4c2aVyJmbRFG9+W61apX0j2ZsSSiCWJWvYlWQsxdIvswkHHeMT6OdZAeJ
 zQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707899829; x=1708504629;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fNyVYl5PFuqcAOEEMT/+9lJuDqPpS3TsSRcu66K/yHg=;
 b=L+1f9rRqQFhYb3MxPt3Bog0ml98tEZyZBfiiUOC+KWujx8S4wJcv9LYGM05475Qy3h
 rUFUpjZ3btvIaCxCFx9w7rea1V7pv2FQ2O4ES5i/6AAPSpb8Ndr9ql43YFlEvR1G0y5L
 Z0yGGo6cUgo4Um2kM24loqLB0azFw9KCRW84NyN8w2Cxc0bFOtYBlnAdIwcGofFR5xqL
 VAV3j21ME0dj4k009r3joruTu5jPYkLbQsTXrODpU6FUyPO6XSf8s7KAMczpdLGWHACh
 smdTNubFk4huG0DrfOQpXzMs9sAaMgEyyEc1rSeH54Bdvw7RTHAcMrykou132XqFexkT
 N/7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuJ5FSBaGEMh0yq8PHnKR+mbnxkdPuS8Al+X/2yBgZNz2EG75CTDrvNCEL381RHnH0nIwtlO/PEBRCc5o4gRnFvbf6ZXV2Qe6lbpQADXtz
X-Gm-Message-State: AOJu0Yxlx0ThKOQZn+cIVXxROwjhkpbxUCoxvOtIeDMST5uNYhI45kyF
 ZBzMxFMuqTnGQA8IECBxGWm23O6Z8oqLFNLohWUVWBHdt7injF9dMBOaGU7XGmI=
X-Google-Smtp-Source: AGHT+IESjS4v4O4IHu7zLNFREuyQ+kQhHPlDn4XXTnrj7CrGdmKCVUDHMgznemDujddsMvwh+7i69Q==
X-Received: by 2002:a2e:9dd3:0:b0:2d0:cd24:24c3 with SMTP id
 x19-20020a2e9dd3000000b002d0cd2424c3mr1418345ljj.53.1707899829397; 
 Wed, 14 Feb 2024 00:37:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXg78QslHrsDT2+naoGhAfKLkRKLC8r6TiToOHCSZbeIj3fyJZGhzBaUo2CP8B3/PXwrBX65FVyCY2US5pEt6U8YBE+H+YR1bTIoixxD7yAtkFC1WuSfTIYXLDRrfL0+mJBkhGApnL4xMRhiWZEcTGCU4vrNTfZyEyhdFiwdq4CF0FVTQRddcemlmCOUnSeGKEeDr1yP2uoQvxKNP9O0LbNHHCgo74wZ3WS2Bw2mvRgJe7A90+LcYvbVxIswlP6jXR9rLTsJLmeNsdCWGGatlS73uNaTBBtyuNT+Nk1Egzf4M1/hTrR4IMEAEd0u0q4uYmRuJlAYPt7iutspQ4cje82GwRaYWrH1VQ2osqrs9FQ8u2351oj8zpqKmJDC9mLtPZiSL8yRa8=
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z28-20020a05651c023c00b002d0c14e4f94sm793294ljn.74.2024.02.14.00.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 00:37:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2] drm: ci: use clk_ignore_unused for apq8016
Date: Wed, 14 Feb 2024 10:37:08 +0200
Message-Id: <20240214083708.2323967-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes in v2:
- Added a comment, describing the issue and a way to reproduce it
  (Javier)

---
 drivers/gpu/drm/ci/test.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 7ffb620d7398..e64205286a27 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -119,7 +119,10 @@ msm:apq8016:
     DRIVER_NAME: msm
     BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
     GPU_VERSION: apq8016
-    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
+    # disabling unused clocks congests with the MDSS runtime PM trying to
+    # disable those clocks and causes boot to fail.
+    # Reproducer: DRM_MSM=y, DRM_I2C_ADV7511=m
+    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
     RUNNER_TAG: google-freedreno-db410c
   script:
     - ./install/bare-metal/fastboot.sh
-- 
2.39.2

