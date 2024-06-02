Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC6C8D784C
	for <lists+freedreno@lfdr.de>; Sun,  2 Jun 2024 23:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D2310E093;
	Sun,  2 Jun 2024 21:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z4DmAFmn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9610E093
 for <freedreno@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:53 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52b8d483a08so2307139e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364391; x=1717969191; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h+CSTFeFF/RYWmPtLQtrltO96VyPF0tQ5leDleoWaL8=;
 b=z4DmAFmnt2qyYBsmWHcCH+YHEz7kdGMOh1uryqrgb4XatfO5VN/mRsy1qQdWMKq9hr
 Vu5bRBATKWei1lOt22Vx6Wxgj95hfgaJYqdksugcsk2Us9YsvW0BRzZqb9NhWXSxedud
 EksQ0Sw783JIn+XSl6/xPObyhhYtLWRjuoBaUXPaFNNktGJt1HzGSxx+KyJMjXmMprTm
 ZstNCURnz5f2ZdV6LPIUlw9Vzc5XaynJc0NfbopkG57RXqBUFiOGLEkUJEsALWCLT0TK
 US64iuJmquzoLuBNJIG9shexYn48fzCPE+fXpHaCi7+pRYlJ+Zzb7LSZNikaxXsQoRlQ
 Qm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364391; x=1717969191;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h+CSTFeFF/RYWmPtLQtrltO96VyPF0tQ5leDleoWaL8=;
 b=icLTMD43xL5UfYCyfmHhiU4ZhUe1pM6jYW6ZYLAfGXJC27EzrhP4E072li4LxffBPf
 KgZVQbPC6wnXXqsM81+pHA004KH+NZHCwDUAzfL8olKZZ9+pnmbPIFjEC7SHP+HkFVbc
 wM5I6602cESMIXq8tphxIs6cnTgH8SmoR9uGIrRf31RLwFNgnVKjwKnCNn+/UgaOjhC0
 25St4S7hm+ieSVGtCVBk7i97Y+4+X7ggt8YuE/M/pzjThAOxvAZtbSE7NCV2q9UKWtNE
 vmCywCeRYemGqu1Flaoi6yinYXauB3Geyl/vn0CO+cjx0nOl9Zsxb9FoHoZO5K4X0sVz
 wVyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU8jAUUeQvNzYjPO5cgXLfZnMba9ojwC6CA4msQUv+JgzdlMYVszoIJvGSuDnY49u18Pb2s9SR36zU0ANTHh7vEXMYq671+4j3QvBkjlzs
X-Gm-Message-State: AOJu0Yx3AZk6vs/Gh/UJTLbc8NjU2NO8vgHY9DSEsM7gLj0FlDN4XZdc
 47FXW/TykrC0ISFvVUqavGKN/lqTsDseDhkphLttAZfBGg930olQb8k+H3uOK/8=
X-Google-Smtp-Source: AGHT+IEIf1Gyh7kZtA0eFs/RqWCpH7rFfKeyYj6pdc8wjwMA7tsgiZAtWlBpM2/xtamBSNHgxtEI0A==
X-Received: by 2002:a05:6512:3599:b0:521:b2b5:60ea with SMTP id
 2adb3069b0e04-52b895712e7mr4357562e87.23.1717364391170; 
 Sun, 02 Jun 2024 14:39:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/9] drm/msm/dpu: be more friendly to X.org
Date: Mon, 03 Jun 2024 00:39:46 +0300
Message-Id: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLmXGYC/3WNQQ6CMBBFr2Jm7Zi2KKIr72FYFGYKk2hLWkQN4
 e5WEpcu30v++zMkjsIJzpsZIk+SJPgMZruBtre+YxTKDEaZvSp0hTQ88B6IsQ3eSYdPobHH0pR
 UtEdLB2Mhb4fITl5r91pn7iWNIb7Xm0l/7a94+lOcNCok5bhsXKUbpy838TaGXYgd1MuyfAC8e
 qLbuwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2108;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WEVChdsx0M8x1VVrf3QhTk25LV/lyu70yiuZR8IbK/c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOakedc1HivhrHyR0T0lkDlID8aNU11qnsuAR
 TeAg9oyuLeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpAAKCRCLPIo+Aiko
 1XQ6B/93sWx/NvOkP8tOlfD1+1vvos3MwSQEc7r4+++zOnXhaM2B4ZL+zK5F5GfKL475LvZb2wc
 vJ/9pPFK83Oxw5xQ1lUfvPKJLqM2WlhAahew5O9Y1LsqlSnpj48TJzIk3WqtgNYImy1nNYhdyCh
 TjjnaGIco4s7gL+NNqYny9N3PviHNGXUpfuuLiDxdrEbtYMoFfQSi78/4tfeTk2xp4iEBf7/XGs
 BInUBqo1dHe2dx4c/5OCTlqptI4ofaJZ1QzuFGdHpdbGZUvTX85SyKya2+wEofoNDiCIRnQuwgd
 9Oip6edVYOvDnBGzGSeT30/PpfPHv7s9kmmb1eE94atPiLFH
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

Unlike other compositors X.org allocates a single framebuffer covering
the whole screen space. This is not an issue with the single screens,
but with the multi-monitor setup 5120x4096 becomes a limiting factor.
Check the hardware-bound limitations and lift the FB max size to
16383x16383.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added dpu_crtc_valid() to verify that 2*lm_width limit is enforced
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org

---
Dmitry Baryshkov (9):
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: move dpu_format_populate_plane_sizes to atomic_check
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: drop call to _dpu_crtc_setup_lm_bounds from atomic_begin
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 32 ++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 91 ++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 24 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 10 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 37 +++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  3 +
 drivers/gpu/drm/msm/msm_kms.h                      |  6 --
 10 files changed, 91 insertions(+), 126 deletions(-)
---
base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

