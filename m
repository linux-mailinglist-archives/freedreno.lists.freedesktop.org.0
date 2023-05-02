Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBDE6F4BF2
	for <lists+freedreno@lfdr.de>; Tue,  2 May 2023 23:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A298610E0CA;
	Tue,  2 May 2023 21:17:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68A810E0CA
 for <freedreno@lists.freedesktop.org>; Tue,  2 May 2023 21:17:57 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so203323e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 May 2023 14:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683062276; x=1685654276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VwytHTjfZACxdHSL3LETW68YNRwzhMqZLENGdJTXawc=;
 b=uWWWOF4InCVUC8xXQ2dx/Fx7CqnKt1RywdYpOfgCCgnlbC4FP9IMebuPEXyfRfJD1L
 F1nfiY2IoswC/vc9Ucs+ijR/0kBG8abJmp7hUf9iDcJGrSf2VVeOCrJ2LdqgOFfeH8ZW
 hz/a5xSUAttmGKoAMb3EOuv8dI1Ks3HFXcjC9lzHkEVVQrrjFheBOgjZXxxJXIbn33/y
 taunr9MGGjfTS4jS7GQpNnrwW66S9URtMqK5fmPgu83QUSTsoIVvtMWYXmdZHmplS1HZ
 rz2v43DpNjfw6RMEJkbmNPo9E8YgKoaGiaQV5ZCQHNzXL8wtmofM24Co0JAyNoKosswg
 Cszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683062276; x=1685654276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VwytHTjfZACxdHSL3LETW68YNRwzhMqZLENGdJTXawc=;
 b=hecYKVyHM731Athe/tuTzdVArXdV4xWwtHBccAFA3k1HgeNpyP9EWdEu60HX03HPRQ
 9yy+nFc3FgbYn+ma1yt/9nWKjVcBoO2lXSCZQy2YSvQmxox6+HjCqyPu81q4ELA571Vl
 7PZnzdcxCLeu7X02IWBd+SGMAlgUjIE7svs8OzQj3+OAyPdI47pJ6aGPM5xJKzMOb6m1
 ZzMkGDY4YUfECf82Ua8QfMmIhm4QZw60d61EAjB5R+Zs4z0NsN2BJ2fP3Ain7Zt6GJaj
 X7oxiq5CrD/QGh3uJXsBz7PIC/NWy4QNfCikM6oCs/THrowSWyAvsxoZW2ZWUPEgcBwr
 dOjA==
X-Gm-Message-State: AC+VfDw+8AkBinV1DB4opTq2GtKAKqni8Pgj33iaFpflToxM9ot8Qhsv
 QQtZgYtDAmzhfJXQYLMEIk3jRA==
X-Google-Smtp-Source: ACHHUZ4NYrs2cp8G6oi0T4mSukhces7XxuwjRNl8ge+lY9H62LfBjLMzHsqPfLBoArQP7fHDVomd9A==
X-Received: by 2002:a05:6512:4008:b0:4e2:7ab6:15cd with SMTP id
 br8-20020a056512400800b004e27ab615cdmr288532lfb.30.1683062275812; 
 Tue, 02 May 2023 14:17:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w22-20020ac24436000000b004f012ac4aedsm2668700lfl.81.2023.05.02.14.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 14:17:55 -0700 (PDT)
Message-ID: <bb1412f9-9dac-7e6b-efe0-424a898b46e9@linaro.org>
Date: Wed, 3 May 2023 00:17:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683061382-32651-2-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/7] drm/msm/dpu: add dsc blocks for
 remaining chipsets in catalog
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/05/2023 00:02, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> There are some platforms has DSC blocks but it is not declared at catalog.
> For completeness, this patch adds DSC blocks for platforms which missed
> them.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  7 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 11 +++++++++++
>   2 files changed, 18 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

