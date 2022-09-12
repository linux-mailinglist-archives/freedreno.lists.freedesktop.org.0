Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118AA5B60F8
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 20:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C31010E137;
	Mon, 12 Sep 2022 18:33:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F1510E137
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 18:33:21 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id a14so9493386ljj.8
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 11:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6WHd2Lh5sHpqZ8XZXHBVfhtt4Zw7UCB2YjsqNgOeRTA=;
 b=HLFslW2Dtv+weTMBIE3BHt+Zkvg70tIfzYAwjzgIQuWIqn8L8wczywqrepcbkEquLF
 6tXsLRIzkPFsD2p5grAdny3PU+oml9CM5c/VuV6tfNqUttBZhFAloyUgt5cf9CgYJISV
 i8AE9GFEdgR2RYLkcjidnltxn+LEeoqzgwP6DOrNQTXRoEkzPbzzL1rV1wuldKjtTsq7
 MXrBwZR8HUMBnnEveSnfmrV0Wqn6bfvO3YySYvz5eGOg9Sa6uvZphbw9vN6V5AaKk8Dx
 yVCDeaiLZznyM/xi/7HoG5S0BBdo4CFRMFFInbOIqRDhVDyzIX+ynS1YagGzNlkEiOQV
 VgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6WHd2Lh5sHpqZ8XZXHBVfhtt4Zw7UCB2YjsqNgOeRTA=;
 b=cL0ulZFoxlF4AMJdHotPCQqpxB5MIp2+jJF5K8ICexcJKWEVE2hdnsDxQLsxLsxBgh
 IXVB/uk5sRgQ7i6kRRyqGBrAVsb/EzQxrkhC4RMkuHHsXfpCtL7bgRPcpremxtz/n9s6
 xLFgXfZesBMvexkDHun0GRrrowCR/FGJRTH5tgFdEuMkEwMBTmO/y4Btk/L+A3qpSdUF
 XPXN4qKW9eFOnjiQvDfLL+Ogn2sQDWiowdK8EfIrRoEfLnVa7rEA3NhRgYKFQtvRXbw7
 GMfYVtHx79nABjAzP634iVb6P6lUtr5Mx1vApXAdWWqK70em+e6MPINYxWHbqmF58fp+
 ttbg==
X-Gm-Message-State: ACgBeo28mPkIE5r3L9zUpEhQhsF707wch723znY5ac70nzkZ9OD43LQv
 yOT9doXg5ZjFEWiRIM/giScWKw==
X-Google-Smtp-Source: AA6agR6XhzOiep2TDtn0FWyDN6hmjubv1DF3PrAVGnrz4DgLT/fkJ5r5d4xePB2Be6IDiUtXarP2jA==
X-Received: by 2002:a2e:b8d6:0:b0:268:9b1d:5084 with SMTP id
 s22-20020a2eb8d6000000b002689b1d5084mr8266853ljp.37.1663007600193; 
 Mon, 12 Sep 2022 11:33:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 3-20020ac24823000000b00498ebd60c35sm1206811lft.165.2022.09.12.11.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 11:33:19 -0700 (PDT)
Message-ID: <f3083bc5-fd56-b017-5cdf-c72e730a987e@linaro.org>
Date: Mon, 12 Sep 2022 21:33:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220901203422.217-1-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220901203422.217-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 0/2] Add support for HDR color formats
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/09/2022 23:34, Jessica Zhang wrote:
> Add support for HDR color formats.
> 
> XR30 linear/compressed format has been validated with null_platform_test
> on SC7180, and P010 linear has been validated with plane_test (also on
> SC7180).

Are they supported on sdm845? On msm8998?

> 
> Jessica Zhang (2):
>    drm/msm/dpu: Add support for XR30 format
>    drm/msm/dpu: Add support for P010 format
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 24 ++++++++++++++++++-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  2 ++
>   3 files changed, 28 insertions(+), 1 deletion(-)
> 
> --
> 2.35.1
> 

-- 
With best wishes
Dmitry

