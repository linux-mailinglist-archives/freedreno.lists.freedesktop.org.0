Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 519606FEAA7
	for <lists+freedreno@lfdr.de>; Thu, 11 May 2023 06:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F47B10E594;
	Thu, 11 May 2023 04:32:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F30E10E593
 for <freedreno@lists.freedesktop.org>; Thu, 11 May 2023 04:32:01 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f24ceae142so5671015e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 10 May 2023 21:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683779520; x=1686371520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yz+/Gk20g+rLGD9WBqQz3JvVt45c9RNumBRgkU0bdyw=;
 b=gXaNUXiuwI7hbz9s2Ih5JOmRAoysn7WWgyXgXOn17cS7pz3gBKZ0G2wBG44eqSIIh7
 KJ7uOFgLtJQHofIiVk53LUWZNa/W9Gr5scSprovNBmciGGuBlhQFSwRHEiOno2WaDyXZ
 tbRx5wljbAI1XKkxoE8HMgJg4j9BF0Uklh9O259CLVgLdZSJhkQRtHzvRy+/eocZMLMI
 uPefB/XQp7hG/E6GFaC7IvKS1TApdUMjPvBvPRBSf8ZIjM8Ns1uDQVMqpQSA9PMj03xE
 S8H+0CD2fgj6CYxnnUa5wuRUAVAgPqSyn1DP+aBVRctTX4+6GNmHr11/oHtF8VjaIZIf
 c/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683779520; x=1686371520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yz+/Gk20g+rLGD9WBqQz3JvVt45c9RNumBRgkU0bdyw=;
 b=Rr9gDQPFAXtFibNgNxfqhdWoeaudBTOkFl78wp3ZuDmVO5K86ZwzUkFUyf27B4BJMP
 vVBqU39SMVD4ZRVn5PVWDZcFjI08VWrHYzwrW1kNO03bKJ9oTxXACH9E4glwL1TWl7QO
 qorKicz6H/3KDGs7rSmsPAMQyCmP2h8ZUd/vB+ts2f8YmRgk6I23wwOil+fZHfFoPsvU
 jZ5jzHCO81sUZiGlWMB2N6EVj7RRvOEScFEMT35OHXu++2AlrCKeztjzjJ7civ3q8zrL
 kcPH5MqvU9IgHw3SXlNhNMDrNlsR7KO+Pv4AZIg79AwuzIx5Ex5b5Pkp3VrFg7DP5o8u
 WE9Q==
X-Gm-Message-State: AC+VfDxLfXowdcNuE6BdnBTK70pP2/Nk77yrVGjhXNEABuAnyUjGdeAG
 hy2tLNJq4Cb5M7B/WzjIFGn0bQ==
X-Google-Smtp-Source: ACHHUZ7gmShjR3g56HV3TeLijQNuVXEg1vd+aF/vlRc2UFIDY5gqky/Jpf/uNjU1oWK+JIQC0IB9Mg==
X-Received: by 2002:ac2:54a8:0:b0:4ed:b842:3a99 with SMTP id
 w8-20020ac254a8000000b004edb8423a99mr2683287lfk.59.1683779513330; 
 Wed, 10 May 2023 21:31:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24259000000b004f13ca69dc8sm962020lfl.72.2023.05.10.21.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 21:31:52 -0700 (PDT)
Message-ID: <02797bdd-a292-5891-ce73-8a174d62ac7d@linaro.org>
Date: Thu, 11 May 2023 07:31:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683756453-22050-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 3/8] drm/msm/dpu: test DPU_PINGPONG_DSC
 bit before assign DSC ops to PINGPONG
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
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/05/2023 01:07, Kuogee Hsieh wrote:
> DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
> both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
> executed to complete DSC configuration if DSC hardware block is present.
> Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
> to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.
> 
> changes in v6:
> -- split patches and keep the function file handles DPU_PINGPONG_DSC bit at this patch

Please correct me if I'm wrong, the overall suggestion was to have 
actual catalog changes before this patch. However I do not see this 
feature bit being enabled at all!

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 79e4576..e7f47a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -295,6 +295,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>   	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>   
> +	if (test_bit(DPU_PINGPONG_DSC, &features)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
> +
>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>   };

-- 
With best wishes
Dmitry

