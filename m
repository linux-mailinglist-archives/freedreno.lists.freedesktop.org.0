Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8117F8022F7
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C7B10E293;
	Sun,  3 Dec 2023 11:28:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E460010E293
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:28:42 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9ef682264so12218921fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602921; x=1702207721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H7k/TcV4Cokn5QDPYijyDf1OwkI3RiXghan4g2PqQJc=;
 b=CDhM9+bQz75yEfT9Gl5y05AruSY2ZOI/f8yPtuy0GC/1k/6dOpLN1Z7bh1zwrOCI3p
 c4sDo5haAXWfWKJvr9L12xDW67HbRNuVVqPfTZ0qndt5Y9ilHJhiuwEraFVfbpFmtjnS
 nGjDp0TvV1JxafQUfkCLnO6wJhzI/2LLf6ccnN79WkjjN+ZYoL7tblU59bQibqeDhjBh
 omPaBnogZTYn9Wc3ojY8m7IWZF87LDKVS316TlSHw6Geplocp0W2/H2zbjc7f5k9zamc
 thqoBcwunfqc8zPAjpScVyiAUO2cfyrATssLXHuzORWJLtEG9dPLot1opw/9JVkt75nS
 gB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602921; x=1702207721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H7k/TcV4Cokn5QDPYijyDf1OwkI3RiXghan4g2PqQJc=;
 b=OqUed6yoE2nef4IWTdxuPO2ryqIw1ERSaZxl1djmM0Y7Dz2TME3EM3lkZbxIxX10Jz
 mS0VOW+kUM1FTC/iQzFpOjUVMSQG11u511jCjsyIYmDuvwnKtGbKHJnWQk2RwZ8V2WtM
 DwaY56kFjvk72zR7g0W/xCDd9CTnwdGkHqwMcwRaC2g9MF8j+U5SQeb7lPcZbSjbqu8R
 9DJZe9/QiNPCB9IFfKExiRjVS8ulbbDU7hpRk7zpK+IjbQ98e15HZPkmXFCib05wtK/b
 cblp5d0U42WQagCPLfYjXYaDKWIqZguambL6LqVNXzpU6MTboxUyh4+9j5DrS1+tLbJY
 0LHw==
X-Gm-Message-State: AOJu0Yy03P40VmdXT3Ba/rQDNDA9G0qe7Uq5P1hVkzGXEwpvdHRlGgu5
 TEj1Dmy+OItws4ryrlHWySFV4BByfl0j29YzdgP1iOiL
X-Google-Smtp-Source: AGHT+IGqFOCoj6Ejh31/xdT35ajIygeshLhzcKMzHS5YU2NmxWqCFUAgyHrCF7ifRWiANO1HUtNWBQ==
X-Received: by 2002:a2e:99d5:0:b0:2c9:e7ea:6d3b with SMTP id
 l21-20020a2e99d5000000b002c9e7ea6d3bmr1232579ljj.90.1701602921149; 
 Sun, 03 Dec 2023 03:28:41 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a39-20020a2ebea7000000b002c9f70a0419sm274718ljr.140.2023.12.03.03.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 03:28:40 -0800 (PST)
Message-ID: <ed17e7d1-c99d-45d9-a9ba-743ccc07961e@linaro.org>
Date: Sun, 3 Dec 2023 13:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231121003935.5868-1-robdclark@gmail.com>
 <20231121003935.5868-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231121003935.5868-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/7] drm/msm/gem: Remove "valid" tracking
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/11/2023 02:38, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This was a small optimization for pre-soft-pin userspace.  But mesa
> switched to soft-pin nearly 5yrs ago.  So lets drop the optimization
> and simplify the code.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gem.h        |  2 --
>   drivers/gpu/drm/msm/msm_gem_submit.c | 44 +++++-----------------------
>   2 files changed, 8 insertions(+), 38 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

