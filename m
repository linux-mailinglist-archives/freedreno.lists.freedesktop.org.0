Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173186D04F8
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 14:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69AD10E2EB;
	Thu, 30 Mar 2023 12:39:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58EE10E2EB
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 12:39:20 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c9so13898613lfb.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680179959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3R3nPD3qFWgilc9137SlJTFMh5JUV9k90a6EhVZUbfc=;
 b=VWgMfw5vMFuW9l6DTwdAhG8puqPhV6tLQpKUo7pdbDkHTwEDI+XontB3ocebEsfHbL
 l3VfyZQFkbAQqBLY1TAskq1hSyvA+S4PLw3Rt1YJgQKjyrwR0Wisdk5OW3ib66iklGmU
 vcYPPwmXNNX3dSmZ1Fl3Wpt9a87cF+HyAgyy3aoGhJD8gOhfhAf9vbELn0x+GPgqICjF
 1+1Zvj3nBiUeDmOK++X0DKD4v+/FtgZtSs5KfD7Vd2hZYg0K3Qt74uNjnVRLTxX1CGd/
 zZs6Ub9kfzt9M+uYHO8vmzq8+PAUb0AH2QJZ3t0o44E5PN8gLP50xcT/3bAOcg7B66TK
 Dbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3R3nPD3qFWgilc9137SlJTFMh5JUV9k90a6EhVZUbfc=;
 b=lg4J3Z5l2djITXzGDbYxaZbIDgRXM4JANL/MRLhetvUl52xQeEooFrJGZ6ZWTBRKUP
 DoLe/n7ZwXtqc8LbwJbXs6fchBDsG/ev2Rb1BmPR4TtAnNcbzTEwJ6lDOdUMe4Nwi4+f
 7FOShDwrMeIM9fLnlv/fmbBEIQJvw4KXYQMI8IOPO7jZwl2V7MPH9zO/xBe+Tx2Are4s
 s4YzlRxTPQtGBeLz1uS5nQctTVOxUWlJOWYfKVQkznzHz9geFrNPSNBV1Pl/JUwatTu0
 LO0HmRPi0+gy42D9hOq0uxWAcZQnr5KcZ6+Tk8d8w1AbuENNySikyB9kGWp1MF/tfVJH
 5oEw==
X-Gm-Message-State: AAQBX9fX1ph3L1jMb5dbz7hHw2Y1uVSLq2GtDTkoZRGTUXpwGAIrgoqq
 7oNowSyqGpYB7p0yHCYaL0S++A==
X-Google-Smtp-Source: AKy350bLpzKJFAnX7mIedg2RtMhZzL8xIMz5h26kAsbDhPqh6l/YDnnkZsD5R6IC+MCFkQxQ+FEZyg==
X-Received: by 2002:ac2:5699:0:b0:4e8:3bac:4e32 with SMTP id
 25-20020ac25699000000b004e83bac4e32mr6183124lfr.53.1680179958934; 
 Thu, 30 Mar 2023 05:39:18 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a19ee01000000b004eaf8b20014sm3436476lfb.76.2023.03.30.05.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:39:18 -0700 (PDT)
Message-ID: <e60607e3-8786-e4fe-f0fa-0851dbb53a3a@linaro.org>
Date: Thu, 30 Mar 2023 14:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v2,40/50] drm/msm/dpu: enable DSPP on sc8180x
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
There's only a single difference between 8150 and 8180:

qcom,sde-dspp-dither = <0x82c 0x00010007>;

is only present on the former. Not sure if it makes any difference.

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index c51e1bba1533..457733a6986e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.sspp = sm8150_sspp,
>  	.mixer_count = ARRAY_SIZE(sm8150_lm),
>  	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>  	.pingpong = sm8150_pp,
>  	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
