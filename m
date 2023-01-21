Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52167651D
	for <lists+freedreno@lfdr.de>; Sat, 21 Jan 2023 09:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F2510E16C;
	Sat, 21 Jan 2023 08:42:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C3010E183
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 08:42:05 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id o7so7983982ljj.8
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rtcfHZAR7Ysq5XNRm/jCy3LiiJsqdTUfh0gGDYHtMjI=;
 b=ttPttT4fXeRLAIGUhnlOd/e1nfyPSbx1mjkJhmM+Nxee/NpQkGX06mVqwSY0Hh9Xkn
 DrQQ7z8exjG3ZzZdRqG/CdbF1QxliQh0pkb/uPp3kWuhNSeAKoSrTsHAagWkTgvUd68V
 WnPtqsXV9LNksxGoISAYyl3siHpFd0QjyDmyc2dkHHxhBGAlo3KBv4xRSEfcqS13p9CZ
 MayPk2HmayTK9apWRtZ6KDk+4MnVGtEM4xWbFePfLOWOlufpHsGV4xKWClSrrM27RrH3
 EDdFDFd5s5N4miDsmrQNlVNM5Aj8WCnr2ecetSq0XSRdv4cOWzh93aT3+cLJfbo4kNdW
 kBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rtcfHZAR7Ysq5XNRm/jCy3LiiJsqdTUfh0gGDYHtMjI=;
 b=sGVfpELmKqLJhj6Ljg6ES4H8FQYW1c1W9cCmUIg+CS6HBhkayJI+9XPNGkGBEop9pW
 03h/I67amCJkC6SY6nFK8w9WpEzDyMH1r+1RSi3fWwTV/opTx2ASJR+Q02SuWi+xlIIs
 YWVjfynw2Zh1WZ9KwNPgBBjr26vVDmMu6BO0oPjnn6grZQW8Duw0o8nU3mRZyvRpXwgU
 ARxaBjeioRVcWIThdQ9ajeivB/0pm1dT566sJ0eAFJ7BV9XM6JPqkY4UQsaq1w0nyWyW
 tu49X6JGedzKlfdtmmmOflwJX42iANQ91yLHVFiaalfX0gCtyl/HtQ9og7mpyI1OO84W
 c1GQ==
X-Gm-Message-State: AFqh2kq2Izq/96yZgpwcJPeRzNn1eZTh37F6BuRChC7/Yd2ZVV4pYjYf
 4ALg1FZhiY3UWmHAhOfXrihD3Q==
X-Google-Smtp-Source: AMrXdXsbtbF+q/skX2lYOVrY6nCebNMS9fJNREzP8Yx1fO97MiS2zdHfmNzBb36aUjgFxzyI/n2Y8A==
X-Received: by 2002:a05:651c:81:b0:27f:d5c6:f4f with SMTP id
 1-20020a05651c008100b0027fd5c60f4fmr4446567ljq.29.1674290523906; 
 Sat, 21 Jan 2023 00:42:03 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a2ea269000000b0027fc14cdfa5sm2553634ljm.42.2023.01.21.00.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:42:03 -0800 (PST)
Message-ID: <f665b62f-d5c7-d02a-d775-434c4445ad86@linaro.org>
Date: Sat, 21 Jan 2023 10:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/8] drm/msm/dsi: Allow 2 CTRLs on v2.5.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/01/2023 23:00, Konrad Dybcio wrote:
> v2.5.0 support was originally added for SC7280, but this hw is also
> present on SM8350, which has one more DSI host. Bump up the dsi count
> and fill in the register of the secondary host to allow it to probe.
> 
> This should not have any adverse effects on SC7280, as the secondary
> CTRL will only be touched if it's defined, anyway.
> 
> Fixes: 65c391b31994 ("drm/msm/dsi: Add DSI support for SC7280")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

