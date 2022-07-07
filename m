Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D2B56A78A
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 18:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAA911AF97;
	Thu,  7 Jul 2022 16:11:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1957011AF6F;
 Thu,  7 Jul 2022 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657210291; x=1688746291;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=leYdCXoGwry2lcj0LA4bM6t7+gCgiTv/P4EyrpLt2nM=;
 b=G7P1oc2lo/sWE7pJmVJGu+uyPO2iG8RPHLFIL1Ay3yZXtLAHSNjA/DC8
 FhPoJOvtWeE6TnHRLEWroEi0XpR80+/UVmlKcNazJRh2NsfoNxc1duzgb
 ee/WgmUdZKzRB7Y+CZBultWC7y27Uxqo7bLsocSLreaadvutyKQx0uESN Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Jul 2022 09:11:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 09:11:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 09:11:29 -0700
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 09:11:22 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Thu, 7 Jul 2022 21:40:55 +0530
Message-ID: <1657210262-17166-1-git-send-email-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH 0/7] Improve GPU Recovery
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Wang Qing <wangqing@vivo.com>, David Airlie <airlied@linux.ie>,
 Matthias Kaehlcke <mka@chromium.org>, Andy Gross <agross@kernel.org>, Daniel
 Vetter <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean
 Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


Recently, I have debugged a few device crashes which occured during
a recovery after a hangcheck timeout. It looks like there are a few
things we can do to improve our chance at a successful gpu recovery.

First one is to ensure that CX GDSC collapses which clears the internal
states in gpu's CX domain. First 5 patches tries to handle this.

Rest of the patches are to ensure that few internal blocks like CP, GMU
and GBIF are halted properly before proceeding for a snapshot followed by
recovery. Also, handle 'prepare slumber' hfi failure correctly. These
are A6x specific improvements.


Akhil P Oommen (7):
  drm/msm: Remove unnecessary pm_runtime_get/put
  drm/msm: Correct pm_runtime votes in recover worker
  drm/msm: Fix cx collapse issue during recovery
  drm/msm: Ensure cx gdsc collapse during recovery
  arm64: dts: qcom: sc7280: Update gpu register list
  drm/msm/a6xx: Improve gpu recovery sequence
  drm/msm/a6xx: Handle GMU prepare-slumber hfi failure

 arch/arm64/boot/dts/qcom/sc7280.dtsi  |  6 ++-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h |  4 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 83 ++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 36 +++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c         |  9 ++--
 drivers/gpu/drm/msm/msm_gpu.h         |  1 +
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  4 --
 7 files changed, 100 insertions(+), 43 deletions(-)

-- 
2.7.4

