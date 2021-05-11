Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1605F37A87D
	for <lists+freedreno@lfdr.de>; Tue, 11 May 2021 16:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6636EA44;
	Tue, 11 May 2021 14:07:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3A66EA41
 for <freedreno@lists.freedesktop.org>; Tue, 11 May 2021 14:07:17 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id s25so25296800lji.0
 for <freedreno@lists.freedesktop.org>; Tue, 11 May 2021 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZ0fq1XLkr+7t54txjyF+prLq/e+EJtKN2/VBK9RqRA=;
 b=dJURLIRtSfLefeJ0dcskE0iV5FpV6mgBo25GlNtfOZjMliO6zTmKvVZVxFzlsB2bmo
 sUHy6L4LkcEF/kIY/vqeCXUVrkAwKP7ygfYDH/+Mdu5lIKnNlcWGmi7ixgVHk0DKlWLe
 2dYj6GkVqmw1bAI1c7v5rgWLPeEByxLJeZAneZKVPamkqLi/0AfYGIOTGVUWFbyowbzE
 9aLEiH9K0N2+AeJJNWtqu7yJFg2yzHPqsiXSYf+sxkO0NgNgPjB6y5850MMvqYhm9rL2
 qmTLS6hr5ucJzkW8B/pokv0fM9RmOzyIVRnXI0lrwS2bNAgTGUihkOhubKKlfasoBU2L
 bF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZ0fq1XLkr+7t54txjyF+prLq/e+EJtKN2/VBK9RqRA=;
 b=UZYM8KhNJeG0bXxUm6DfJFzQYN9nhNLMFo19aLPBgqxqjuFsgBt4UXMB9LfYTiejQU
 xp6XSXAL0xXbWWWxz/Jpumjnfdj8/deo7Ut1TrKwgYdc3N/JMsRpQg0NKIpqq1hzdISh
 KPMvJOATa5GnmsMsdv4sLHnd9H7c9tDKcH56lqSKtmm52Goglw/jW+upfuyODV8xOPap
 JXYeKQZJyBDov+mAdeMKtQNp0vt8NJgGc0ZPz/SyaMCRf/YVxS3sfPr7VDCuSloGgKQl
 aVPElQ+ByRGLf53Mwireau53hLiTwkDyHNamLCA8X7Kh2mHrLHb0p3Cwt9iD5VD/Yb+a
 JoMA==
X-Gm-Message-State: AOAM532x9+1iUTWQekqaxYtmFkLQODk3m95aG78G/8otlCqlZwibX2mr
 +GTeXvuv5udPkAYpq8XcuYsLww==
X-Google-Smtp-Source: ABdhPJz9YOOdjQ4oxmJ6lSPtpWVUQ0/h45QufJe3bMsUIvFF+oyfpJ6RYNrR7A6BWcRzy3v8BqdsAg==
X-Received: by 2002:a2e:5045:: with SMTP id v5mr24736463ljd.270.1620742035852; 
 Tue, 11 May 2021 07:07:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w23sm3731989ljw.59.2021.05.11.07.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:07:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue, 11 May 2021 17:07:11 +0300
Message-Id: <20210511140713.627291-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/2] drm/msm: rework clock handling
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify clocks handling
      drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 --------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  19 ++-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  21 ++-
 drivers/gpu/drm/msm/dp/dp_parser.h            |  17 ++-
 drivers/gpu/drm/msm/dp/dp_power.c             |  81 ++++++-----
 drivers/gpu/drm/msm/msm_drv.c                 |  49 +++++++
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 14 files changed, 164 insertions(+), 358 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
