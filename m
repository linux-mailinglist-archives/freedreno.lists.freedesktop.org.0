Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A928255A15B
	for <lists+freedreno@lfdr.de>; Fri, 24 Jun 2022 20:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B51110E127;
	Fri, 24 Jun 2022 18:58:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5588610E127
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 18:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656097100; x=1687633100;
 h=message-id:date:mime-version:to:cc:from:subject:
 content-transfer-encoding;
 bh=f3OcyFrVsPkFwpNg67V+9RgNemyD4Wvowr/oYHQ0+9g=;
 b=X12VmSM8W3LXSPzYlaCwh4srmLYNZnwGKlgOHenzxPByaIOqb2EBs0WV
 YHYVJmfVnod7I5vsa0jKCmfVWv+q+TVGUFCkGVl+/INoPsWh7nEEMN+aB
 xCORmKaWDtvGEAhNQbMYhw1dccyv3mCN6ghntvUMLrYnL0f4W6um5TYcl k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Jun 2022 11:58:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 11:58:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 24 Jun 2022 11:58:19 -0700
Received: from [10.111.161.199] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 24 Jun
 2022 11:58:17 -0700
Message-ID: <88c866c3-d2ce-a16e-98fc-c4bebf5b34fb@quicinc.com>
Date: Fri, 24 Jun 2022 11:58:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [GIT PULL] drm/msm: drm-msm-fixes-2022-06-24 for
 v5.19-rc5
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob

Here are the fixes for 5.19.

Namely this has the foll fixes:

- Fix to reset drm_dev to NULL in dp_display_unbind
- Fix to increment vsync_cnt before calling drm_crtc_handle_vblank
(IGT was re-tested with this change and CI also passes)
- Fix to resolve the smatch error of de-referencing before NULL check in 
dpu_encoder_phys_wb.c

Thanks

Abhinav

The following changes since commit a6e2af64a79afa7f1b29375b5231e840a84bb845:

   drm/msm/dp: force link training for display resolution change 
(2022-06-18 09:14:06 -0700)

are available in the git repository at:

   https://gitlab.freedesktop.org/abhinavk/msm.git/ tags/drm-msm-fixes-06-23

for you to fetch changes up to eb174bd875ae504cdc1b5b209da288fffb1e5128:

   drm/msm/dpu: Fix variable dereferenced before check (2022-06-23 
10:34:36 -0700)

----------------------------------------------------------------
drm-msm-fixes-2022-06-24 for v5.19-rc5

----------------------------------------------------------------
Kuogee Hsieh (1):
       drm/msm/dp: reset drm_dev to NULL at dp_display_unbind()

Stephen Boyd (1):
       drm/msm/dpu: Increment vsync_cnt before waking up userspace

sunliming (1):
       drm/msm/dpu: Fix variable dereferenced before check

  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  3 ++-
  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 +++++-----
  drivers/gpu/drm/msm/dp/dp_display.c                 |  2 ++
  3 files changed, 9 insertions(+), 6 deletions(-)
