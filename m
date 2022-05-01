Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2B5164DD
	for <lists+freedreno@lfdr.de>; Sun,  1 May 2022 17:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2955010F236;
	Sun,  1 May 2022 15:12:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BF510F22F
 for <freedreno@lists.freedesktop.org>; Sun,  1 May 2022 15:12:23 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id 4so15789511ljw.11
 for <freedreno@lists.freedesktop.org>; Sun, 01 May 2022 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcp90gaPZLzvVD4QztWlFtHIaIGASrYLr4Z5ANOtEbg=;
 b=lKnZjMgrJdGl9HP0JnYC9LYTnOiNOrDjnSOhuibPINeJ8AumJGsZKdLIzQ/Km3d+VO
 p9cDZGdyiINY7KsZzFUAASrG4xP2YxRMAxEmcakBd5DTmOOZdPH9AX8NJraF508LB1tT
 hrkl6vV9nUNlNfsuyZ29rgBk8C5KeJDTFswg56dOq0vuidD9Sabbm3grEe7GWdin8lYx
 xcEbtizWOqcnotUEk3mqaizkOD4jL4YspRz/YO+xwtG8G7PARMH1lHNg/+/s7fxmU8mb
 0KFC6x+btQw0jpjfLMC3tS9dpMnUV0hRo1NMcrLRbJSJP600cQGOXoTac6OfYSyj5ooj
 jA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcp90gaPZLzvVD4QztWlFtHIaIGASrYLr4Z5ANOtEbg=;
 b=7JIUgn9zTO9CnM9WOFSbVTPnVUpBTfojosUGXfs8qKFLPkamZ+tX5b6CvThLcQf9qe
 4vs1wjSx0qUfFHYIa8TUNpTuQskIklMpbUNwyhtfpn+9ETMQzb3Tf2eq2saqJwJDZ86c
 7ivCLWpdSHTODXBbEvYDHgtMe4HOMWsiTtisWQSZjojniOiL2B7yS0YFZq8PYH4Lt5kn
 m12W9xYoW1xfYE9J7ZsmyeT9anPR33EUpQtsRGGjM1arnZze8OxXYaIHMy6iwXwRZF/o
 E1ghrJ6MpwN473a9IAtHq2cWy/A1RR+KI1zADc5pPJHuQ5QrNVyMa5ubP11VBjZ5jYKA
 vuYQ==
X-Gm-Message-State: AOAM530jbM1vdQTiNSMrBd4sYOWVGOkGEK2fnYUezyJa9XXZT+SqLp88
 hrjxi6bMIYWo3B84k+EfOsXUqA==
X-Google-Smtp-Source: ABdhPJwy3LKBmD0zbYUKLq70u5uq7jRovsAeKwEnH4chta+EQoxhvuNX/52f0cVP3W3Wp+06QV2Qhw==
X-Received: by 2002:a2e:b557:0:b0:247:e509:4a50 with SMTP id
 a23-20020a2eb557000000b00247e5094a50mr5770859ljn.72.1651417941572; 
 Sun, 01 May 2022 08:12:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l16-20020ac25550000000b0047255d210dbsm461975lfk.10.2022.05.01.08.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 08:12:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  1 May 2022 18:12:17 +0300
Message-Id: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm: move dsc data pointer from drm_panel
 to mipi_dsi_device
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

To properly support DSC the sink driver (panel) has to pass DSC pps data
to the source (DSI host). The commit 0f40ba48de3b ("drm/msm/dsi: Pass
DSC params to drm_panel") added a pointer to the DSC data to the struct
drm_panel. However this is not the ideal solution.

First, this leaves DSC-supporting DSI sink bridges (like ANX7625 which
support DSC decoding on the MIPI DSI inputs).

Second, this does not play well with the panel_bridge. Drivers depending
solely on the bridge chains will still have to lookup panel and fetch
data from it.

Last, but not least, the DSC data is not relevant for the wide variety
of panels including DPI and LVDS panels.

To solve all these problems, move struct drm_dsc_config pointer from
struct drm_panel to struct mipi_host_device. This way MIPI DSI host
driver receives DSC data during attach callback without additional
lookups.

Dependencies: this depends on the MSM DRM DSC patchset [1] being pulled
in through the MSM DRM tree.

[1] https://patchwork.freedesktop.org/series/102262/

Dmitry Baryshkov (3):
  drm/mipi-dsi: pass DSC data through the struct mipi_dsi_device
  drm/msm/dsi: fetch DSC pps payload from struct mipi_dsi_device
  drm/panel: drop DSC pps pointer

 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++--------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 include/drm/drm_panel.h            |  7 -------
 3 files changed, 13 insertions(+), 21 deletions(-)

-- 
2.35.1

