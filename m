Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541563E8AF4
	for <lists+freedreno@lfdr.de>; Wed, 11 Aug 2021 09:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79036E0C8;
	Wed, 11 Aug 2021 07:20:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0EA6E0C4;
 Wed, 11 Aug 2021 07:20:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="202255302"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="202255302"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 00:20:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="516569110"
Received: from fbrausse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.209.112])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 00:20:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
Date: Wed, 11 Aug 2021 10:20:12 +0300
Message-ID: <87zgtomor7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Freedreno] [PATCH v3 0/6] add fixes to pass DP Link Layer
 compliance test cases
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 05 Aug 2021, Kuogee Hsieh <khsieh@codeaurora.org> wrote:
> add fixes to pass DP Link Layer compliance test cases

Nitpick, please also include the approriate subject prefix to the cover
letter, e.g. "drm/msm" or "drm/msm/dp". Helps with mail filtering. :)

BR,
Jani.

>
> Kuogee Hsieh (6):
>   drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
>   drm/msm/dp: reduce link rate if failed at link training 1
>   drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
>   drm/msm/dp: replug event is converted into an unplug followed by an
>     plug events
>   drm/msm/dp: return correct edid checksum after corrupted edid checksum
>     read
>   drm/msm/dp: do not end dp link training until video is ready
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     |   3 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 137 +++++++++++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_display.c |  14 ++--
>  drivers/gpu/drm/msm/dp/dp_panel.c   |   9 ++-
>  4 files changed, 102 insertions(+), 61 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
