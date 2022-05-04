Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39432519740
	for <lists+freedreno@lfdr.de>; Wed,  4 May 2022 08:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00A910FB6E;
	Wed,  4 May 2022 06:12:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B2E10FB6E
 for <freedreno@lists.freedesktop.org>; Wed,  4 May 2022 06:12:54 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x17so606724lfa.10
 for <freedreno@lists.freedesktop.org>; Tue, 03 May 2022 23:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2tuqEYU8OdIQxZ+rdModr4KYTKneYsLdEMUMbVDbBTk=;
 b=BWUeIlVpukCSflMHB1tgYceEosqVc9oe/jVXzIYsrusbl87pNjhYnDjv9qEL0oLhwn
 aa5UjM1m72/z0Hga1RJHxiWZAKJqXW7wF3rMzST8CqwYHbsHDVJmbnoWbRlJOuZlx6tU
 ySVvgdDG7ZICzvh3u7mvZrki7RSf7Jlvyp9n+9KOD688mckez/KQg0eVURkS5L/boK+e
 IbT0Ut7YD4VLvL2Hh6VnoxQu4td6H/Fr3wJXIwAUC0p64RQorCh9AzQc5A4aFkxjWj4X
 zV3ANrN2TxFoRJ8c3bWK+NaiHY6YqPwSlTVWKpnmiPXr/oEYIm7X6CGb+/md6PS/104Z
 VzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2tuqEYU8OdIQxZ+rdModr4KYTKneYsLdEMUMbVDbBTk=;
 b=ZgttjUlMwrHC+rw2NfrAdyRLjhCZpNEcbo1QGYvs89Ujt/Pwp1REo7MUydYwyN/+w8
 nKEyKXldBOPsfcgtQucZTYLxKgX6PUgagfYcbkLte6I3Eivk9cQpCgzEDYjiYC/GHbuc
 wV8KunRAPVdtMA2ZV3Ifm1+7YPb/gLiJuYwyDEVs1JwBr3fkOmDnFltN/dRP8sONGvA0
 iOr5EeTm4fIl9/wwojFwyAyoK13+qF8OgCtbVu8BUaCb/2vaKDAXMud++o3/UdUgQY4d
 52xkQs1TpH7Dp3xR8yKl9+Gop1v74l/Z+fxAaOy7q588C/Hchdn6IZv0bSQGOgnN7MFc
 BHoA==
X-Gm-Message-State: AOAM530VRYFBfcqLIubsCXQLx/RjXghIfXey39wS4qB6xDeQKq20L8mJ
 hHV/VDCoU3GBjf/7aoCciM5QsQ==
X-Google-Smtp-Source: ABdhPJwS/7njQpo3DbfyMqUKtFd3wGDymfnni39lsDf6ApW3pU5xpDjIEk2egMPRoKYUqDcviFdi4w==
X-Received: by 2002:a05:6512:118b:b0:46b:a9ae:3a3b with SMTP id
 g11-20020a056512118b00b0046ba9ae3a3bmr13477930lfr.188.1651644772957; 
 Tue, 03 May 2022 23:12:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac25303000000b0047255d210f9sm1119231lfh.40.2022.05.03.23.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 23:12:52 -0700 (PDT)
Message-ID: <031fccd7-0082-8284-967d-285525a64394@linaro.org>
Date: Wed, 4 May 2022 09:12:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm: Document that power requirements for
 DP AUX transfers
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
Cc: Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Imre Deak <imre.deak@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/05/2022 02:21, Douglas Anderson wrote:
> When doing DP AUX transfers there are two actors that need to be
> powered in order for the DP AUX transfer to work: the DP source and
> the DP sync.

Nit: sink

> Commit bacbab58f09d ("drm: Mention the power state
> requirement on side-channel operations") added some documentation
> saying that the DP source is required to power itself up (if needed)
> to do AUX transfers. However, that commit doesn't talk anything about
> the DP sink.
> 
> For full fledged DP the sink isn't really a problem. It's expected
> that if an external DP monitor isn't plugged in that attempting to do
> AUX transfers won't work. It's also expected that if a DP monitor is
> plugged in (and thus asserting HPD) that it AUX transfers will work.

then

> 
> When we're looking at eDP, however, things are less obvious. Let's add
> some documentation about expectations. Here's what we'll say:
> 
> 1. We don't expect the DP AUX transfer function to power on an eDP
> panel. If an eDP panel is physically connected but powered off then it
> makes sense for the transfer to fail.
> 
> 2. We'll document that the official way to power on a panel is via the
> bridge chain, specifically by making sure that the panel's prepare
> function has been called (which is called by
> panel_bridge_pre_enable()). It's already specified in the kernel doc
> of drm_panel_prepare() that this is the way to power the panel on and
> also that after this call "it is possible to communicate with any
> integrated circuitry via a command bus."
> 
> 3. We'll also document that for code running in the panel driver
> itself that it is legal for the panel driver to power itself up
> however it wants (it doesn't need to officially call
> drm_panel_pre_enable()) and then it can do AUX bus transfers. This is
> currently the way that edp-panel works when it's running atop the DP
> AUX bus.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
>   include/drm/display/drm_dp_helper.h | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index dca40a045dd6..e5165b708a40 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -370,9 +370,17 @@ struct drm_dp_aux {
>   	 * helpers assume this is the case.
>   	 *
>   	 * Also note that this callback can be called no matter the
> -	 * state @dev is in. Drivers that need that device to be powered
> -	 * to perform this operation will first need to make sure it's
> -	 * been properly enabled.
> +	 * state @dev is in and also no matter what state the panel is
> +	 * in. It's expected:
> +	 * - If the @dev providing the AUX bus is currently unpowered then
> +	 *   it will power itself up for the transfer.
> +	 * - If we're on eDP and the panel is not in a state where it can
> +	 *   respond (it's not powered or it's in a low power state) then this
> +	 *   function will return an error (but not crash). Note that if a
> +	 *   panel driver is initiating a DP AUX transfer it may power itself
> +	 *   up however it wants. All other code should ensure that the
> +	 *   pre_enable() bridge chain (which eventually calls the panel
> +	 *   prepare function) has powered the panel.
>   	 */
>   	ssize_t (*transfer)(struct drm_dp_aux *aux,
>   			    struct drm_dp_aux_msg *msg);


-- 
With best wishes
Dmitry
