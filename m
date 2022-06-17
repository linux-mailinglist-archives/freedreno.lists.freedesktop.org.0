Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55D954FC99
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 19:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B6410E88D;
	Fri, 17 Jun 2022 17:58:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C865C10E86A
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 17:58:14 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id m25so5486958lji.11
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=97y9FHnzeeWIkKgO06WJA0gTF/gs2nCQs4ZuQLCUQGQ=;
 b=Y4RxzPZld0xkAgJZ8JaKKwJ4wykgLQERo91KdLt1BXFZnoabFRquIfIcTSRxFcsExX
 vWZdZ1ZtjKX3dwRGkf+QvUXi46mKGKp08/ZG3iw+oqYwGUv8oofc1rcNygrco9isjuLG
 PYiM2+Z1NnXFdiSFzNg+laZ05bnz2icaUJxvpR9+tsLy2dXOUTlU+Mm0MDESI3U+npVB
 Z5gu0kh8CFxauDVYpE7rjexvQPSCvRjZr2tnwPbcs5AjtUuT2/HQyhmrUtmJUw0E7x/e
 hwX8iSla5gggdYcuovtSL8OBENxrJDxqDBl/WHL6G0nAH3LOMEVCupwMJ1xM1f3MgsSy
 /V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=97y9FHnzeeWIkKgO06WJA0gTF/gs2nCQs4ZuQLCUQGQ=;
 b=pz7YS7Bc+wiJqE9FSMFHCeZj3fdjIwNpQbEHLPp/SfTqDVWuxbvupwENgbLZ5qNvkQ
 e4O7MMzNVyQZcEVzJdWE3JwasLjioeMEJxdZokAXNQ53A/kgsUy3yeBIP6O0Aew6MQI9
 uJRgWflNWTRNu1/JO1uxXtvATtNWhH0TGG5x3aeL8i+Knsgj11PYNXwOKce9uMxTl+yN
 dWKD9nFhZ8RZfAL6tP8yAIhAlLALSDQCCNqGMsaq9DBojUUHNOnilv0ZNHJF2MHLTSsC
 la3FSZPa0EkevHMgcL1kM0X/4DKXOP1VhRLCTdOUHQtZKSUB38bJRE3d8uRcMOXdh4OB
 gSsA==
X-Gm-Message-State: AJIora/QG9LJrFX6/Sr4qMPiDVfNwDXGK/9Kkl707QCU7B5uQg0yhpeR
 SWm0ebqEkvCqVpwz7Dc4/J0brg==
X-Google-Smtp-Source: AGRyM1tr5E28EjxazB6c9jBKbsNWgBfS102Co+7JJIF/zfX/fUG+4N6vDkYevs7R3YVB0zKgw2tMmQ==
X-Received: by 2002:a2e:9810:0:b0:255:6c06:1e74 with SMTP id
 a16-20020a2e9810000000b002556c061e74mr5632276ljj.279.1655488693159; 
 Fri, 17 Jun 2022 10:58:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a19dc58000000b0047255d21181sm711403lfj.176.2022.06.17.10.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 10:58:12 -0700 (PDT)
Message-ID: <f9b111ed-e1cd-685b-9428-d042c43e53bf@linaro.org>
Date: Fri, 17 Jun 2022 20:58:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655407606-21760-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655407606-21760-1-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: limit wb modes based on
 max_mixer_width
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/06/2022 22:26, Abhinav Kumar wrote:
> As explained in [1], using max_linewidth to limit the modes
> does not seem to remove 4K modes on chipsets such as
> sm8250 where the max_linewidth actually supports 4k.
> 
> This would have been alright if dual SSPP support was
> present but otherwise fails the per SSPP bandwidth check.
> 
> The ideal way to implement this would be to filter out
> the modes which will exceed the bandwidth check by computing
> it.
> 
> But this would be an exhaustive solution till we have
> dual SSPP support.
> 
> Let's instead use max_mixer_width to limit the modes.
> 
> max_mixer_width still remains 2560 on sm8250 so even if
> the max_linewidth is 4096, the only way 4k modes could have
> been supported is to have source split enabled on the SSPP.
> 
> Since source split support is not enabled yet in DPU driver,
> enforce max_mixer_width as the upper limit on the modes.
> 
> [1] https://patchwork.freedesktop.org/patch/489662/
> 
> Fixes: e67dcecda06f ("drm/msm/dpu: limit writeback modes according to max_linewidth")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
