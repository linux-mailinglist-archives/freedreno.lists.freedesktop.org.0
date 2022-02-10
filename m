Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5A4B0B06
	for <lists+freedreno@lfdr.de>; Thu, 10 Feb 2022 11:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C9210E7DC;
	Thu, 10 Feb 2022 10:39:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFA610E7EF
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 10:39:48 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bx31so7403134ljb.0
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 02:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uV6ErWvRHqjgOJVJNqpy2N27QhZ/SkH6lhneV2eezQE=;
 b=nKbcz2Gdq39piyfbPiMit7TrOu1sDICMWcR+0EmABFsSkx77n2YjUmhr9Oadftelnl
 nzyFf1sLKC1AWxptKuKsXPV9p1RmG+D6jQyD31hPB1kGkeMvwGndSrj/dfuJGfmhzuDY
 x7S9su9VVRlprEq876OXVw4utyS2H0wqlon8AG1vz+iAvf48UQJTXuAFcdGIJBA5on0Z
 DIGzgHX/3Kl+0fAUOe+dqph4GRG5mxn4T/P0Wca67iJEh4fWjf/jZ7MKOc/6LKZqW2UX
 NSqzOhzbWmjRiq5SG4CHSX1xrfFFVHM8mAgo+Tqxdx4SNMrAzC6Yv6jiXtWS1NgpyGsp
 OlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uV6ErWvRHqjgOJVJNqpy2N27QhZ/SkH6lhneV2eezQE=;
 b=PyX8+m8WwC23hxuIDR+xznqcaxEr36WINbu5mHJfzOT9chwLXxL60fg8y9Y3vCORDd
 s+ARmL25Fr3X+bDY/prZpg4nR80OXxVXI6QsQPlT0lqlcMQ4dreaYyAsZeBz2ef0f/CX
 KTuEEhtmaTCFqgvvcR4f0gPiCPf0VMpOH3R20RnQqgK8RhJvTUidtnmaiIae/4tzp8EL
 0hM2kGaT1t+Rj4h8s/mw8zwUfmYQui2VZxbmyOFnlj8cjbcpQlyG+upLysfBxuDcuRVO
 ZsEWUqO5P4TV9x+2m8W1o3Tvc/i4FYeLsoJL8Oml+a9vWh+ierBC9D7y8xAV22/MdKcg
 Cwsw==
X-Gm-Message-State: AOAM5336rI2LR/rUwoIdkc42Ht87Hu1ok+Xu6d5ygUj3gLhCr5BK+ji0
 7gHk+sSx5aMu1d5mcCDpZE6qog==
X-Google-Smtp-Source: ABdhPJzWQaQGUC9tOFhfWQgRhHoC89SI5cdC7nImJz2CXY8dRllDB4UDR090ZDdk+eOaZKSH3cgx9g==
X-Received: by 2002:a05:651c:54a:: with SMTP id
 q10mr4541444ljp.441.1644489586976; 
 Thu, 10 Feb 2022 02:39:46 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z22sm2754597lji.63.2022.02.10.02.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 02:39:46 -0800 (PST)
Message-ID: <88925781-ccca-b180-4d68-dbc689bd5184@linaro.org>
Date: Thu, 10 Feb 2022 13:39:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-10-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210103423.271016-10-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [REPOST PATCH v4 09/13] drm/msm: Add missing
 structure documentation
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2022 13:34, Vinod Koul wrote:
> Somehow documentation for dspp was missed, so add that
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e7a312edfe67..6425a42e997c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -102,6 +102,7 @@ enum msm_event_wait {
>    * @num_lm:       number of layer mixers used
>    * @num_enc:      number of compression encoder blocks used
>    * @num_intf:     number of interfaces the panel is mounted on
> + * @num_dspp:     number of dspp blocks used
>    */
>   struct msm_display_topology {
>   	u32 num_lm;


-- 
With best wishes
Dmitry
