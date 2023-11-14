Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0007EB9FF
	for <lists+freedreno@lfdr.de>; Wed, 15 Nov 2023 00:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C87710E404;
	Tue, 14 Nov 2023 23:00:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6040D10E405
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 23:00:18 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7788db95652so402492985a.2
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 15:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1700002817; x=1700607617; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0WgbXh9MgeOn39Qx8ZOYsj5qd/Y25XhdC9fJIxz5E4s=;
 b=XHiDN41Qv1XB8A/je7I3HoqAAn6J4erbjXylxaDRsHrNYdL+NPN9W8KJXB732tybaX
 yYcLVx1OfxLX6WPq8VWOvWXT+ojEoOKY+PCbQ+E2h8L2k+zNajKLOHkYwao5NDCMc/UL
 a2Q21HFR4tOI8j1rTG7AeE/cF6an6m+Fu8QgdcMPXESw+aFtWlWftMbYmjuoI+DMLja3
 ycBB2jHlGoIZUEy0LtSuFFk+BOiAcGVxDrtbBdP2e4UarfZXlZ5JdPFPKJqSH+bfUnJq
 8+1Sw6ZN0W6B4Kqav4sMOslRpaJC/ywdZfCz9Vegrm1axaEnEDEpydfmcQi3A5EpOIaI
 s9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700002817; x=1700607617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WgbXh9MgeOn39Qx8ZOYsj5qd/Y25XhdC9fJIxz5E4s=;
 b=d9RUHPwWjaCf14uMgHxS3X4E4OqbvA7EkP7lNTslZwp0u5FQT5MNN+IEC0OTuswtnX
 II07xtOlxh2TruCLMxKcaNUPyJez4DDFsEcFYcoXQisgqubcj54/OICmBYFRf+44XRb3
 l3L0Ucq9juDevHln5i3U1+Q31Vq4KWe0eq5zpzl0VXwMCKf+arTNrvMBHlNbTAApgch4
 jiR4Q7EHje4EWfL7Jn8UORYIQQ4oXwPttacIsjFQvFMQd7AuJhalj2e4IrotAw5KT/yX
 m+iVyseNaILLt9vqGzvl37+EwWV0kVN3U0FqEbWDaUNf4K+7iZRgdjjWx9HOYFKtMPSM
 Q3oA==
X-Gm-Message-State: AOJu0Yw4oZB9zN1LviT5CJ6WEuuAP3+pVkJbTmob+qVxTAcSGBnCfQbM
 +5Zae8U4Dso5RGaISBSLPKAMUfSAHgDPKunyYfru/w==
X-Google-Smtp-Source: AGHT+IFnjqTgSRAEEv9oTG0p8gs1SiKRgR8rwDL76VdXJfcgXZJsNySy8WBq1Lpu5ZkIr/aU+PwDZA==
X-Received: by 2002:a0c:fd81:0:b0:670:710f:203a with SMTP id
 p1-20020a0cfd81000000b00670710f203amr3645510qvr.59.1700002817358; 
 Tue, 14 Nov 2023 15:00:17 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 15:00:17 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue, 14 Nov 2023 17:58:28 -0500
Message-Id: <20231114225857.19702-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/6] drm/msm: DSI DSC video mode fixes
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Doug Anderson <dianders@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, David Airlie <airlied@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>, Kalyan Thota <quic_kalyant@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnaud Vrac <rawoul@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

v2: added new patches (first two patches) to get DSC video mode running with
the upstream DPU driver (tested with the vtdr6130 panel)

Jonathan Marek (6):
  drm/msm/dpu: fix video mode DSC for DSI
  drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
  drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix video mode DSC)
  drm/msm/dsi: add a comment to explain pkt_per_line encoding
  drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
  drm/msm/dsi: fix DSC for the bonded DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 11 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 13 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h                 |  3 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 50 ++++++++++---------
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |  2 +-
 include/drm/drm_mipi_dsi.h                    |  1 +
 10 files changed, 58 insertions(+), 28 deletions(-)

-- 
2.26.1

