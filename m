Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED91423431
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 01:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504546E488;
	Tue,  5 Oct 2021 23:11:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB05F6E48F
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 23:11:43 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 i26-20020a4ad09a000000b002a9d58c24f5so313034oor.0
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQpkJbXdp5NaD5qxiGom/Wfq8wfmW/3aS/lr+Qb5xRs=;
 b=oqueMNzGUkR0//cRE4HSJcINwQU73pQ04AVYh5mEi30ciDFiUR7SdlfNFHjRM1fuB9
 3D5Oh6BvUVktSBS608uBVmqAPMRPeuNYY6NIcQNSApWe0jxdI85bNGZAzvVirv++hoBy
 iLzxcGCco/T4vqO1tWmBEv1E6dW6Y496l/uk3QfVWiZYZ7dL5PYkIIShrjWHdztByYWF
 7P9ydFYcXIEEmO+HpdGpkyCdbsO7TpqstsYzsAJxWvHuITuVIJ6LFeeqD3A7JuMQX1Xt
 IjTiBX3zxBQfvkKdGaWzMgv8XpfYec4Ev9IO1c2Hcg3LnOR/9VCLlX7H9EejfX2XGytz
 Gfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQpkJbXdp5NaD5qxiGom/Wfq8wfmW/3aS/lr+Qb5xRs=;
 b=8Mb1f9B8yWDj0P9ngrBRmXko3rKKGbhQh8b10k56S+eKp4RQmv4GLtw6v5WYWRpx7u
 mMlsH6TRYnWYszeOn0SC+q43Bihghk84T4tHK4FsGcH2U7jzFzHJFdoLQ3W0qpMuP4CO
 X4urkLotUI3S4iJOMA+5wraeKGAdhbCW4RzeTZLj4VmhyEgymkr1O3hpitekS5917ray
 ao0a4YlWV8438pErI7id0SXOtRE+h8k4sSj6+r/dyxEhgZBrz8fNr3/jEkkHvUb3uv/o
 LJ30LBl2XcEUs0FbRGGkKcUIYuVxNCT81ypyiLumjzTQIVCkO55S6lbPlAkqIxWxq/77
 IINw==
X-Gm-Message-State: AOAM532Fj2x4rq7X6kbbylX0y12D3YNGljtRJenxEgfk8aLKhkkdF18C
 aZoK1fvir/avCoDa3VeaPrRw0g==
X-Google-Smtp-Source: ABdhPJyyWLaV9KUdV30ySmf3HQps056UZvaj3bt/VAjhu9J/UFlwoxSolCJwEnrtnJ7mikzLiPkREA==
X-Received: by 2002:a4a:e0c4:: with SMTP id e4mr15716360oot.24.1633475502788; 
 Tue, 05 Oct 2021 16:11:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 v9sm1665141oth.62.2021.10.05.16.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 16:11:42 -0700 (PDT)
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
Date: Tue,  5 Oct 2021 16:13:16 -0700
Message-Id: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/5] drm/msm/dp: Support multiple DP
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

Bjorn Andersson (7):
  drm/msm/dp: Remove global g_dp_display variable
  drm/msm/dp: Modify prototype of encoder based API
  drm/msm/dp: Allow specifying connector_type per controller
  drm/msm/dp: Allow attaching a drm_panel
  drm/msm/dp: Support up to 3 DP controllers
  dt-bindings: msm/dp: Add SC8180x compatibles
  drm/msm/dp: Add sc8180x DP controllers

 .../bindings/display/msm/dp-controller.yaml   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  23 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  66 ++++----
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c           | 153 ++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h           |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |  13 +-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  30 +++-
 drivers/gpu/drm/msm/dp/dp_parser.h            |   3 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   2 +-
 10 files changed, 194 insertions(+), 108 deletions(-)

-- 
2.29.2

