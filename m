Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1274B9879
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 06:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D6E10E6FF;
	Thu, 17 Feb 2022 05:55:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EBD10E6F8
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 05:55:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d23so7887331lfv.13
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 21:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0CR4bg/aP+HYLaxgruFj36yg6CA19rL8bNRs6En6EY=;
 b=Pmt47riEYW0RnTKnLKfpZ9wNNpw8xDqXNVZSeeR56zhnZ/pS8uhfwEePar4mneJanK
 KW9qulmsVBHGditbxVswz6KGfXGDReNfoibGEr2+eHaaUlkOkOhjrP8n/6UJg2kRDTp9
 /Gmv97l1SX/f8hLNSaRZSUmuJfW88xAjsBmrP7DRFIh88SaXKuDaUlQJf0c5CfUC8T1s
 76Ieits0v0zlePNU7SWz/i48TJnTMj7H+wNtxty0QyX9XyHqUVYmhqHLg3C1De4mJWup
 yobSJmm3ZTlnnKRGQaPdNBmHl4vjsrMoUSP9nZ4wIE3Svi53hkCd/6uytWqgyInksfNH
 E07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0CR4bg/aP+HYLaxgruFj36yg6CA19rL8bNRs6En6EY=;
 b=Ok7Tm38m+Vn9SvGKZdBxh1B4SXpkqb5PpnkjI8SHtQuv2LWdK4fM6rQ66kfw32htwf
 kDhLy1KHp+GGJcpuEDVVDUVgrSwj81xZY7ZpHiIPL3rthGDRsGoai9TCjSit6oR7X2Ld
 H0I1zLS3FqNvPLiP+ZV2t8/3YlFzve5a8QIZiNMh8sZhwxrClSHRb9TGOXHRgFMPocOf
 IUcP0vNlCSNBGiy6bhsx2kBsl4vgo5zuIoApbRZyhBE3cNg8LwYAdIVt6vQ/G0jhkE73
 rc3tfAfIr3BdYYzy2kWFNZzlrhK+pNbTvPAp3X7rAr5fz79NbLtszMmmQUOeMAGvmg59
 jnFg==
X-Gm-Message-State: AOAM531dXyM8NR1lOSFUpdz0jIXRvmCp2iW/UXiwQ8wX6MG9Ax6MUnB+
 +3QWx01UgAEpVUOgbNhEqU4A9A==
X-Google-Smtp-Source: ABdhPJyCqRQFL/8kW2qka2z7yQ2e41iQFhz/oVM7tj5ddheolaV0OojmGa7YZrgNoSsrXFrq5WWMUw==
X-Received: by 2002:a05:6512:696:b0:443:7fb9:1ae3 with SMTP id
 t22-20020a056512069600b004437fb91ae3mr1078435lfe.249.1645077330914; 
 Wed, 16 Feb 2022 21:55:30 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u13sm5015998lfs.260.2022.02.16.21.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 21:55:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 17 Feb 2022 08:55:24 +0300
Message-Id: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 0/5] drm/msm: rework clock handling
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly. This also
removes dependency of DP driver on the DPU driver internals.

Note that DP changes were compile-only tested.

Changes since v4:
 - Use size_t for num_clocks in dpu_kms/dpu_mdss
 - Use min() in dpu_core_perf_crtc_update()
 - Drop overcomplicated clock rate setting wrappers inside DP code.
   We were setting the opp for one clock and setting a rate for a single
   clock! Call dev_pm_opp_set_rate() and clk_set_rate() directly.

Changes since v3:
 - Switched to devm_clk_bulk_get_all() per Stephen's suggestion.
 - Removed a call to of_clk_set_defaults() (per Stephen's suggestion
   again). It duplicates a call in platform_probe().
 - Split the first patch (moving helpers to msm_io_utils.c), it's unused
   now.

Changes since v2:
 - Retain conditional code/prints in DP code to ease debugging
 - Rebase on top of msm-next and [1]
 - Split helper functions to msm_io_utils.c as suggested by Jessica

Changes since v1:
 - Rebase on top of current tree to fix conflicts

Dmitry Baryshkov (5):
  drm/msm/dpu: simplify clocks handling
  drm/msm/dp: "inline" dp_ctrl_set_clock_rate("ctrl_link")
  drm/msm/dp: set stream_pixel rate directly
  drm/msm/dp: inline dp_power_clk_set_rate()
  drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  23 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  13 +-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  43 ++--
 drivers/gpu/drm/msm/dp/dp_parser.h            |   6 +-
 drivers/gpu/drm/msm/dp/dp_power.c             | 105 ++--------
 12 files changed, 74 insertions(+), 426 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h

-- 
2.34.1

