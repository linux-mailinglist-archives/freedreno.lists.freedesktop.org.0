Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 275FD74A8F7
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 04:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F094110E4F4;
	Fri,  7 Jul 2023 02:25:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9DC10E4F9
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 02:25:29 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb41682472so1918866e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jul 2023 19:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688696727; x=1691288727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jHgEyu9CZyBrBeG2GC7gQptgx9XjV9u5c1TeFBnacRs=;
 b=v7tltTCVK4aWVGf5DUADwQglsWdehyx+QdctZeJPwg/pGcgJ9gMgKSZ24K88RPCWlG
 HTXfU6OFeiPzK504CKJjgZsYMfn4q5EyNSG9Ga5LUQvi0mw32J232eCcVd9Od2JVmQ75
 kgD3o8Wc0bL/hRIZaGlFXWBcWIsrJjJDqw9pFWddH2qzwL7kD4Zvxp7qzi8MBbk3knPc
 +2KwzQyNJ4MS+gKKHW7r0lOYl2DaoVPmLSWvP6IfNm59k96cy1DX7BVDD3Owcye9/VMk
 0v6VX+M1vTl29Zp9HW2i6mACPkQI7Ke4d8bjB765EITWISANnR5PbSiKVW4Me2CSPgeC
 41bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688696727; x=1691288727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jHgEyu9CZyBrBeG2GC7gQptgx9XjV9u5c1TeFBnacRs=;
 b=LglynQ7B8DfFCvQ2c6wzwKm2T9su65UNMQ4M/dCbKm1P0UU7XHwBIqHi/oOoKYMKLg
 uJTUL7v3vwDtuqS9CdjSlpQ7mkifDt/WgWvD+YJYfSrGu3V05IDrsZjkHicY1R5C06eY
 fzXhoyvIRyy62FSpxAZ+XHTwfvY9xwkIH9dccBkPFcZX7CX2yeeJIn91dXOEs9R2het2
 KMNr1AQEbDWE093L3502hPjvGuehTitA069SKMc7oZmZ85V/tTNseZsHK62qewfmnR6z
 eM7RN32JEzXcDlNmw9nVwyqvAtFjSUAWQDvvuA98co68nldG3Dp0jPZ1tBcNbF9uXSPi
 5jAA==
X-Gm-Message-State: ABy/qLZ2z+KfiLBgJL7Xwd1eUDQl0uciczuUnFtEg5jMYh4CwlHA8Xk+
 mOoo6swgSKv0iNKAXZ8jAdRCAA==
X-Google-Smtp-Source: APBJJlEBoEABsxONYJYKKzFMkqLmnqPTwQwBLF1OFSqAvXDp7dRrDXKVKdY2GO8FBJaH9KGS0HNvhg==
X-Received: by 2002:ac2:4894:0:b0:4fb:242:6dfa with SMTP id
 x20-20020ac24894000000b004fb02426dfamr3117808lfc.57.1688696727097; 
 Thu, 06 Jul 2023 19:25:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 er14-20020a05651248ce00b004facdf96283sm479843lfb.254.2023.07.06.19.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:25:26 -0700 (PDT)
Message-ID: <ac5a38c7-3d2f-1c16-2f74-c12683cd720c@linaro.org>
Date: Fri, 7 Jul 2023 05:25:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-5-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-5-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 04/12] drm/msm/adreno: Use quirk identify
 hw_apriv
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Rather than just open coding a list of gpu-id matches.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 3 +--
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
>   3 files changed, 6 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

