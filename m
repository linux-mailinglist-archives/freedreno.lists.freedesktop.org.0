Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783EC6CC0FD
	for <lists+freedreno@lfdr.de>; Tue, 28 Mar 2023 15:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093E010E815;
	Tue, 28 Mar 2023 13:32:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CD710E3F4
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 13:32:46 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a11so12565305lji.6
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680010364;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mOqMV4o6u91F7/3KqJairv0TeaA7yQYahdNMsdR21Qk=;
 b=ODJKFVGAQ5ucmVJh5o0Tx4M1IAr3qyyedClqSgC5KVO+sbg2MjSjiBbEO+v/HFxqRk
 NcpadSpeWNNiIrDDrCNsNhohHD+beRsh94E6R6cpf9D3rvzmQjaOsrcZylkRo06SlDru
 U0u3ISQe/GcZFfCURhWS3b5faxmO+N1mj2jclFsNU4owsU7W9IWOKoxQjXYLJHLACUqV
 rG4lJpBMw/JOC+1buE7rQGJFuoIaiLxa5eNAwJbpqHlkEfTf/BhMeTN+aEBmRdEZnCoZ
 oECXyySEqWFKL+x/nnR0LU2tuQukg86p0XXXL45KKCCMOL14W4r4JrP56c2ubo09Itk6
 opNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680010364;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mOqMV4o6u91F7/3KqJairv0TeaA7yQYahdNMsdR21Qk=;
 b=6hNaKjzMkKU+Y8tWeeEpiWNrj5HbgAt8ANQJRSh0xKkMeUdM6NjTQ1Gci68CtUawpB
 mQW7p2sMEuPfzgxuFqa3ZURCyy05b1XHWEiXn1pXM9bjiXx4pmiU2clSRdPH08hAGzP5
 k19CW6o2HxH5q4LN3onIHRw04+ZxKRc5kSiqSIgMDQDSaWMZ66iS+ZvcgBJ0TfatAIIG
 vUIbD2xp4N/Qk1aJmuSQ4FHsAE17UtVLbwcM4fjlWNRTY0E2u249R2kVcfpJanR9qkM+
 oaPr48tnFhaRmy9Ys2E5ZkBVksGamm7L3g8WD7rfiCpzdMT6Wzx1GSgQyEKXFrtyjTlA
 LRYw==
X-Gm-Message-State: AAQBX9c6oBPu1Lhl4u9eh6YH/Hw9molqx4ZRymJQLex4ZfctA21JOzS3
 jUMXCLG/uhGlNKE7oEYjh5vRmw==
X-Google-Smtp-Source: AKy350bNZnAibAjzuMet8+lBWu7+IZY1OLaMr4FzfyxXF8FwhF2Xr/Ng9GqSOa1UbgENlEzQcmH/9w==
X-Received: by 2002:a05:651c:446:b0:295:b0ed:ee8 with SMTP id
 g6-20020a05651c044600b00295b0ed0ee8mr5270401ljg.46.1680010364377; 
 Tue, 28 Mar 2023 06:32:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a2e8515000000b002a10b2ea089sm2622587lji.16.2023.03.28.06.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:32:44 -0700 (PDT)
Message-ID: <014e0cce-0bd8-fecd-f2ab-7086557c6fec@linaro.org>
Date: Tue, 28 Mar 2023 16:32:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
 <20230316161653.4106395-33-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230316161653.4106395-33-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 32/32] drm/msm/dpu: remove unused
 dpu_plane_validate_multirect_v2 function
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/03/2023 18:16, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> After cleaning up the older multirect support the function
> dpu_plane_validate_multirect_v2() is unused. Lets remove it.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [DB: also drop struct dpu_multirect_plane_states and R0/R1/R_MAX]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 118 ----------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  17 ----
>   2 files changed, 135 deletions(-)

For the sake of completeness:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

