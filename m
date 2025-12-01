Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C24C95791
	for <lists+freedreno@lfdr.de>; Mon, 01 Dec 2025 02:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2AD10E062;
	Mon,  1 Dec 2025 01:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nQSyMnmq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8712210E0F5
 for <freedreno@lists.freedesktop.org>; Mon,  1 Dec 2025 01:15:51 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso24434755e9.3
 for <freedreno@lists.freedesktop.org>; Sun, 30 Nov 2025 17:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764551750; x=1765156550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tx/uBhoEOHIhsehasECkzayBzot/ALhISZ90zdBh0Qs=;
 b=nQSyMnmquIKl+zIAn5kcWiqkTD1Ug7BWrdlHeesmkcyafkof8+QIWIL8SWuijpbAoV
 z3Tr16+cYwBDZM3V5qscPlSxEpbBWM6W2Wf/iFpWfArCW1BuZVpeADS4qCg4WWYeJCvP
 AQCE9qwbaEFtAFnTDar43ocU8juUxWDJtr8q+/qgQJ2w7wB4Jh7Ki6IGXIoro/ICs7XY
 AcQS5kB2OfZL64P5DbJuU5YmitptmNKy1OL2GzaQ0Rgebk0ZAtoWzmgEqEPKJupFj/NX
 xvPjrPduO8FemYAKEdDik0GTrXsH6b8mnZiEAsom2FLLxOTA87XHSKzCl/sMGzYA5J8Z
 ctlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764551750; x=1765156550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tx/uBhoEOHIhsehasECkzayBzot/ALhISZ90zdBh0Qs=;
 b=LXtW8pw8NCqKEzihkLBm+FlEpXPwPMnPBsiMs/p9M4/4iXri55H/VSVPPikhez0N+u
 HIiko+zCkiaERKqLSM02j50uX70bsE6RvJG6L/bAgpyjrnBDER4SfBqhy8xfe49KBQZY
 6ZvQEJlUvav0kXfuS6t+b26pP9jzJvYEaCeK5E1omcCv003grYyl5bjlQ8OOuL7GodZm
 I+vMrbiM4rJrY97eMGy9r3zpH844fb4pU3KvDFCFIa8YRXBIMV9jFjdHp18t1Zh82fua
 NgimNxinmL//xDmjfMf3x/xERfURhzGKX6kYQUHRP+Tk6iZcOCNsDvXSJiUj9p+UhYaO
 /WBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTRPsv/l01J2FiLMfHu9QPSvZONUk2wU4lbTB4856vnItKQJkSavrhFfmeCUf6HGC7fD4GLLYm8+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCxRVbQU4qCuxgAWUSZD/jxnhv4U2M16Br0WU6zDipXJj/S2B0
 gdP85avwr7IDsQJ6LFdD4zp3PZbv1s/UO26Gb9P7dhpNIKgsTchjqiK0
X-Gm-Gg: ASbGncuUT4McreZ/FBU6fICrwei2NdAqduMMkc9qD3M6/DGpy/QdgJN07d/Sx2+jeF7
 UV32ivgLasUWrApSzk3rfK4RffsMI2A57CXOLq623pImsgGfrObRL7qn6pl70sEgi5vuxRGYkrH
 2+g5ZzKDXSh4LhP9TxwkXYI6K4NnqMLAtAxuMMONyS7+ECQzF14pBA/a3uVvay7hzvGHpS/WhNI
 Jl6b/RVjQAyByd5HgG5UrXVOMfzB8igNsg59SHo7OSnoOd9QnzWu8b+aakNYYe1Yeg1qhf37ixu
 Bvl4UHxxeYy+sSz68BfTk9kwTIp9oYAz/9p2xdpTkQVHejke7yMKzatHi7b2fqwnA5yNBiGPfyl
 RwtVs6N99CzBKcWlZVWPQcnlirr/eNoJ/CmWjVwX5EwECwmxgLzMShDEjRO0lTi0p0q18UHzfuQ
 r5lvE7EWH+TV3utue3kJL+jGV/0wKHKMYh19nknIXjzmcEuJ/CxSi2Ww==
X-Google-Smtp-Source: AGHT+IGHjRl74icUPwWh1aQ2xdTwSRRUQMAjgiSVanlvJksDJ6M0AluYsyZQkKBUguFBzPL4kDKIoQ==
X-Received: by 2002:a05:600c:3110:b0:477:632c:5b91 with SMTP id
 5b1f17b1804b1-477c01b4b2amr432822595e9.16.1764551749507; 
 Sun, 30 Nov 2025 17:15:49 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 17:15:49 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jjohnson@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 0/8] Microsoft Surface Pro 11 support
Date: Mon,  1 Dec 2025 01:14:41 +0000
Message-ID: <20251201011457.17422-1-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series brings support for the X1E80100/X1P64100-based Microsoft
Surface Pro 11.

Patches 6 to 8 are included as RFC as we are unsure of how best to
achieve the required functionality, however the implementation is
functional.

v2:
  - Dropped ATNA30DW01 patch as it was merged.
  - Split device tree into x1e (OLED)/x1p (LCD) specific *.dts files and move common code into x1-microsoft-denali.dtsi (patch 4).
  - Device tree now enables higher external monitor refresh rates/resolutions (patch 4).
  - Device tree now enables partially working audio output; requires alsa-ucm-conf and audioreach-topology definitions in userspace (patch 4).
  - Replaced 'Work around bogus maximum link rate' with a quirk-based approach (patch 5).
  - Improve the commit message about the disable-rfkill property in response to feedback (patch 6).

Dale Whinham (5):
  firmware: qcom: scm: allow QSEECOM on Surface Pro 11
  platform/surface: aggregator_registry: Add Surface Pro 11
  arm64: dts: qcom: Add support for Surface Pro 11
  wifi: ath12k: Add support for disabling rfkill via devicetree
  arm64: dts: qcom: x1-microsoft-denali: Disable rfkill for wifi0

Jérôme de Bretagne (3):
  dt-bindings: arm: qcom: Document Microsoft Surface Pro 11
  drm/msm/dp: Add dpcd link_rate quirk for Surface Pro 11 OLED
  dt-bindings: wireless: ath12k: Add disable-rfkill property

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../bindings/net/wireless/qcom,ath12k.yaml    |    3 +
 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 .../boot/dts/qcom/x1-microsoft-denali.dtsi    | 1340 +++++++++++++++++
 .../qcom/x1e80100-microsoft-denali-oled.dts   |   20 +
 .../dts/qcom/x1p64100-microsoft-denali.dts    |   16 +
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/display/drm_dp_helper.c       |    2 +
 drivers/gpu/drm/msm/dp/dp_panel.c             |   14 +
 drivers/net/wireless/ath/ath12k/core.c        |    3 +
 .../surface/surface_aggregator_registry.c     |   18 +
 include/drm/display/drm_dp_helper.h           |    7 +
 12 files changed, 1429 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts

-- 
2.52.0

