Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE8D7217E4
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 16:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751E310E147;
	Sun,  4 Jun 2023 14:45:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E0710E141
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 14:45:17 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f3b9755961so4837298e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jun 2023 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685889915; x=1688481915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oxZWGXFLzU5SjPv5ySU8WvbrkPwdtjbQ7fatHEgs/dk=;
 b=miw8oSyMD6hAqoknkccaxzELs8RXrO+IjJlpakE8SFO/lGd1TlTqBMTdOuC4kOuMfa
 CVMKCRZGtEjOC+BFuoc+cGBpIYmtLmOeIxOZ3df2MOv743FPnoXmos8mBG0z1rM80P8R
 vV5Y60uwGfwaTyheP6hK5yMwRxy63PllqJ967lvL3GtN4aODqJMgGoUTxGooZgocrTTy
 tKgJ1kJ0h2yReGPwBUCMOOGNwDG8LXKdBp0Ek7AE8UxwzKE0LuUvaWMm8xn1GAiy6HYk
 UqQzH1delj3v+3DsVs765Cg4+h5MUwJEyInFYIBFvkDmdD37rveYJABwbmsf913t+1CV
 hryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685889915; x=1688481915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oxZWGXFLzU5SjPv5ySU8WvbrkPwdtjbQ7fatHEgs/dk=;
 b=BoAebhxaLBWp34T+wUCAOl759qI6BKnedLFTivjCs6DLVpZr24XWCS/0lCtwjYSLNv
 rWoK5ljEZ6Agldttmj6zOp458U5DzDkaoQGhwFr7IAVqW9hXw5BI+TAVA/CqV6uIn19B
 EpzwbF3hkD/1qIeKu/n9K2Sd9cKEaWP5ThUmuxrJc0WI4BWVwGWSqnwIigbKJFA3XXgH
 4T/Sv7relnuWgXjwmoZx/zpyxHBCPYmxPCXmAhnuaV3wwHRbUKJD4u+/2ICODa2r7lq8
 0H45571Dk39qo2RYBc4BeBUKH/VnSNjwmHNukIyKlfL4lAAnfrHL9UsP6Kkvm/mnJ26A
 DgLg==
X-Gm-Message-State: AC+VfDwOsXw6qBNQZCwg9gu9ysKy+dgIFqqpDDkiQAigbVQaCAbdT3q+
 KV4v5wu1GQv3ZGKVV3CPWwb74g==
X-Google-Smtp-Source: ACHHUZ7yILlKBacoYg0phC6bYxRhDyQn5tt//vNZh6TPswnOOCFQJt647INfiAG+7lN5v/5QT5N85A==
X-Received: by 2002:ac2:46e7:0:b0:4f1:3d7d:409e with SMTP id
 q7-20020ac246e7000000b004f13d7d409emr4493775lfo.0.1685889915437; 
 Sun, 04 Jun 2023 07:45:15 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020ac25216000000b004f42718cbb1sm788912lfl.292.2023.06.04.07.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 07:45:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  4 Jun 2023 17:45:11 +0300
Message-Id: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm/dpu: remove
 dpu_encoder_phys_ops::atomic_mode_set callback
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

The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
redundant. Implementations only set the IRQ indices there. Move
statically allocated IRQs to dpu_encoder_phys_*_init() and set
dynamically allocated IRQs in the irq_enable() callback.

Dmitry Baryshkov (3):
  drm/msm/dpu: split irq_control into irq_enable and _disable
  drm/msm/dpu: split _dpu_encoder_resource_control_helper()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 79 +++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 11 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 93 ++++++++++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 61 ++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 34 +++----
 5 files changed, 152 insertions(+), 126 deletions(-)

-- 
2.39.2

