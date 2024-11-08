Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C29C12F2
	for <lists+freedreno@lfdr.de>; Fri,  8 Nov 2024 01:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5387F10E327;
	Fri,  8 Nov 2024 00:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SiQ1Ljdx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E6710E321
 for <freedreno@lists.freedesktop.org>; Fri,  8 Nov 2024 00:21:41 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb470a8b27so25268401fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Nov 2024 16:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731025300; x=1731630100; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XkmztPsPBVyoZtfInzYanDDrqrjRXuvhvkAniG80EPw=;
 b=SiQ1Ljdx6XwBQ7FhascwDUf6x9KflhOQ0yZNPeuZm1p+KTS6HZjDCDPlSoeeQ+JZT2
 DfjDXayMhABt4zN9VtW3wlF8hQZB5zdomQSo9D8uqPm6RYHLAIS2VfadM/n1Jw3CtDhw
 Eljqt46XGDa4pe+Ob769zlY8SN7odWxk1ygmQtGvH/DK8z4GP/oqmjuviP0IZZXcSyim
 lU/qvXjQcEqxaKVvdepdugXsmH7WLUvATRivwz1jbL8ZQITg/RLR4prdX5khe94i4jmm
 AB7QlpabcnCn5rE2MCNt72pv1WHr1S3JgzOvlM2T+ryZtHyk1Q53BnJhyRLMANXPgEyE
 iSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731025300; x=1731630100;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XkmztPsPBVyoZtfInzYanDDrqrjRXuvhvkAniG80EPw=;
 b=wEG8N57zj2lZAIesTM6IAp8i2dGieVuWWztFy5tynsRhEi64GlOyS6XxqFT/Wd4dmy
 JLjSPP4BcI9HS+wqvWkU38RyRt4jB9cHIafSABmHGeKqxujROtdA8U0XVDHPGn3ilWsa
 buz2i+XE7lG8RCojC4pYp/BidkKGG+9PSSQHhWql1NnQIwGeJZ7moBlspEQejoZVUHLz
 cvGBykdSS0RO5IOAzhLFnibkbYM15nkvXoM4TECy6NnwZmEmx53PLcbdMb/rDX1VVqGF
 /c0R0SCDQH3/FeNnBQJbEeUQKcupSKOgVlKbjReQ2Y+jbdPVWA4jFJsbg3WJN5CTnlbB
 Vi4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJm+KHq4ZKtNgABg8hHYorNTJb7Zal/UxUkyCYwPjeJmx1lIHgl5XFhGvxiHdP3GymHIwOdJgbUhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTG9GhybflLBEdeKiUWDSicTJhO6UomfAUU+fA+h9XujDJrliw
 OTdL3ZctRNS5YyD9MoLXO0fp8Nl2L1IgTh6ITEA3GeMlsUBM0ZcyR5F2cS0SD2A=
X-Google-Smtp-Source: AGHT+IFbNMtUPns1qTynN8HZcSiuZu16DPiMYzRyHXArsYkIgDJIRH1ePYCu1PPeNPpy2EObDqkAyw==
X-Received: by 2002:a2e:a995:0:b0:2fb:5be4:3645 with SMTP id
 38308e7fff4ca-2ff2072d207mr1892951fa.0.1731025299517; 
 Thu, 07 Nov 2024 16:21:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 16:21:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 00/14] drm/msm/dp: perform misc cleanups
Date: Fri, 08 Nov 2024 02:21:31 +0200
Message-Id: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAItZLWcC/x2MywqAIBBFf0Vm3YDaA+1XooXkVLOxUIwg+veGd
 udwuPeBQpmpwKgeyHRx4SOJmEbBsoe0EXIUB6ttpwfT4xoxnhhq5ANXvquwt861FDx1GmR3ZpL
 wf07z+35uosEiYwAAAA==
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=r9WESZjKdOkeXGTwKva4YI7nk9aqwglx/YUyTfzdpvw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmOZd/6kdB/fROCTsWps6ilXvB+F0J8Juy0+
 dJdNf38eK+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZjgAKCRCLPIo+Aiko
 1S+lB/90k8vJL9oASKM6AlkVuibdH1L8eVx6hkMy9KAPhsWwxPe6eKiMs09KHBR1oJhRWZKaqHz
 zNBc7Lc+2AV9+7GPFheJcQgb6PGwLkOoin9i90T4GVxvsu/Js1JNqNxM2dll1ZD9clbWqG2ukt5
 7b+2T5enDV/767x2uQuISdNUUB1egRIXudLvmtpYTPNI7qoIHZwu9h2fXV6Z3y/IlG9nRevba+5
 Wy1OjYPDwXkfwmGSWv6q2NYPqwcAawqsV6SxNFEszxvMfJQNqnAbzihfDDFGbRFPe33kdKUAuo4
 d2doKZ9KBdHY5Tb6AdwXvvPtRhJjotzBai1ptLLtMIw63u8A
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

- Fix register programming in the dp_audio module
- Rework most of the register programming functions to be local to the
  calling module rather than accessing everything through huge
  dp_catalog monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (14):
      drm/msm/dp: fix msm_dp_utils_pack_sdp_header interface
      drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
      drm/msm/dp: drop msm_dp_panel_tpg_config()
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
      drm/msm/dp: drop obsolete audio headers access through catalog
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: drop struct msm_dp_panel_in
      drm/msm/dp: move interrupt handling to dp_ctrl

 drivers/gpu/drm/msm/dp/dp_audio.c   |  360 ++++------
 drivers/gpu/drm/msm/dp/dp_aux.c     |  195 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |    9 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1267 +----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  177 +++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  575 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |    5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   36 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  150 +++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |   15 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   17 +
 drivers/gpu/drm/msm/dp/dp_utils.c   |   10 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |    2 +-
 13 files changed, 1078 insertions(+), 1740 deletions(-)
---
base-commit: 74741a050b79d31d8d2eeee12c77736596d0a6b2
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

