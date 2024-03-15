Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6787C726
	for <lists+freedreno@lfdr.de>; Fri, 15 Mar 2024 02:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6FB10FF1C;
	Fri, 15 Mar 2024 01:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oamZJ7/R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B058A10FD3F
 for <freedreno@lists.freedesktop.org>; Fri, 15 Mar 2024 01:22:41 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513a08f2263so1961636e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 14 Mar 2024 18:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710465760; x=1711070560; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NdVM3GQ8r/bjmXzNspVfVQhsO2vx8cZFTeqUfb4E9sU=;
 b=oamZJ7/RVkYwpQejz/2zbeWhQCEsWqp1/m+rHS4tt1Y+Mtu+cDI4R4rT5Kz985FLQ7
 Djf4Rxl5xIdOUBJjA4vUfrImhsK6/YPlaAMmHHEW521qeMaD9GWzVQL/7SNZAMAHl/te
 s01d+IVi4dwXrMcnlNThpZNqjgv6IakUGKpj+/MpQ5pm8q6gORwyI8FyJtbfFtQ+FXs+
 TPRkC48Pb/Iz35xNzuT/+4QvzhI7Ei4OsZM7l7G5pqQMhqF4wSkfrJvo3tCwnJsexMSp
 YFIXllbndhv+KeOOnss8r8cvtMElmC2jBq8tXGbVlAxYYIOoK1VK2UI6K7IlBrP7MYfT
 YXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710465760; x=1711070560;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NdVM3GQ8r/bjmXzNspVfVQhsO2vx8cZFTeqUfb4E9sU=;
 b=MI0kZMf0zvvxcr3FgLsPX8ArfVVzi1Q1FKaHkZABex0y20Qq3aenjSMYfH5+vY13pJ
 WWk/I/La6Czn6f2PTn1PopAGQVH9twcHwYCMg8dTXu8rqis1cGE9ycyIIjhgfVQdX6UN
 yuLDEcjy7sJPSoNr8AS2xJi3deyZ3Lq/3W4ml3k9vc6cL1vTDxPt8XIPD+8p6noaKWKN
 4MZhrp4mMMvl4gVRsnKMGK2SKjWWXgsGN7n5ws4ee1EONK2QSmAOI6msj63VpuSyL0QS
 J5OxGUYYUot6HkQ6fYpcbt9YL597gFoqvDjpz5LblTgCsLG3D9gEc0t7EOSbZw0L4jpf
 xBIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd0DExmR/BX3StVUBuo7PK7H6XLalDPrsQPzKE2wLCulzbko6xRdyqJPMZpJ+Aaxp8a4skx5c7lkNityOWVlpHNDOeq08D0OACA5TxPAbd
X-Gm-Message-State: AOJu0YwciwyXCvdki1X4IwD2YX0IiEkrNShqvkaEnKQprBHGQfQayLHV
 VLy+riEXusJ+uS/TTJmLzRbCAJM4VN9PaSRzsW8YsaJYyGB+GHpd0InfwQvnfNk=
X-Google-Smtp-Source: AGHT+IF0dsO66Iw8P6EvV0DaiEnmZjiOLNJKV3N/3EuAwEr2duR8dmvE9nffnIkcxlPGbzL4V+JqKQ==
X-Received: by 2002:a19:e006:0:b0:513:80cd:e807 with SMTP id
 x6-20020a19e006000000b0051380cde807mr2297793lfg.20.1710465759518; 
 Thu, 14 Mar 2024 18:22:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 m11-20020a19434b000000b00513d6089dc7sm190559lfj.131.2024.03.14.18.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 18:22:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/7] drm/msm: generate register header files
Date: Fri, 15 Mar 2024 03:22:33 +0200
Message-Id: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANmi82UC/12NwQqDMBBEf0X23C262tD2VCj0A3otHqJZdUGNJ
 CVYxH9vCD31+GaYNxt4dsIertkGjoN4sXMEOmTQDnruGcVEBsqpyolO2BlcpxH9IMvCBht90SU
 VrWHTQRwtjjtZk/AFz8cd6hgO4t/WfdJJKFL186l/Xygwx7NqGtWWZaUM3UaZtbNH63qo933/A
 vCZ7aOyAAAA
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5260;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=orfOOrLlJBY/jLoMz17BUThnyv4usAeOIS9glcqOsew=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl86Lb9oI7dNbOpNCigfkkP0uO+o/P/6QWwmWvB
 eq5ugiG/paJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfOi2wAKCRCLPIo+Aiko
 1R38CACNGSuMRz4IV2CvGYupPpUmfquv5RMS9bkjYckTBcu5HIISMmKGaUzZIN8ZjaibLKvoQnh
 U12s+1n3VntSUqiCklRi/YIidPFsMp9Jwpjd+Gd0q6rqFPJgshwD+oK9ACx44goDukM1i6aG9kP
 0avBKtGsKaLzmMhEevjhSB+hTbRoWllZ4J6AY1AVxLMXEsT2S7ECv0OOTf8V81mf8aj6121eM2L
 jLx/zjBg7SaLLhN5k+uHJH5o62cFQQ/7EWuby0T+aoVYyxEoY+irYB5VPgIqpOV+zPxvTRO5k7r
 n9YVaXrBS73wHTSdfvc59ZZGIUD4UHmIqc5rAGReeFlJIheD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Currently display-related register headers are generated from XML files
shipped withing Mesa source tree. This is not fully optimal: it requires
multi-stage process of the changes first being landed to Mesa and only
then synced to the kernel tree.

Move original XML files to the kernel tree and generate header files
when required.

NOTE: the gen_header.py script is based on the non-merged Mesa MR [1].
Once that MR lands, I will update the script and commit messages and
send the next iteration.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28193

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Removed the _shipped files, always generating the headers (Masahiro
  Yamada)
- Replaced headergen2 with gen_headers.py
- Simplify Makefile rules, making all Adreno objects depend on Adreno
  headers and all displau objects depend on all display headers
- Also handle Adreno registers
- Link to v1: https://lore.kernel.org/r/20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org

---
Dmitry Baryshkov (7):
      drm/msm/mdp5: add writeback block bases
      drm/msm/hdmi: drop qfprom.xml.h
      drm/msm/dsi: drop mmss_cc.xml.h
      drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
      drm/msm: import XML registers database
      drm/msm: import gen_header.py script from Mesa
      drm/msm: generate headers on the fly

 drivers/gpu/drm/msm/.gitignore                     |     6 +
 drivers/gpu/drm/msm/Makefile                       |    97 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
 .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} |    45 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 -------------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
 drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
 drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
 drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
 drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  4969 ++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   399 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2267 ++++
 drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
 .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
 .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
 .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
 .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
 .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
 drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
 drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
 drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
 .../gpu/drm/msm/registers/display/mdp_common.xml   |    89 +
 drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
 drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
 .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
 drivers/gpu/drm/msm/registers/gen_header.py        |   958 ++
 drivers/gpu/drm/msm/registers/rules-ng.xsd         |   457 +
 56 files changed, 22480 insertions(+), 39792 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240225-fd-xml-shipped-ba9a321cdedf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

