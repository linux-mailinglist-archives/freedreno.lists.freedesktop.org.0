Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C936CC0AD
	for <lists+freedreno@lfdr.de>; Tue, 28 Mar 2023 15:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEDB10E7E4;
	Tue, 28 Mar 2023 13:25:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED0710E48D
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 13:25:26 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a21so5366371ljq.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680009924;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AtatUZ8zMgD/XQ1ZuMgdjShOsET7bYNRpq4MenkepiM=;
 b=YZxwemXUx0a8jxmJrQWJfX9wDWhvcZ128QSZYYHg2AWBI/PdEzm7KbHkiw+MZkSo+o
 kt/YYp5Su7wsBCQmesSyuFw8AC23S7iiFPZczkLY+aZlj2RPGp2Ry5klUQILeK+UW+VR
 oQJZfDtl/bXxP7cC1HWVbzoj9f8v8NSJrUSKZgZ5jpRseWegNYQJG08J2d8AWgX5KXby
 7VKcgz+BHaV1nPaGo23an6LaS0GD1ENQXcG44KYQnA1N8han3ToSd9pWg0qDV+jz0oP8
 KN77t2Dc0ckJH1EHG9V8wRr2tNJecbksvYjQnxQ6HYImoOdB9TCjzOXSi/rglOrlArJA
 AgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680009924;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AtatUZ8zMgD/XQ1ZuMgdjShOsET7bYNRpq4MenkepiM=;
 b=UdiFZtG88mKzV9T1a/Q/JghgwWgLgiAnpJRURU2Bn43WoEgKHsD+xf4O6ATJLtbU7P
 orMLbcs7bQT7P5zQtXj5bnH9aXfHmbZsir7i8cZyR74o8tJQ1cv3rfYlM9GZBx+m2UkT
 G/vvVKBW9Ws6tLRs9rrOk79zy4NWHZJikRp+C8khAtbeP8IS6HsTB63NgMgKhuL5flXA
 OarXxhQa5QG1/VaBjTkPDpbnJFDMn0qOytVm7SZLdMWWXr/g3e1PqDkQhn86hxX1mG/M
 Axq79oRdfeRljpVx21cjJQMCMBH31jskKaY9wCQZSPGSTbtrt3yN7FsKVAzdkCfPA/bJ
 k4oA==
X-Gm-Message-State: AAQBX9d0fNJ27g5VE16hxMJwtCpEgpEiKBT6iFScMpUJ5PGqX6o5S3E1
 uvWsIkQBToT1relhbZWJu2fxOw==
X-Google-Smtp-Source: AKy350ZP8pG5H47p7GqVZ5Gicx2oRFeRu5fXTXxAzE0CvqpcKIvp6gcMnnedqSA/hZENl+jG1kHWcg==
X-Received: by 2002:a2e:82d7:0:b0:298:9e64:c916 with SMTP id
 n23-20020a2e82d7000000b002989e64c916mr4428993ljh.17.1680009924615; 
 Tue, 28 Mar 2023 06:25:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056512040200b004dc807b904bsm5099510lfk.120.2023.03.28.06.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:25:24 -0700 (PDT)
Message-ID: <4aab8fb9-8da5-389b-bbd4-db9ae835e93c@linaro.org>
Date: Tue, 28 Mar 2023 16:25:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Leonard Lausen <leonard@lausen.nl>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Add support for AR30 format
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

On 21/03/2023 04:58, Leonard Lausen wrote:
> Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") enabled
> support for the 10-bit XR30 color format but missed enabling support for the
> corresponding per-pixel alpha-blending AR30 color format.
> 
> Declaring only XR30 but not AR30 color format support can trigger bugs in
> userspace. KDE KWin compositor versions prior to 5.27.3 for example prefer
> 10-bit color formats, rendering a 1cm^2 black box around the cursor due to
> missing per-pixel alpha-blending.
> 
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 11 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  1 +
>   3 files changed, 14 insertions(+)

Your patch doesn't apply as all tabs seems to be expanded to spaces. I 
have fixed this while applying as not to delay it further. Please use 
git-send-email when sending further patches.

-- 
With best wishes
Dmitry

