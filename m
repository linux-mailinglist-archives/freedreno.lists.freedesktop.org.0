Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA81C790F00
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 00:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C14A10E24F;
	Sun,  3 Sep 2023 22:37:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6E510E24F
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 22:37:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52a39a1c4d5so1068329a12.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780636; x=1694385436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JTU8KrO8RUU8FiWRZw+rl4K+4j0rOVVykAlc2x+Gur8=;
 b=nBd9hH6CDLNyUtBypKW8x03anF/EmjxdvGuYR6nuoBo1KVUIOL9Mv03tw9xJK3pW9J
 gaqOPObzcKs6E4nS1MYa4dxgpMKEq+swdxm5sp4P1UmiQiypN1oQJOzBNU1vuODzIf4H
 +bN44nWMDVFfPH1Mk/i4gGwb9gccF9h70d89hqphsEs3Lo0VIM00luBT2eHRXwREGAGs
 B507bDhzh2p95UU+b1uMo3QLo0HOeVcw8U2R3UOeMmVmcu15rCDIICLYsSO/qQzSLR0g
 SIn33Enkh2pddw5CG5K9SdkWQTY/HkoLCPFgf/pMngp6Kz0F++D6HM/ck5I1Rggrn+qA
 5+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780637; x=1694385437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTU8KrO8RUU8FiWRZw+rl4K+4j0rOVVykAlc2x+Gur8=;
 b=lrDndCRewy5iMpJeQxGCvPHFAzEaYqT0tsU1/HpBxG7PoufAmPDnaVgRIP56kbEVqv
 vCQxW9anI4fn5hIVf55tnnhzSwC8wxuAm77xrTFSrScIxNm8HYktK8OB8Zw6H8315yIc
 +xAMs8/kI1NzRiDNzT2xMPOsgNScKvNoL1ZC/EMR2jey9WCFHaljkqjFTbd2CznUFwTv
 QobmQ9f3gUp4piM43phmGUePeeSoIbJoDepC+NPmSwhPItebFhoUxgfHSEY/pf33P1qk
 F9TW+Je3Yr6V1TC+0z4v+tECEz3wG9hxnRGRP/O5vxR2xwwXfB908d0KPxHJTaEU6GPd
 f6Pg==
X-Gm-Message-State: AOJu0YybOVjBbvNldQW3/TVAYDlSTphHPPJY9DvHo9GG6dgTZGsq8HAE
 jMokFPzrri4/77BEKZFyIz0vGQ==
X-Google-Smtp-Source: AGHT+IH887EsApjxxqgeKDwZfphqZJP+92AGGLQhQH1W/cbewlBiwmTzV6SErfuj2s5lfRAgmYmXeg==
X-Received: by 2002:a50:ec90:0:b0:523:3e90:68b0 with SMTP id
 e16-20020a50ec90000000b005233e9068b0mr5378864edr.21.1693780636732; 
 Sun, 03 Sep 2023 15:37:16 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:37:16 -0700 (PDT)
Message-ID: <1c7b1397-de05-49f7-8e26-3244fbd1573f@linaro.org>
Date: Mon, 4 Sep 2023 01:37:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-2-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-2-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm/dp: Replace open-coded
 drm_dp_read_dpcd_caps()
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/08/2023 21:47, Stephen Boyd wrote:
> This function duplicates the common function drm_dp_read_dpcd_caps().
> The array of DPCD registers filled in is one size larger than the
> function takes, but from what I can tell that extra byte was never used.
> Resize the array and use the common function to reduce the code here.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 42 ++++---------------------------
>   drivers/gpu/drm/msm/dp/dp_panel.h |  4 +--
>   2 files changed, 6 insertions(+), 40 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

