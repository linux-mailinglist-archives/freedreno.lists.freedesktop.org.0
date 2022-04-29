Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B766C5154F7
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 21:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E9E10EFDD;
	Fri, 29 Apr 2022 19:57:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D6A10EFAA
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 19:57:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id m23so11795365ljc.0
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YoZVXCo4PMfF55omjM7YESeLUJqhypGsaVY7dLN503Q=;
 b=bkgLHFwubWrPKnMuEYQefQWDeremPVQH/eSVjhBgMhUuK/sxKYpc66AmLZM5J1hpKS
 K3hpEuAZ6/osXCkuCDHm4KVG7Nk9alHhxQ0RsnHV64QQ3Nw0ciBSzti2EuXYVesmkJaP
 JP47+jP3nfFVgjq+9q+Xh6HossCwup/Q+7At4wl8gLwl5/HW7c/d9hkQZzzzgkoM00yK
 h9BYyatL93MDIHqwLIoCkdyNb54vvcRnx5zlTt91b9nc00oJ25cxDxt84dbpgOQcg0qp
 h3Oy6fLU8VAb+sSU0TjLiGyM8rV3BIlBEE0YfYJQNeOlzFQDBVDlknc+b3aFIafVI5Vr
 Tsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YoZVXCo4PMfF55omjM7YESeLUJqhypGsaVY7dLN503Q=;
 b=raGJFSYcfXacTCDwwPvdGfzWBccBgQD9nzgfRKngg9f+NhsIBzV02xowTSckF8uk8i
 KttOPQL/6SMcjDOOIvbGAot973WCR+Gy3xX5UQeu8fUl8xvlU/VoIH8Ta07ZAA35dxdx
 +EsNvQg8Vf/msKpc8Q8HpqQ6SjNsbQc46aU5lXfnBM5K1pZTWBrT1pvR9i9QlucF8IkU
 w1U3QmixjUkl8NvVsPyFuwfLcjJ7E+ySexxx9pV1zDt6ZKPbHfFeTigH/6MnXYOp9LnD
 NjK9GN55nH5ThVxTVdLZkW2ZnB+MMeE9KBMfHp6mqC6qUrsvjJF06nQHH+DPWVJMPAp9
 VUAw==
X-Gm-Message-State: AOAM530q04gn1X6VDf0VJAT82kGr3QkBsHCjgShL79Cq7VekUs2xJZLa
 4kjVGcrls8ZpFN6UukwrSu3zKumg0Z0IfA==
X-Google-Smtp-Source: ABdhPJz4llIbCvxmbrWzkABIucHFj0SM6GnoCuD0aecJuHKOPn5IQBJAd4jcKQJJytop9bGcBm3coA==
X-Received: by 2002:a2e:a30a:0:b0:24f:cf6:11ab with SMTP id
 l10-20020a2ea30a000000b0024f0cf611abmr474751lje.461.1651262252816; 
 Fri, 29 Apr 2022 12:57:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 j17-20020ac253b1000000b0047255d2118csm10601lfh.187.2022.04.29.12.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 12:57:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 29 Apr 2022 22:57:26 +0300
Message-Id: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 0/5] drm/msm/dp: implement HPD
 notifications handling
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

USB altmodes code would send OOB notifications to the drm_connector
specified in the device tree. However as the MSM DP driver uses
drm_bridge_connector, there is no way to receive these event directly.
Implement a bridge between oob_hotplug_event and drm_bridge's hpd_notify
and use it to deliver altmode messages to the MSM DP driver.

Note, I left the original 'bool connected' field to be used by the
notifiers. However I think that it should be replaced in favour of using
the dp->hpd_state properly.

Changes since RFC v1:
 - Incorporated old patch dropping old usbpd code. Most of it remained
   unused.

Bjorn Andersson (2):
  drm: Add HPD state to drm_connector_oob_hotplug_event()
  drm/msm/dp: Implement hpd_notify()

Dmitry Baryshkov (3):
  drm/bridge_connector: stop filtering events in
    drm_bridge_connector_hpd_cb()
  drm/bridge_connector: implement oob_hotplug_event
  drm/msm/dp: remove most of usbpd-related remains

 drivers/gpu/drm/drm_bridge_connector.c   | 17 ++++--
 drivers/gpu/drm/drm_connector.c          |  6 +-
 drivers/gpu/drm/i915/display/intel_dp.c  | 17 +++++-
 drivers/gpu/drm/i915/i915_drv.h          |  3 +
 drivers/gpu/drm/msm/Makefile             |  1 -
 drivers/gpu/drm/msm/dp/dp_ctrl.h         |  1 -
 drivers/gpu/drm/msm/dp/dp_debug.c        |  6 +-
 drivers/gpu/drm/msm/dp/dp_debug.h        |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c      | 65 +++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.h      |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c          |  3 +
 drivers/gpu/drm/msm/dp/dp_drm.h          |  2 +
 drivers/gpu/drm/msm/dp/dp_hpd.c          | 67 --------------------
 drivers/gpu/drm/msm/dp/dp_hpd.h          | 78 ------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h        |  1 -
 drivers/gpu/drm/msm/dp/dp_power.c        |  2 +-
 drivers/gpu/drm/msm/dp/dp_power.h        |  3 +-
 drivers/usb/typec/altmodes/displayport.c | 10 +--
 include/drm/drm_connector.h              |  6 +-
 19 files changed, 82 insertions(+), 211 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h

-- 
2.35.1

