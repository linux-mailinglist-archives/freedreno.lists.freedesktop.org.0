Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C406E84F4
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 00:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB1410E209;
	Wed, 19 Apr 2023 22:29:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD53510E209
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 22:29:52 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4ec8da7aaf8so173568e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681943389; x=1684535389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wnUl4IvxpgP8DkY6lfjFLZ6luteXP2ASmroly5c9qjE=;
 b=SVwdxp+ky5JCUki7oK2o+3teHHJGTjria6nO3FdyppdPh6sGN9dhZrv5INSHxitpRk
 r73OOLijhCJT6KrnnlBV8HjAg0Rg/GBv1r+h9UMDEvyuiLfObeWepVJawixYSD3X9d75
 btd9A0hRMZEMMRQPaFL1mNiobnx8l2JYVQSsyOL6eaLyCCL70ubRQjBkNE0AsN/vuHE+
 DJvHohseRM4hYivwEsPWF+LqDd4n7v+S3hW5J4GOI+C9yhac+fpwpx36r5c+6pdD7z9t
 JiJOZRYFmyK2Uk+nETA6TNGkBJVBG6SQN9htuf8Tr5trUwjsX1jLVK4jkNWB9OILP6xq
 D0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681943389; x=1684535389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wnUl4IvxpgP8DkY6lfjFLZ6luteXP2ASmroly5c9qjE=;
 b=HcnBYtLE5qbk+8AXwcMeXTn8wjbRmexpZDXJKw6dQYRDtgT0yg5Cg5HYdBaQuVjVa3
 ALnxabNOyR3cITKISNlQ2FjcyDQEEMxR0POzNsybfZBHU8Cm2+9O9wKiCH32Lj4DDhMA
 M+9hbrforqnC9P/B52yO1vYVpfXrPTwwUYwt9hiXzVQFdQBFTmIRKuC+qHDjtgIXXq58
 7J4Yr14zgE1mxZVqBXgcRpAxRK2/Fc/U16JrUoHO+mpEuQjglfjKf2A28A5Zf76LdYtL
 WyTnkPWfZAaDjFK1CH2p0+S2/L5mtk63VLjT9sWT7Zxnc1Ml8kUJgv66IjIigVmFa1pE
 z60g==
X-Gm-Message-State: AAQBX9fPbX3UKaq1JI3AMsQr+nISe46nJZRq8QSQBMIkvmoqkwG0lWpY
 3r8EdjV/Y4fOsPhF9nAtMbeksQ==
X-Google-Smtp-Source: AKy350bDD4XjwcvExRRoJ5+0NvZCFjjQslWtFy0JMnteMIx2R2h3N5mhLZ24ntxA7gFS31mWN13CoA==
X-Received: by 2002:a19:700f:0:b0:4dc:84dd:eb91 with SMTP id
 h15-20020a19700f000000b004dc84ddeb91mr3686733lfc.22.1681943389462; 
 Wed, 19 Apr 2023 15:29:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05651c00cd00b002a79c2e45b4sm2973260ljr.109.2023.04.19.15.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 15:29:49 -0700 (PDT)
Message-ID: <2ef93811-3716-a259-538c-08e7b5476f7d@linaro.org>
Date: Thu, 20 Apr 2023 01:29:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-3-d1bac46db075@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-3-d1bac46db075@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 03/11] drm/msm/dpu: use hsync/vsync polarity
 set by the encoder
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
> Do not override the hsync/vsync polarity passed by the encoder when
> setting up intf timings. The same logic was used in both the encoder and
> intf code to set the DP and DSI polarities, so those interfaces are not
> impacted. However for HDMI, the polarities were overriden to static
> values based on the vertical resolution, instead of using the actual
> mode polarities.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 16 +++-------------
>   1 file changed, 3 insertions(+), 13 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a side note: I think at some point we should get rid of the override 
in dpu_encoder too and move it to dsi bridge code.

-- 
With best wishes
Dmitry

