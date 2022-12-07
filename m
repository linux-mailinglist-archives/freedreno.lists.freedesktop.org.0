Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE2E64653D
	for <lists+freedreno@lfdr.de>; Thu,  8 Dec 2022 00:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B98310E426;
	Wed,  7 Dec 2022 23:40:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EF510E426
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 23:40:12 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id f16so10998454ljc.8
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 15:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HRIjdXMU+hROafjnkjje/sfB4GvhGqvX1pIwmIMOYUk=;
 b=dPjPWHoCRIzQn0lG6TQAzVpxAbwzqRKkircLaLGcGR3KSwbVfY+ncjEM5MjE1khSwC
 FUV+pA/AIVQrxDZhzfOqHsiDQo0IASpAFwtIbINKn3aukCKlXj8XZhVuAMQWdE0jMPDX
 dL3PM56uyqi+iPYCNNgerbwg955OPX3IV4hsSTR9PZwuFuZvtaBktFXDZZ9BYWz53SMr
 tkhUB6LYG/btRHDH+pOvMPyHQGhq834CJRQBBU/Cid0AujIVPstRVYP0GLTKehMrml8d
 Fq5TshjJ8MsBjAB3lZm+cfzLPl0kjo2jh9P+R3ozjdXM7byXWbbcbtpP4u6RgHCrFTr0
 MQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HRIjdXMU+hROafjnkjje/sfB4GvhGqvX1pIwmIMOYUk=;
 b=FkbJhEfhLylQj0RPASjakrNEaOuxSllgfcZGvcD3xWmGl/yrmUWpfVuReCDEGfzOQB
 MGgyPKHvgqm63k/R3WvJtNYsYFVfpgbvK9VQTes4FfSgVXfysNruNTjaqYeEaECHi4HR
 fYn2Hf7yPTtHYqGR5axeyCKz4eLMYGbiVD7kXWfJfcwTkq2g35coKEcmuPyJVsiMp/wy
 phnRQHK+84KghFZGt5JvLwqNScMPcMjQkVlAKERAcUk4sR22WC8KuGE3CYPUP4HK6HaX
 WYF9O++Qz4kF0+aY2lvRxwHDWxmyqK1LpmcuM0KbBnOKpleWn+oFvWchDZYkgledEvYM
 QBWQ==
X-Gm-Message-State: ANoB5pl2o8CVN1Ork9667NmzFYBtjyJ1WcXyKa5UYVc5QduwO9Gb/HJy
 87UApMbR91LAoWNLVia5sEGlTg==
X-Google-Smtp-Source: AA0mqf5iKdnHu+jtm6Nr4bgVmFnKseN07NPJyrAwVWJGzXVOiMrlJzGxcHf1l6Gy4PZqkTPotl6qFg==
X-Received: by 2002:a05:651c:b26:b0:277:9847:286a with SMTP id
 b38-20020a05651c0b2600b002779847286amr22932017ljr.309.1670456410638; 
 Wed, 07 Dec 2022 15:40:10 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j21-20020ac253b5000000b0049c29292250sm3030149lfh.149.2022.12.07.15.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 15:40:10 -0800 (PST)
Message-ID: <bf820a39-2c04-67b1-1275-71b465e53055@linaro.org>
Date: Thu, 8 Dec 2022 01:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-5-robert.foss@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221205163754.221139-5-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 04/11] drm/msm/dpu: Add support for SM8350
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/12/2022 18:37, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-dpu", for the display processing unit
> used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

