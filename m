Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB968667F68
	for <lists+freedreno@lfdr.de>; Thu, 12 Jan 2023 20:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0810E1B8;
	Thu, 12 Jan 2023 19:36:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EED10E1B8
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 19:36:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m6so29898322lfj.11
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 11:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QP7ZDXy/vz6h2E8Aw8jzhMKk5b2tVMVMs8kkY7DjRxg=;
 b=VRa1lYmLZwBt9u8EhEFY9jOztdyhUc0rbhIsKErJjegBmGKvqae+ioHuWXiDv8ojQs
 VlENQvWkzosriREEEtozgXWWfl2TYj+fITtabr02X4YmTjsxazE8spp0ZSVPe17AF+0X
 Kf++ghoP05TZk5uCbVqQ4pz8Ihs3X6acl8/V2BC9zwxAM7bcjHXKeSHrYOXCD3wmXeZX
 L4vzc9sup3I3A+2RRNz29LyV3BXZWW9cdvn1IgEczE5Hsv/XyXDC0rNvAl0kQsgdRV8O
 2fpL+QlmoVN5qFyfEgD9on8glRvlVvMVbwnRpaFg9M06xeZiV+rObea1NNJzF+hKYPgZ
 n4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QP7ZDXy/vz6h2E8Aw8jzhMKk5b2tVMVMs8kkY7DjRxg=;
 b=uJjdHgL3zQaXkZ9Au6fJ0db/8RCXG9KMT32Mdv9XrfDBrsz5Z/Sdu4a9UqiGckYWV0
 usCUYI3+R6I9L5G40B3okXpedBhDC4zTJKttZnwBajCDfutXXHsHdB4VF7VOmt478ka5
 lhfEJaOBiuC3FTHwrpgz2RFyN/dr6y/ElS/STjUd9T35x0oPa2qMtB3Mz99L3DwOwkDn
 vsYnsucdMvosb8mDUBEmZuSHPn0sn97MGB0Ir4utMHas8ssdlIwkuBIWjQmyV9hJreC+
 zt/E/tOyqBuyQeRm61i5E8DMq0x4z8QP16M5z65B+ITo0XK7zm1XzeXNqiCu8uK6Cswq
 9bLg==
X-Gm-Message-State: AFqh2ko9SCTBRXT8BIBRPL6Z98j/E2SWPtpeSzCQSgUPdg21OQXK6ESs
 ISCcbEnLF1ylrH9vrEnMls6i0A==
X-Google-Smtp-Source: AMrXdXuCP2iZ9ad22QlH8IWK4c8i8Rc8dMqOQZuciPiR9xdgK9SnFECFIPl7JvZMmqyyu5q35RCHjw==
X-Received: by 2002:a05:6512:33c4:b0:4cc:53e2:5387 with SMTP id
 d4-20020a05651233c400b004cc53e25387mr10413221lfg.50.1673552189189; 
 Thu, 12 Jan 2023 11:36:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a05651210d100b004ab2cb8deb5sm3403247lfg.18.2023.01.12.11.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 11:36:28 -0800 (PST)
Message-ID: <790207ad-9184-577a-ed0f-55e04b26aa09@linaro.org>
Date: Thu, 12 Jan 2023 21:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
 <167330408778.609993.9217470869804308069.b4-ty@linaro.org>
In-Reply-To: <167330408778.609993.9217470869804308069.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 0/3] add color management support for the
 crtc
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/01/2023 01:43, Dmitry Baryshkov wrote:
> 
> On Mon, 21 Nov 2022 01:08:12 -0800, Kalyan Thota wrote:
>> Add color management support for the crtc provided there are
>> enough dspps that can be allocated from the catalog
>>
>> Kalyan Thota (3):
>>    drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
>>    drm/msm/disp/dpu1: add helper to know if display is builtin
>>    drm/msm/disp/dpu1: add color management support for the crtc
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/a4d6f8253645
> [2/3] drm/msm/disp/dpu1: add helper to know if display is builtin
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/4cb6b1eebb92
> [3/3] drm/msm/disp/dpu1: add color management support for the crtc
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/c48c475bd75a

These patches break sc7180 in a bad way, as the SoC is short on SSPP 
units. I'm going to carve these patches out and wait for better solution 
for the color management issue.

> 
> Best regards,

-- 
With best wishes
Dmitry

