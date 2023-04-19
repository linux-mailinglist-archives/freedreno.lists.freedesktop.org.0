Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AADC6E8574
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 00:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A0A10E25A;
	Wed, 19 Apr 2023 22:59:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E2610E037
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 22:59:25 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ec817060cdso182630e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 15:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681945162; x=1684537162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RoGl/3B6GfMPb0+OCZT2tTJ+psffw8V5B1IJcxh8vQY=;
 b=UIkgmHulStgxhywgQpRdbGctzvlpKZ3CHU4MnFkS3B0eI9oFMP6jBf3A0W2LWge2Vx
 EChbdb7v6y4RLGMdvrAaGzqCWa53Of4HqXGSZiJqghqvbX7tZ5Siqdsc8YpCNlLMAavy
 SBu1ncrC8UiO3uWuOpqzWmaWX5Sr8+R1WTLEhlAJ5g06rwiBQWKpItA8ii+M7YoZk0hZ
 2qwujXfVP+m1d1RM62OTJXd/4yCiFvljiQ7G4UpzoYCWL3heQ9ytVCf6NgI2ccmap3P0
 ZVlF20XgB5T1lpcYDhl4hvzyhPB4D/IuW7BABUkCfowifuo4A1asXGuSQXyIvBzxXr/J
 k87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681945162; x=1684537162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RoGl/3B6GfMPb0+OCZT2tTJ+psffw8V5B1IJcxh8vQY=;
 b=ONwpPvO1flHY30hnGXZEA84Z/oHGTNWNBYQhgs9Oqh/rU9+wgntyzi8Z7HSuA3a3gq
 VqiReKNFlqmNGKDHSiPN+E34UJFY0py7kVcPvgGtvZML2sB21DgO5/w4IFXspLSBrFXE
 cwvWySeomPny2fchATppkOqtWgL/a+DtFV/9YJuQrbNX5eNYOyi0HAp9eQR8c21R2n/K
 iFGmkC2pREn8c7XAA4MRoqnOnl14NRzHKFwN/t1Yfz8ISbFQgTJaTwMgMMZ5Oq388hdN
 iMcMEigTsbZms/QdgynwULBYbw2+tfvh4/RfyNDgMmBBXpezP+9j6ni9aWtNh8Akfmnf
 GGUQ==
X-Gm-Message-State: AAQBX9faoqVFh/y5wgI5MusIvpqoReXEAsEX2nzNwXv7idziEjLqfelY
 ops+fC1p+CRd+ts2wtLMX3ivHMNFdK3DxAoTjQo=
X-Google-Smtp-Source: AKy350Z5bY9EO/mzqIlAunfW05lj83UpZeDqO6JngBwRxkpLMBRbcUuCe7r8UDB4wEBy5tHdDc0VvQ==
X-Received: by 2002:ac2:51b3:0:b0:4ec:a18e:f985 with SMTP id
 f19-20020ac251b3000000b004eca18ef985mr4584503lfk.13.1681945162548; 
 Wed, 19 Apr 2023 15:59:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r6-20020ac24d06000000b004edc22d27dasm31287lfi.230.2023.04.19.15.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 15:59:22 -0700 (PDT)
Message-ID: <280d6245-8980-10f5-cf2d-05555ca4a332@linaro.org>
Date: Thu, 20 Apr 2023 01:59:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-9-d1bac46db075@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-9-d1bac46db075@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 09/11] drm/msm/dpu: set max cursor width to
 512x512
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/04/2023 17:41, Arnaud Vrac wrote:
> Override the default max cursor size reported to userspace of 64x64.
> MSM8998 hw cursor planes support 512x512 size, and other chips use DMA
> SSPPs.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

