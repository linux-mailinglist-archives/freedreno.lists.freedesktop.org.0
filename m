Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701E5515655
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 23:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1642010FAA5;
	Fri, 29 Apr 2022 21:01:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132E210FAA7
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651266084; x=1682802084;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YAy5hDNSXKSdiUe7Q8Gg9AVeElzFMCbEu2X1y5vlsLw=;
 b=zgYxipx6N2VMVk1GUb4OhW4qvYgUKi5FCgOhFFXFsmMpIehYmAZClDXP
 w+tffYFqgs4m+WlNzwjk/6EwJw3Z+jQaJFjE5smsYin6M5qEcTx/hwK/2
 Kco2vQ7aSrHq5z04SCoQigutoKE+O+ju4NfHwKg3S1IDPndwl2K84Upua E=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 29 Apr 2022 14:01:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 14:01:23 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 14:01:22 -0700
Received: from [10.38.245.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 29 Apr
 2022 14:01:21 -0700
Message-ID: <1ff04bd4-7d0d-9a08-6ea6-277c0eec0f43@quicinc.com>
Date: Fri, 29 Apr 2022 14:01:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>
References: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [RFC PATCH 0/4] drm/msm/dp: implement HPD
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
Cc: linux-arm-msm@vger.kernel.org,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 freedreno@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Adding kuogee here to keep him in the loop.

We will also review/test these.

Thanks

Abhinav

On 4/29/2022 12:29 PM, Dmitry Baryshkov wrote:
> USB altmodes code would send OOB notifications to the drm_connector
> specified in the device tree. However as the MSM DP driver uses
> drm_bridge_connector, there is no way to receive these event directly.
> Implement a bridge between oob_hotplug_event and drm_bridge's hpd_notify
> and use it to deliver altmode messages to the MSM DP driver
> 
> Bjorn Andersson (2):
>    drm: Add HPD state to drm_connector_oob_hotplug_event()
>    drm/msm/dp: Implement hpd_notify()
> 
> Dmitry Baryshkov (2):
>    drm/bridge_connector: stop filtering events in
>      drm_bridge_connector_hpd_cb()
>    drm/bridge_connector: implement oob_hotplug_event
> 
>   drivers/gpu/drm/drm_bridge_connector.c   | 17 ++++++++++++-----
>   drivers/gpu/drm/drm_connector.c          |  6 ++++--
>   drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++++++++++++---
>   drivers/gpu/drm/i915/i915_drv.h          |  3 +++
>   drivers/gpu/drm/msm/dp/dp_display.c      | 11 +++++++++++
>   drivers/gpu/drm/msm/dp/dp_display.h      |  1 +
>   drivers/gpu/drm/msm/dp/dp_drm.c          |  3 +++
>   drivers/gpu/drm/msm/dp/dp_drm.h          |  2 ++
>   drivers/gpu/drm/msm/dp/dp_hpd.c          | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_hpd.h          |  5 +++++
>   drivers/usb/typec/altmodes/displayport.c | 10 +++-------
>   include/drm/drm_connector.h              |  6 ++++--
>   12 files changed, 83 insertions(+), 19 deletions(-)
> 
