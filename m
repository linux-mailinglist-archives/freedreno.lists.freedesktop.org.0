Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081A77C612E
	for <lists+freedreno@lfdr.de>; Thu, 12 Oct 2023 01:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A632D10E2DF;
	Wed, 11 Oct 2023 23:39:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986E110E2DF
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 23:39:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50573e85ee0so512942e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 16:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697067560; x=1697672360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k9ZbNL2ZO2xnYw+f/qXgIy6W1+ECSK31UMyr+/My700=;
 b=ochdiD2IgjA6NZQHgA9w5hZmS8U4kBjNfBj0xcxnpCLp+5dFWl8eoS1/mYeJYQ/g8V
 lW7wpKwKfWEC2iEX+F3tbL/ZH9POa1FYx/+DkBLr/w5TeS9bVTaigIfvxXrksNxGQIEL
 8p3QC7RV/ITjx9tmKZEBuUHGglO2a4THwN5Rc2/LAZxcerLGvnx8rYCPq1I/qB/PcRXb
 t629A7vpxE1EghoZOiZgZDZ5Dcq8jOYBt4kwyQjIIdqAqDYIW0kWAzqc23fOKc1Hk5Vz
 mBXvSxgqW48FI+a215NHAFh4tNoL4UDt/ecanmH0o4kdjnyN1myKt/1mPOoXVLDiDc3J
 yqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697067560; x=1697672360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k9ZbNL2ZO2xnYw+f/qXgIy6W1+ECSK31UMyr+/My700=;
 b=ZtVYmgjFyMU/XqJOXp9FGnYACaLNLvrAwx2TR4U8oAmZuKX/9O7e6by273fAbJaE8O
 syuTmvcBpXA3ewKH+iJK8FpEth4c8hdrmIjHlbqFOCOQ6100uzTpoRtKCmAJKnzDVUdd
 V+0GpdFbWKZVBeRTdfGEvIl2KFcJqiFfoye3qP5vzrezh5SOlJ0JI1ncO1s2oxqOQ4NP
 AQAgFeg1ux9dxZ6Y26hpYMevguFAmWV/EKe+Cja5H0qWOwjRgb4ZDRu0J4pUmSSTR9GP
 yMtg+orywQLMrZmdi2YdH/d1JaOlstKQFxpo1h19gjfGoFavFgDqhMaWE2i8+PkuLnc+
 ffXQ==
X-Gm-Message-State: AOJu0YyD9sPncwGREo1SQAzNYwq6YZrpLiN8ZOi/gPROJbYW6pW87fPj
 8NRTbNkhAFR3MYlCck6/0jyKGg==
X-Google-Smtp-Source: AGHT+IElT7AQoWznFRUzefnPxjuyk/f4YoUnTLHexKJLP0Tp7XWPjqhbr10/ecYGLyY7bzUkIUh3WQ==
X-Received: by 2002:a05:6512:282b:b0:505:7371:ec83 with SMTP id
 cf43-20020a056512282b00b005057371ec83mr22292485lfb.48.1697067560648; 
 Wed, 11 Oct 2023 16:39:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056512015b00b0050567cdb8f6sm2466032lfo.239.2023.10.11.16.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 16:39:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 12 Oct 2023 02:39:17 +0300
Message-Id: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/2] drm/msm/dsi: fix handling of TX DMA buffer
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

Fix two issues in how the MSM DSI driver handles the GEM-allocated TX
DMA buffer object.

Dmitry Baryshkov (2):
  drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
  drm/msm/dsi: free TX buffer in unbind

 drivers/gpu/drm/msm/dsi/dsi.c      |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 14 +++++++++-----
 3 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.39.2

