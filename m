Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860C4B9390
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 23:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B2B10E63C;
	Wed, 16 Feb 2022 22:05:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E690A10E64C;
 Wed, 16 Feb 2022 22:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645049133; x=1676585133;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=mOpb71KXIdXvIAOjlISeWGlDrGKXxCWz4DFwHHI1Qew=;
 b=atZbG2RQgcxfpHFONugdbsBbOwA4qiHxDYNZUtQaXGIFdPWOmxv/7zth
 TD4uu6pn7ZMr7oPw1u1saRvU546q0nAfF5BVCL6lCq0cDrTER/apkVEuT
 azZJVGudFdyWk8RTQyfdIqRRG+C8VpMk1+1R4oZJEJkQsrjO0o5kbBiwy Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 16 Feb 2022 14:05:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 14:05:16 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 14:05:16 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 14:05:15 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Date: Wed, 16 Feb 2022 14:05:02 -0800
Message-ID: <1645049106-30481-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH v7 0/2] drm/msm/dp: enable widebus feature base
 on chip hardware revision
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

revise widebus timing engine programming and enable widebus feature base on chip

Kuogee Hsieh (4):
  drm/msm/dpu:  revise timing engine programming to support widebus
    feature
  drm/msm/dpu: delete DATA_HCTL_EN from sc7280 hw feature
  drm/msm/dpu: replace BIT(x) with correspond marco define string
  drm/msm/dp: enable widebus feature for display port

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 14 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 61 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 34 +++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  3 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 13 +++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c                | 32 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h                |  2 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  4 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
 15 files changed, 165 insertions(+), 27 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

