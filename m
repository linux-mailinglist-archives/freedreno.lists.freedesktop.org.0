Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D21858781
	for <lists+freedreno@lfdr.de>; Fri, 16 Feb 2024 21:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C57C10E10E;
	Fri, 16 Feb 2024 20:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t39jwBu8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D984D10E2AF
 for <freedreno@lists.freedesktop.org>; Fri, 16 Feb 2024 20:56:54 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d180d6bd32so15985361fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 16 Feb 2024 12:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708117012; x=1708721812; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7xYbkxmMMrwdBVoQTAnpcbDCTQJDagUmUMz2Jfts6Ho=;
 b=t39jwBu8TCODTGFRreIlHyEnZI51NhVQuMrU7BFMbt9VpvsBBFCvTTm+FJhmMfLYyA
 Ee4KtwobxYB4qJhcXVUI8YYLTjKujCZInD7b3KAV3r7uJ7Po1eVGP6I6KBrK3bKwEn6N
 04ABscrBrpPf7pAzcOxUvf6i8Pt/MF4f18AlbMxWt2bq93KcW3QqeaOghv8fpL1XkNRg
 npKskg6f6i2D2inaNzFiSBa+r8QUIvSNw87jIcEHLZjSYWYH2r+7EE9KJ15i+yZ/Tlmz
 j/s9RzUG3cJxA8vYi3AvmcAhSE9T3HCXGDZ8vqUiDVkddNh7CH9ISNeO1qtICky6GcaT
 tPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708117012; x=1708721812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7xYbkxmMMrwdBVoQTAnpcbDCTQJDagUmUMz2Jfts6Ho=;
 b=d77f7Nc0T8m882MMJNYFuje6zoW9tJTd56BBHMlLS7cWSkyGtDE5se6vkmgw5r56fw
 xp58kkuiWIhc7I1QwDrUDcRcCmnr8vQH9cl3JTt/cT202xCP4QkigbQx3Mfoeked85CZ
 oyiXOKwNd1uatzt/q+14SLsTrjgUVCqoMfQSJT5URvT3Zfd1r32oGFdMmI8mJqMoPW4b
 2mrRd9Prh/WGGghQ9C2Gg15MAiOv8uCiOwEAdmrxl2q7e1JwlZYEP6Prqaommt8PEHo+
 7IllxbgNGrYtgGcg6BKBrq87niUUf5AuXfcD88y/hynZ5wHRoUogbIHPT9+AcDmbhp7L
 9N3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbyrraAf5Z9gi0RUUz1AEA0gW0pXc5ofNTrH5ihtm+GZSyFI00R3ef/8iUlzBNcpE/5SJP9+9G0kepaoDZdtWx5Lmjgyt44IuHId0LTL0n
X-Gm-Message-State: AOJu0YydXZaaMCkUzov3uISOZm/l1KxU7EBcLj6JmMB5iFdwle4Ic/XE
 viHk7CH04sEUo2vI1//YKw8eaMK5x8fzYMQI7Yn2ASfDUEsBRBYw7DYhh6AUBMY=
X-Google-Smtp-Source: AGHT+IGrTctNJyjUXCP1oMJ5jDQJgWyno/PfTuIM6XxobEQJpt0zug9PyFFoIx4M7PGCeGN1zI14Kw==
X-Received: by 2002:a05:651c:11c7:b0:2d2:1bf2:ec5a with SMTP id
 z7-20020a05651c11c700b002d21bf2ec5amr1563846ljo.35.1708117011926; 
 Fri, 16 Feb 2024 12:56:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a2e99cd000000b002d2236952b1sm73758ljj.121.2024.02.16.12.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 12:56:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/ci: skip suspend tests for both msm-sc7180 machines
Date: Fri, 16 Feb 2024 22:56:50 +0200
Message-Id: <20240216205650.2446153-1-dmitry.baryshkov@linaro.org>
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

The commit ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
dropped the msm-sc7180-skips.txt file, which disabled suspend-to-RAM
tests. However testing shows that STR tests still can fail. Restore the
skiplist, applying it to both limozeen and kingoftown machines.

Fixes: ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt   | 2 ++
 .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt   | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
new file mode 100644
index 000000000000..327039f70252
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -0,0 +1,2 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
new file mode 100644
index 000000000000..327039f70252
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -0,0 +1,2 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
-- 
2.39.2

