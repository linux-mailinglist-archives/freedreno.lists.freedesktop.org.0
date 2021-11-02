Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F84428CF
	for <lists+freedreno@lfdr.de>; Tue,  2 Nov 2021 08:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F1F6FC3E;
	Tue,  2 Nov 2021 07:49:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7284E6FC3D;
 Tue,  2 Nov 2021 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635839354; x=1667375354;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ACJNqGHt3cpapSBqik2oM0AjcgSHSZ3LqelPF8zK9+g=;
 b=gmzidwQuXNc8xWKw2gCPorfEhj5vkbdbMxOL0lXzBC5KYc537O8GJZNV
 I3rpcZPXPzKo5Ugbf1taU/+RpWL3Mg7cDC+6WbvGJr70oJa8caY8qutlS
 1h+XPycU4PV0pb14NU2VSF+69JqH9wGhRZ8j2cSWqyWqH1OquXuaTnnB8 4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Nov 2021 00:49:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 00:49:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 2 Nov 2021 00:49:12 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 2 Nov 2021 00:49:08 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 2 Nov 2021 13:18:40 +0530
Message-ID: <1635839325-401-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH v4 0/5] Add support for eDP controller on SC7280
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dianders@chromium.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 robdclark@gmail.com, seanpaul@chromium.org, quic_mkrishn@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

	This series will add eDP controller support for Qualcomm SC7280
platform. These patches are baseline changes with which we can enable
eDP display on sc7280. The sc7280 eDP controller driver can also support
additional features such as no_hpd detection, PSR, etc. which will be
enabled in subsequent patch series.

	This is based on Bjorn's changes in the below mentioned series
to support both eDP and DP programming through the same driver:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=564841

Sankeerth Billakanti (5):
  dt-bindings: msm/dp: Add DP compatible strings for sc7280
  drm/msm/dp: Add DP controllers for sc7280
  drm/dp: Add macro to check max_downspread capability
  drm/msm/dp: Enable downspread for supported DP sinks
  drm/msm/dp: Enable ASSR for supported DP sinks

 .../bindings/display/msm/dp-controller.yaml        |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 23 +++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_display.c                |  9 +++++++++
 include/drm/drm_dp_helper.h                        |  7 +++++++
 5 files changed, 40 insertions(+), 5 deletions(-)

-- 
2.7.4

