Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92241F420
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 19:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A636EEB0;
	Fri,  1 Oct 2021 17:59:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6225B6EEA9
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 17:59:12 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so12471935ota.13
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 10:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOEpp8U8xX+6/NOjtA3o9vPVh0Gxvu3XnufRMdc17ts=;
 b=VpKDdIERxN8vo/ULToynZ+l8fN3RR2TnS8NX7KSsSFiRalxivhNx+68K+vjjmJQ2vf
 aQgEaDQkWCe10d2uljIBR9dbopWyR6lTNRkh6gm82qm/vFoXqdtD1JKefZhVM94h+xFz
 CWl7PRS9+e2WpM/wb6zFQowu8Txsz+w7eFF4SLpVJ1SdGwVo/n2ZuRnjJySEjoQ+oMXW
 5p4zsSpDuNMKO83ipGowzGBsIvl87Z0YKpH1lzZb5sBDuxZG9W3yCvCAq6Wp1Q3UfeAr
 TKOqxs5A2x4pbBUEMlSCBfjoQIrjfhaWsSAo9jVD3lAOKHfH7bwUP9DkOvjYIZ4ig2sS
 f/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOEpp8U8xX+6/NOjtA3o9vPVh0Gxvu3XnufRMdc17ts=;
 b=LuDI+LvzwVVvoGkA1bGnMU2UPJTMueTMLY34SOMHETBtDZ6nHRrmUF4SsokL8sXupD
 F6GrBub8n6UeuD1e9f/Rim4qwSHa+JtCiFH8YutnOFYcA/YLrZoaLnYmrBJDrQoUTD+A
 0wwZzM8p4Zw8fnqppuszwSome4S2501krhHDwx7gQgtnZwCZebbbkOrd5x17ad8KpZH4
 Kpsb66N8vmxlAf7bmFi/a9p8JMVCvi0WTZgoie7oDtlq/FTNj2AOXrJsuxQwRBnYmogQ
 PJzjyrZ6GUq1nt1JWnnUwjW3Msj7oQPHkHfPMxxuKriCNDUZ1eB720Cj4Z9yOpAUK5qL
 NHmw==
X-Gm-Message-State: AOAM530Hbb4nFYJwq/OCrfI5Lu49OI7lnXiHBitgHnzxQ+T9lx1R674z
 xEECIUGE6o1SPKsNbSLFTFHqYw==
X-Google-Smtp-Source: ABdhPJy0f4QtOVsANWtDyoi86zc179vzJoaTYKeyXJEeqhBvho5HZ2MJ/DCOIFhb/oT9MOrv7y/LVw==
X-Received: by 2002:a9d:19c1:: with SMTP id k59mr11580550otk.348.1633111151822; 
 Fri, 01 Oct 2021 10:59:11 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 w2sm1284798oof.23.2021.10.01.10.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:59:11 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Oct 2021 11:00:53 -0700
Message-Id: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/5] drm/msm/dp: Support multiple DP
 instances and add sc8180x
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

The current implementation supports a single DP instance and the DPU code will
only match it against INTF_DP instance 0. These patches extends this to allow
multiple DP instances and support for matching against DP instances beyond 0.

With that in place add SC8180x DP and eDP controllers.

Bjorn Andersson (5):
  drm/msm/dp: Remove global g_dp_display variable
  drm/msm/dp: Modify prototype of encoder based API
  drm/msm/dp: Support up to 3 DP controllers
  dt-bindings: msm/dp: Add SC8180x compatibles
  drm/msm/dp: Add sc8180x DP controllers

 .../bindings/display/msm/dp-controller.yaml   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  23 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  66 +++++----
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c           | 131 +++++++++---------
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
 6 files changed, 132 insertions(+), 102 deletions(-)

-- 
2.29.2

