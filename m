Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3374E6F4C16
	for <lists+freedreno@lfdr.de>; Tue,  2 May 2023 23:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB3A10E105;
	Tue,  2 May 2023 21:21:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5E510E0E1
 for <freedreno@lists.freedesktop.org>; Tue,  2 May 2023 21:21:50 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2a8ba23a2abso43904641fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 02 May 2023 14:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683062509; x=1685654509;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wGbP6RM3R75eA3RnhHLQ4W06nOme0g1Ed3QvUzGLWq0=;
 b=Oqz1tTv7OVdAmsPsFQuYh79l0wo7ie+YsGt9Wuhk8ZZmKWFwnPeYt73iiW8dFY/6KN
 XOkPCB8YO1ktn7aEBlk5bD083ylewZW+HVjS6xqcCShkvLF3z2wo44ykkn/biLDtiBwf
 jNWcWwmvFLzOj28XzyoPshlKeywtZp3WErhkOsgeW3g9DkQxHHL/0MN/4Q2L9vNiIUv+
 fx/yVP6dtoelc4xjr2XrjCAIyppe1dsvxIQo9kPdMypu/rZO4+B9t2WpfSnqoKwBtwJs
 I8E6FmS3y8UBInZp8yvZafUB0oGaxlu9ZO/B5A8HG/IRBZ4uDEcGvWJ3b9dK2pX9/0TI
 IUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683062509; x=1685654509;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wGbP6RM3R75eA3RnhHLQ4W06nOme0g1Ed3QvUzGLWq0=;
 b=We4SaUI3zq0IJgXqWlSyLsCewUgzLV1qRmA/v8v3O/SB2u6tn7+fxah1iT0gSSddoi
 EYcgpw2P1REhUWHnLGRIDRHYNO13bFsm50HY1YltIcaVOFS/v0/mpel894NKKD2SUowT
 1+evN+VCUxqWHdu9vsFKUcrunOFRDGzGc/iNx3YOL7PSuDwVH9hfoU/680OBxBNfuj16
 XWFUPy8Ks1u2K+hMLb6STRxAeoLg4/1N3p88+3R0Isa8JT/HjGeaAacEY8kLKkeRVMz2
 eNnWkj87OKRWvoIABTUHt9ALS3rckntkQuLEvUwzWBzKHFiliUecBQ0Ep5OaqNExsZWM
 sLzw==
X-Gm-Message-State: AC+VfDwPT8jam4JunWzIFgmdWbRR0EyuzJ1J0KTM09ro3JaK6uiZMKLj
 Z49aLMvs5wOqprQJ6nHziUiUHA==
X-Google-Smtp-Source: ACHHUZ77AYKGrnUhyy85bE2JFop+7AXDKKij2MhhnC28fjOENsIP1ecIk/CW6bd+UDPm4j7do4xn8Q==
X-Received: by 2002:ac2:5199:0:b0:4eb:2643:c6c6 with SMTP id
 u25-20020ac25199000000b004eb2643c6c6mr320900lfi.53.1683062509021; 
 Tue, 02 May 2023 14:21:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c15-20020ac2530f000000b004efe7b2e35asm4880584lfh.248.2023.05.02.14.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 14:21:48 -0700 (PDT)
Message-ID: <ebd22101-16de-f754-9304-6ce0532394c8@linaro.org>
Date: Wed, 3 May 2023 00:21:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683061382-32651-5-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 4/7] drm/msm/dpu: add PINGPONG_NONE to
 disconnect DSC from PINGPONG
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/05/2023 00:02, Kuogee Hsieh wrote:
> During DSC setup, the crossbar mux need to be programmed to engage
> DSC to specified PINGPONG. Hence during tear down, the crossbar mux
> need to be reset to disengage DSC from PINGPONG. This patch add
> PINGPONG_NONE to serve as disable to reset crossbar mux.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  | 7 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 3 ++-
>   4 files changed, 6 insertions(+), 7 deletions(-)
-- 
With best wishes
Dmitry

