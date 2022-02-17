Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA744BA85D
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 19:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C6410E6B1;
	Thu, 17 Feb 2022 18:35:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1FB10E6A2;
 Thu, 17 Feb 2022 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645122948; x=1676658948;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4qJ8f3DvdzFtL6Kce/L1Hvdc1BFgt84LMQDjlrKs/3Q=;
 b=lpnYY1CnLynhKZDCOXHoreR00k4geSCiwFoavu/kAc/yPON8DuyO42jm
 j9FoL88DiwMJhhp5SCnvnrcTvsdHSBhM2VPxt7zJvzabsYlHY3GI99HbF
 +FcLTr3ZsFfNIC9v0n+DS9L3jdoqKqplbWg7TNY7FqT8+nB44DZ3KGNsB U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Feb 2022 10:35:48 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 10:35:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 17 Feb 2022 10:35:40 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 17 Feb 2022 10:35:39 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Date: Thu, 17 Feb 2022 10:35:27 -0800
Message-ID: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH v4 0/3] drm/msm/dp: replace DRM_DEBUG_DP with
 drm_dbg_dp
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

Since DRM_DEBUG_DP is deprecated in favor of drm_dbg_dp(NULL, ...),
replace all DRM_DEBUG_DP with drm_dbg_dp().

Kuogee Hsieh (3):
  drm/msm/dp: add connector type to enhance debug messages
  drm/msm/dp: enhance debug info related to dp phy
  drm/msm/dp:  replace DRM_DEBUG_DP marco with drm_dbg_dp

 drivers/gpu/drm/msm/dp/dp_audio.c   |  50 ++++++++++-----
 drivers/gpu/drm/msm/dp/dp_catalog.c |  35 +++++-----
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 124 +++++++++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_display.c | 103 +++++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
 drivers/gpu/drm/msm/dp/dp_link.c    | 103 ++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  47 ++++++++------
 drivers/gpu/drm/msm/dp/dp_parser.c  |   2 -
 drivers/gpu/drm/msm/dp/dp_power.c   |  25 ++++++--
 9 files changed, 302 insertions(+), 191 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

