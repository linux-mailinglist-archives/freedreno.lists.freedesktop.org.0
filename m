Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1B9515473
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 21:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E28E10E135;
	Fri, 29 Apr 2022 19:29:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3A410E135
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 19:29:31 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id v4so11629104ljd.10
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 12:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3SvLk5TP6P/sVxT2lEncD+uRqoDF7TswQoR3K12ke84=;
 b=kOkUoiQ1zgTce1LEq2rQ1z8p6CJcKQFmPCJtg9pz5utZMffMXK2JVqROIrmEwNRvdJ
 tgyaTh7nwZMkv/Auvm2XGfYqHDe8NJEBiqkTj8wesaG8NlhfmyVfy8KhQfHQj2TB6o5o
 zvFoOYDJp+ROD0smBvQE3zbj1/9bCkly3WLJaGctXDuRG8EtsKpMeS1UidIY+GDYuetU
 pGJiTZvXBpuNI/Kvm4iLjiAE1L2qnkB2WSmQcPxutpNVqNjgWCJSxLNdeP2OwgSM/oZo
 ZanuA0xHZyYb6jxcBi6I9rYk1wjYbAAhgUM+MDoeIIysKVSsrum0bNvsbEiknkvOvO6X
 Q27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3SvLk5TP6P/sVxT2lEncD+uRqoDF7TswQoR3K12ke84=;
 b=ha4WQmtpQYXswaoKkvv4tHXZYVPuJYdHbIemMjgGMuLQevw/QPJXi1WIBATk7qYNZx
 3eJlyTM7pythRId+HN4z7gt5Fg+bC9ZLPW6VVuivjp0oGJfJH9peAuPFevJZN6vcpz43
 s5SPkGuvnKpCM/ii5mm/px+uyiCB73Gd5eNTwyvxqhMrFGkcxL5wByGLZfBksSD01Gev
 OR9Cr8m0nh4lUaHflmAplShT7dBd9LSCzSXvJaZPbSRE0APZLGeEpZQBD1eSd5sO0Nh/
 6YzEsHc+b17KOilxe2mwyRPzITMWiX9Yofn+qPb+Rwz3x6zTR0Ku+iAhiCuafijjjKHZ
 VO3g==
X-Gm-Message-State: AOAM5322XTnd77W7GHy36qgl38k+rhH0MwUnIjPpW/JRd42SPM/z03WH
 Vs9bkMraVHwByGEufmDXPlx4zQ==
X-Google-Smtp-Source: ABdhPJzmJFI1u3ls6UXLOa+wli7Vrojk5Tfom13j11M/XsobZcxiKnXIvykm4/P+EmLL8BF8Zm5Fjg==
X-Received: by 2002:a05:651c:311:b0:246:1250:d6f with SMTP id
 a17-20020a05651c031100b0024612500d6fmr411264ljp.455.1651260570270; 
 Fri, 29 Apr 2022 12:29:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y10-20020ac24e6a000000b0047255d211e7sm5522lfs.278.2022.04.29.12.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 12:29:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 29 Apr 2022 22:29:24 +0300
Message-Id: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 0/4] drm/msm/dp: implement HPD notifications
 handling
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
and use it to deliver altmode messages to the MSM DP driver

Bjorn Andersson (2):
  drm: Add HPD state to drm_connector_oob_hotplug_event()
  drm/msm/dp: Implement hpd_notify()

Dmitry Baryshkov (2):
  drm/bridge_connector: stop filtering events in
    drm_bridge_connector_hpd_cb()
  drm/bridge_connector: implement oob_hotplug_event

 drivers/gpu/drm/drm_bridge_connector.c   | 17 ++++++++++++-----
 drivers/gpu/drm/drm_connector.c          |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++++++++++++---
 drivers/gpu/drm/i915/i915_drv.h          |  3 +++
 drivers/gpu/drm/msm/dp/dp_display.c      | 11 +++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h      |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c          |  3 +++
 drivers/gpu/drm/msm/dp/dp_drm.h          |  2 ++
 drivers/gpu/drm/msm/dp/dp_hpd.c          | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_hpd.h          |  5 +++++
 drivers/usb/typec/altmodes/displayport.c | 10 +++-------
 include/drm/drm_connector.h              |  6 ++++--
 12 files changed, 83 insertions(+), 19 deletions(-)

-- 
2.35.1

