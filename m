Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85876E8677
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 02:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6504210E626;
	Thu, 20 Apr 2023 00:27:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6B310E606
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 00:27:39 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8db10a5d4so1711181fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 17:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950457; x=1684542457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OU1rCmbsnDfe9dKvPIpfOrN+IqTHtV2jf/biLiJ0fYs=;
 b=G4Mes1dXfAYTPB206qmpfb4Z9sZeeViY1Jf2EJ7v4NUDzzTrA82OOpBVceE3grdo4e
 kRJYtkilz/Eah+ougyY9pWRNXecsUou7rxk8NcShaK2+pAV3LHOTLKnjYOuUHroG0QgY
 af1w4wMSLX7Qq64ocNaQuY3NHY50ml3INARjGyWEbu9ZBCu2LKJDKVx12kYErj4AZ4JU
 UTBzjyLrBQLC0Ag1GeaXyN1JNX4Ez3fBby7VITwrWOUqbRkql9YourX7tcVshakOiw32
 iq908ZTjJrB7gx4vhSCsO+5RSqQDVdpkg+mmfxmGYUj1FRgI0Hh0R9bna62mLBdm/ITt
 FA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950457; x=1684542457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OU1rCmbsnDfe9dKvPIpfOrN+IqTHtV2jf/biLiJ0fYs=;
 b=Xlem822JhGKYg1XSkw5ylg5mzKgWJyVKF7gwtXO2799Gm0ktl4Ufz4gmMT2nyRJPMJ
 GR2F7veB5M6UkI9flA++sp2+ewcbGDKlV6OSuk9PG+yhjj6AOURtOcYiPZ49WKJcromT
 5/le+fsO8bQdwScVpGHHQ6CHN2AllOCuQ7WhL0sYLN1hjOiA5NJU9mJ8+m5TH4hFLvWB
 z5ZjXcHAFvRDnd+z8jUc83dpQh1F7+x17efny2iHwZd0QwwG2+e2TTyuep9qaUNlhUuY
 zSeOojuBghDgZOAGIonSskaWymB5V+LvztH8gl1FwEt3zaSzE22F0Sz1Q2xWzmDtDjPe
 26Fg==
X-Gm-Message-State: AAQBX9fPBDDfQ4/aEoZKgKt07tlqVNPnxanfqg1MRGgMqEzjYj/d9YZa
 P3yMS7kfQnKacQSbpV+k5drg8Q==
X-Google-Smtp-Source: AKy350YdOiukgpi5MS1TnPwjknJUjmT3eL0beMikzCX//Uctsz9WnSPzKL6NA3VmCj2so0rTtRiGpw==
X-Received: by 2002:ac2:5e89:0:b0:4eb:d8d:6c14 with SMTP id
 b9-20020ac25e89000000b004eb0d8d6c14mr4353732lfq.11.1681950457626; 
 Wed, 19 Apr 2023 17:27:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a2e938f000000b002a8aadcf15bsm10510ljh.120.2023.04.19.17.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:27:37 -0700 (PDT)
Message-ID: <5dcdbd51-d30a-b62a-b231-b416b69af135@linaro.org>
Date: Thu, 20 Apr 2023 03:27:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-3-06fbdc1643c0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-3-06fbdc1643c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/5] drm/msm/mdss: Rename path references to
 mdp_path
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/04/2023 18:30, Konrad Dybcio wrote:
> The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
> CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
> calculated, but the latter one has static predefines spanning all SoCs.
> 
> In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
> the path-related struct members to include "mdp_".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

