Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31E741F504
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 20:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA6A6EEB0;
	Fri,  1 Oct 2021 18:34:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2982E6EEA4
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 18:34:57 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id i4so42641816lfv.4
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h17+SHB1hF/idn3CZToPuuO5Jqa52mgDL9LaLqNP76k=;
 b=XvZPJRVapHhXbnvxBH+dcTzSWQUb8QLF1Nvs1pcRhCxBeMs5Xcc3SYxz0PJk9MSVwB
 RO++xnwZyTvuSnUUevpLJg3QzOphbUQYQMzIEN8ZdDC/pBg7emCqlUyytJKci3smdWEz
 PGKQDIfcwTqn5uHKORxQ95mAv2mamNG7R4cbKDhOgNlMOni5vMR6VfkgZNz3f+w9r6LP
 RM5PrO44K4PTReIsJatKfc6ou546JK1Y/09aVpYq2fo16JNjbJ30np/Do4fvwBpz7Nls
 NnJBkqXWOyTByxBLP2U0JC6UhBtJUhfb9XBQKV7BuC/NtZW4K+K44hAwVBC/VzyF8UqV
 abdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h17+SHB1hF/idn3CZToPuuO5Jqa52mgDL9LaLqNP76k=;
 b=hJUPl166fLKJc28ZCw8CBPgNkiazrcf5ikmH4UNnG2kZMUWRaP7gHJ5OdcSiLYeKQd
 NzZUYccnyK/kFi6IH/RRy4xvIy1DFxDppRNVi19+teL8pxDoUFm5RT/jsn4w8P+66LqU
 ddR+7HtJdG69GrpEhAPLfUT+CJV9613Nbt7+ggzpRInfuczluHCMCyyG7FVa00iY64G4
 W8etIsJ13MT3jWoe8/92bOgMzEbaaGFIFk/9Ns/gm9J57hrmv1pvZNOIfLKgM7yY/Sum
 KXDRjXaZNeJXLYHVEBBrYPwfSEwa6PRXW4RBkGDJfFGkKR+YRetCRgD2is4XKogvRumk
 xJ8Q==
X-Gm-Message-State: AOAM532MIkTxnEx02meFKg/N3X+uYy/nfkujbabfxmYiwCaN4W64lfJi
 twaQ93bPEpMNOJ37YjtHKVGqoA==
X-Google-Smtp-Source: ABdhPJxAGb0vHrSPSZ+MiRYmStYTxz0nB8m1aCFfXoEXCgOVViaEkeSdPPdoKSd77/QxRlbcQSx0UQ==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr12844230ljn.35.1633113295365; 
 Fri, 01 Oct 2021 11:34:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p14sm809515lfa.299.2021.10.01.11.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 11:34:54 -0700 (PDT)
To: Colin King <colin.king@canonical.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210929121857.213922-1-colin.king@canonical.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c9a68b02-d9b6-e779-7659-2f92639e55b0@linaro.org>
Date: Fri, 1 Oct 2021 21:34:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929121857.213922-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix null pointer dereference on
 pointer edp
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

On 29/09/2021 15:18, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The initialization of pointer dev dereferences pointer edp before
> edp is null checked, so there is a potential null pointer deference
> issue. Fix this by only dereferencing edp after edp has been null
> checked.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: ab5b0107ccf3 ("drm/msm: Initial add eDP support in msm drm driver (v5)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/edp/edp_ctrl.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 4fb397ee7c84..fe1366b4c49f 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1116,7 +1116,7 @@ void msm_edp_ctrl_power(struct edp_ctrl *ctrl, bool on)
>   int msm_edp_ctrl_init(struct msm_edp *edp)
>   {
>   	struct edp_ctrl *ctrl = NULL;
> -	struct device *dev = &edp->pdev->dev;
> +	struct device *dev;
>   	int ret;
>   
>   	if (!edp) {
> @@ -1124,6 +1124,7 @@ int msm_edp_ctrl_init(struct msm_edp *edp)
>   		return -EINVAL;
>   	}
>   
> +	dev = &edp->pdev->dev;
>   	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>   	if (!ctrl)
>   		return -ENOMEM;
> 


-- 
With best wishes
Dmitry
