Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A546858772E
	for <lists+freedreno@lfdr.de>; Tue,  2 Aug 2022 08:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46C91123A5;
	Tue,  2 Aug 2022 06:43:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030DC10E290
 for <freedreno@lists.freedesktop.org>; Tue,  2 Aug 2022 06:43:43 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id y23so4276141ljh.12
 for <freedreno@lists.freedesktop.org>; Mon, 01 Aug 2022 23:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=BsVVyC/Z22amNBasFSTwD0frJD17UKZEk4SMZVrNHIU=;
 b=LqsvxmpWorpzOIuC6m2PTfI3qLyPXcxYoD1BefdsAJ6zN/c+uRM/ZyBDVFvUHqVVr5
 PFUFNleauUP10jwKwGBZNxk41Ub+2rSxmhC2haoWEvstGEEkiwzM8oRPnPeRsimtAzz0
 vhS4Mfuf7qZJdQie6g5PllOUJnq4bEz+xirCMM6jEkTP8PwwhgTvFrCwFvBtf0KmP9sd
 DDYzSf1pbfk1bo5WoU0wIMw7UZTdStKO8lqRy2HCQtCcOGUQVo3Pxom7srF4W3BrfL89
 GezqyLAknkdh4kLyjB89ZUhQf459poH+NOmqn9si+pcdpduhWx9lnCRxsii7vx2+Nmsw
 uu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=BsVVyC/Z22amNBasFSTwD0frJD17UKZEk4SMZVrNHIU=;
 b=M3wu3opyt4qdHUF3rhnxnWWQ0qi72vmhs3HWVHhFgUYlV2NPn6gx56l4mxevSlVtSX
 HNqdvuNAcO4WlU+/MGUB8vT1lcBEzFwGkDG9gdZu0JCdQvkLq3AtTOwTbKLf222mm6+8
 IVXRAmTdSw5DB0cY/Vxopxr+I1if/kbQTOht/prfMLjp9mifQKvgh6aHGc3uSgvfdw1/
 CyiI88ken6o8CzgX1gbwi6Yeetez4+MgIo0yRww4GNiaNiPZPPqTjQ8yDxXV0sGLnkcv
 /3lOLJ6wLY8L+bN1QyXKRoXjaEO/qxMGvKDvgUgFQVOQg+tt67EPSoVGAzvfkkfeimS4
 J84Q==
X-Gm-Message-State: ACgBeo2P7x9PMZpQc1jnUa6VR+JXJvS8+Vjc+ukJ5sZyfJXBiDtYrTfJ
 Pgk8s3prB2NMMWH+WWMdXi4gjA==
X-Google-Smtp-Source: AA6agR5W1350TyooKgsucDtF4STvja5/ZEelSzPbU/uzlbpxtdSurx+SHUuqPhe1zxxlb5nMwyCsKg==
X-Received: by 2002:a2e:a370:0:b0:25e:502a:5308 with SMTP id
 i16-20020a2ea370000000b0025e502a5308mr2336327ljn.282.1659422622264; 
 Mon, 01 Aug 2022 23:43:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a056512201100b0048b08e25979sm199607lfb.199.2022.08.01.23.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 23:43:41 -0700 (PDT)
Message-ID: <bdf6abfe-89e3-80bb-6c5e-fcea713814e9@linaro.org>
Date: Tue, 2 Aug 2022 09:43:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1659384830-9909-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1659384830-9909-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: delete
 DP_RECOVERED_CLOCK_OUT_EN to fix tps4
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/08/2022 23:13, Kuogee Hsieh wrote:
> Data Symbols scrambled is required for tps4 at link training 2.
> Therefore SCRAMBLING_DISABLE bit should not be set for tps4 to
> work.
> RECOVERED_CLOCK_OUT_EN is for enable simple EYE test for jitter
> measurement with minimal equipment for embedded applications purpose
> and is not required to be set during normal operation.
> Current implementation always have RECOVERED_CLOCK_OUT_EN bit set
> which cause SCRAMBLING_DISABLE bit wrongly set at tps4 which prevent
> tps4 from working.
> This patch delete setting RECOVERED_CLOCK_OUT_EN to fix SCRAMBLING_DISABLE
> be wrongly set at tps4.

Minor nits, more likely concerning feature patches:
- Please insert blank lines between paragraphs, it makes commit message 
easier to read. And please add no extra line breaks if you do not intent 
to end the paragraph here.

- "This patch" is generally the frowned upon phrase (see 
Documentation/process/submitting-patches.rst)

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Changes in v2:
> -- fix Fixes tag
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index ab6aa13..013ca02 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1214,7 +1214,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>   	if (ret)
>   		return ret;
>   
> -	dp_ctrl_train_pattern_set(ctrl, pattern | DP_RECOVERED_CLOCK_OUT_EN);
> +	dp_ctrl_train_pattern_set(ctrl, pattern);
>   
>   	for (tries = 0; tries <= maximum_retries; tries++) {
>   		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);


-- 
With best wishes
Dmitry
