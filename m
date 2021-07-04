Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F783BAC1A
	for <lists+freedreno@lfdr.de>; Sun,  4 Jul 2021 10:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B629E89C1E;
	Sun,  4 Jul 2021 08:25:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82C589B65
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jul 2021 08:25:46 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id r16so20125252ljk.9
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jul 2021 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mem7aDqrdPAoK1Q+h1MiWVWd2rSQrghSbzr5cmPA4tE=;
 b=T+e0XbVmuv9/j9Fjh+jIKG/WvWOhzEaVLBBiasfflltjEXdbclLUxmZe0Jykii0Awe
 jTOWnYhIY4OJT+q2po++qNMQ+corj1KESALoloz2MDyWCViHpttTamqGUb7NPbH+pQdC
 gWOFgtEoHCbknVjR8jx4bW0iUdhm8pGliOJlIJi/aZSh/cHNwvHAh3Rp3pea+MLo3ecN
 WLX2XuB1g2ZkRX2lCtH3cuyZ6tkNfkSKS2IW8tdVKmHkID57ixsBhnh1XTvZ2j+vehfj
 eXQiooSLrsJmBHy2vR9GbHy2PQhIlK5hoE+WdFPC46uJEbgYHz4AESQgaBC1gMsgtguM
 hW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mem7aDqrdPAoK1Q+h1MiWVWd2rSQrghSbzr5cmPA4tE=;
 b=rbbXuUfpyqw0gYMqBPEf7wl66Rj/R9/89uRk66TP9mkq5uHivq+z9nxasCqCd+qIhX
 JbqRif1SzkkhIZHB1HttBm+bIQlDfGFRLdaRe68icuBYjkuOIn49aehkB2u2VqdSMrKe
 +DD0Vcc1VmrwkdXJk9eqfNGTNCgDu4NEgR1CUJLTftj+rJWlytxHgBlcqWmNgps7NI2b
 xxjDF3g9pmuzRPegIEEhGJo8kVgUasZTGRjcd5HXJ49LOGRu+ZdrnTbPAIUqPAoQHUUU
 WI1K1mtgI6cRVFVEeiDPhlAOcWi9NLAsNFKLUXZtD0lZEM6B+nYSR8adQ1HQ2vZuXkWI
 fyYA==
X-Gm-Message-State: AOAM532QhiJXelKnbFHFgkjz8BEcmjqiZHTp0bz/f8w4+2S5opinpmRd
 iKX6sA2DQDHInFLb/AxaXD5lCg==
X-Google-Smtp-Source: ABdhPJy4nvOjyXAyQrOq0glZ90aFFBPgm0fiFPwTmBp3srbuOj7LS6n5pX1iTaiwSpzDGPyAnNIQZg==
X-Received: by 2002:a2e:9e18:: with SMTP id e24mr6692205ljk.336.1625387145132; 
 Sun, 04 Jul 2021 01:25:45 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f8sm737547lfu.188.2021.07.04.01.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 01:25:44 -0700 (PDT)
To: Kalyan Thota <kalyan_t@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <5dcd850a-280c-c356-32e5-35a4fe089f4e@linaro.org>
Date: Sun, 4 Jul 2021 11:25:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [RFC] Inline rotation support in dpu driver
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
Cc: mkrishn@codeaurora.org, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/07/2021 14:32, Kalyan Thota wrote:
> This change adds support for inline rotation in the dpu driver.
> When inline rotation is enabled the VIG pipes will directly fetch the image
> from memory in a rotated fashion
> 
> Inline rotation has following restrictions
> 1) Supported only with compressed formats

NV12, which is the only format you declare, is not compressed.

> 2) max pre rotated height is 1088
> 3) restrictions with downscaling ratio
> 
> Queries:
> 
> 1) Since inline rotation works for fewer pixel formats with specific modifier, how can we provide this information to the compositor so that
> chrome compositor can choose between overlaying or falling back to GPU. In the patch it fails in the atomic check.
> 
> 2) If a display composition fails in atomic check due to any of the restrictions in overlays
> can chrome compositor switch it back to the GPU and re trigger the commit ?
> 
> posting it as RFC as validation is not complete, please share early comments on this.
> 
> Kalyan Thota (1):
>    drm/msm/disp/dpu1: add support for inline rotation in dpu driver
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 47 +++++++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 20 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 93 ++++++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  2 +
>   4 files changed, 128 insertions(+), 34 deletions(-)
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
