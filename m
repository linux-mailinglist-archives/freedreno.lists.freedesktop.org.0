Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F72678C9B
	for <lists+freedreno@lfdr.de>; Tue, 24 Jan 2023 01:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D45710E5DB;
	Tue, 24 Jan 2023 00:10:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF07510E5DE
 for <freedreno@lists.freedesktop.org>; Tue, 24 Jan 2023 00:10:20 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x36so16529359ede.13
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jan 2023 16:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h9InQuEAasegQPkXBmgOapwHP1eVXkQE74+WMtrPDbE=;
 b=n0d5aadnK5xFzNiAbzjpBW8R1l0Un59NvTRG1eyLJUD+LelcC2fwacIAV96lEkWBng
 Ps5AnB7P+ZA+bzI3isUuTldYxb01kM2SeJefXkRc5ssrGT4R9OXGYoxSKsbTS8D4pta7
 wtvI4p+bqWII0vVZ7zavVgtRpraGMypz2tTS93WQ3zeuvNqAGMF7COloHZcH7q70R/a4
 hIaeKldWuvTI9SnefBEOjGw7EbRJTDKTBUo1ZLQ46vY9UTLpnzBU/3kij/7qOMxmprZT
 aOrYwPfkcyC/NzHQw9Jgw165COyiMcz+PvptiyEmRnqVxfkh7gHBeYLe8UaznEO3Wunm
 mqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h9InQuEAasegQPkXBmgOapwHP1eVXkQE74+WMtrPDbE=;
 b=2QF8yEQVRQwHiw7wTrmeebLxEyqxOJcCo7yvYaK6IyZMD807eNxRn0PU2j2SGcbJ2T
 9N74/bX7mpPt/Hhq6pFvn5G9g1jonTWrsuPvOATfpP6TEp2cwqYC9/ctykP2X9jtO2zN
 oKFNsgkVYtUD7p/IgfHsMVfZBNxcUc9zM3bxClFVibkURQR3hkXwMpbF/wzkFpmudQku
 2vEAO6/ebe5hfEA53l6eO/AgW9jIGOkG0lwWgZJdRfEQl6JU08IJ1gYb455jSLcmzNz0
 yZLFyh5V8fWphMW4EXEC8/BIQoicG0v7/XkabQGeNc33hhd9PpKV3Uy3p6lRNXGS9Xb9
 CNcg==
X-Gm-Message-State: AFqh2koItCAVAHij2GN089aRV85ORJDdcJ7F9F4MjAvMKP5CITXI+DqN
 kNYT+Fbx9TfKLm75n3GohTVVsQ==
X-Google-Smtp-Source: AMrXdXtXulxVSbBQgMkYnJtdz0QccnWBdhLLidrfMwJJJJGe2vfdHo5UH5h1VYj1vWYqVX0iOXDijA==
X-Received: by 2002:a05:6402:493:b0:46d:53d7:d21e with SMTP id
 k19-20020a056402049300b0046d53d7d21emr26582675edv.27.1674519019241; 
 Mon, 23 Jan 2023 16:10:19 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d29-20020a50cd5d000000b0049e19136c22sm330354edj.95.2023.01.23.16.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 16:10:18 -0800 (PST)
Message-ID: <47c83e8c-09f1-d1dd-ca79-574122638256@linaro.org>
Date: Tue, 24 Jan 2023 02:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 00/14] add display port DSC feature
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> This patch add DSC related supporting functions into to both dp controller and dpu enccoder
> 
> Kuogee Hsieh (14):
>    drm/msm/dp: add dpcd read of both dsc and fec capability
>    drm/msm/dp: add dsc factor into calculation of supported bpp
>    drm/msm/dp: add configure mainlink_levels base on lane number
>    drm/msm/dp: correct configure Colorimetry Indicator Field at MISC0
>    drm/msm/dp: upgrade tu calculation base on newest algorithm
>    drm/msm/dp: add display compression related struct
>    drm/msm/dp: add dsc helper functions
>    drm/msm/dp: add dsc supporting functions to DP controller
>    drm/msm/dsi: export struct msm_compression_info to dpu encoder
>    drm/msm/disp/dpu: add supports of DSC encoder v1.2 engine
>    drm/msm/disp/dpu1: add supports of new flush mechanism
>    drm/msm/disp/dpu1: revise timing engine programming to work for DSC
>    drm/msm/disp/dpu1: add dsc supporting functions to dpu encoder
>    drm/msm/disp/dpu1: add sc7280 dsc block and sub block

Some generic notes regarding the series. I understand that the the 
series is complex, but following points might ease both your work and 
the review proces.

First, atomicity. If your commit message says 'do this and that', it is 
highly likely that the patch should be split into smaller parts.

Second, please pay attention to the history. If some part of the code or 
  the data structure was removed, you have to justify bringing it back. 
This is extremely important in your case, as significant parts of the 
code come from the vendor code, thut it is easy to step on the same rake 
again. And if the previous removal was incorrect, please describe why.

If we went through 10 revisions of a patch a year ago, it's not worth 
sending again a patch that closely remedies one of early iterations. It 
doesn't stand a chance of getting through.

Next. Obvious item. ./scripts/checkpatch.pl should be your friend. It is 
not.

Last, but not least. Please follow the mailing list. Less than a week 
ago one of reviews pointed out that commit messages like 'this patch 
does this and that' are not really welcomed. By sending the same kind of 
commit messages, you stand a high chance of receiveing the same 
response. Please go through the recommendations in 
Documentation/process/submitting-patches.rst.

> 
>   drivers/gpu/drm/msm/Makefile                       |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c     | 537 +++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h     |  25 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 341 +++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  43 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  50 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  74 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  43 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  21 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  23 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  23 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 371 +++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 132 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   3 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   6 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  10 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.c                | 176 ++++-
>   drivers/gpu/drm/msm/dp/dp_catalog.h                |  97 ++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 839 ++++++++++++++-------
>   drivers/gpu/drm/msm/dp/dp_display.c                |  61 +-
>   drivers/gpu/drm/msm/dp/dp_link.c                   |  29 +-
>   drivers/gpu/drm/msm/dp/dp_panel.c                  | 749 +++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_panel.h                  |  67 +-
>   drivers/gpu/drm/msm/dp/dp_reg.h                    |  40 +-
>   drivers/gpu/drm/msm/dsi/dsi.c                      |   3 +-
>   drivers/gpu/drm/msm/dsi/dsi.h                      |   3 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c                 |  14 +-
>   drivers/gpu/drm/msm/msm_drv.h                      | 113 ++-
>   32 files changed, 3429 insertions(+), 497 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 

-- 
With best wishes
Dmitry

