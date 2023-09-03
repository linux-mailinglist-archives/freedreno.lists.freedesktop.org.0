Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A555A790F0D
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 00:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2BE10E255;
	Sun,  3 Sep 2023 22:39:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCADC10E25B
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 22:39:17 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52c9f1bd05dso1221200a12.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 15:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780756; x=1694385556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rJDVZGRXNPlbG+uW3nJBHU09g5j3lMYwRuZyrmz3c3s=;
 b=Yx6VjuHO5LPJT+lm1wLL+LUgDOH4t3MxsaVvM30kCJfBYEg86K0JSpu4gjPuLbQzhS
 Ej97BD3PdnCT1ww1m1ZNgHyxO4XYV2r5RPRa1lpW4+y8YZDR/t+lCD4xCADlX1/8TOup
 iO3EyRH+/ojTGXR+txXJafn7BPlGx+rBIMHPA8nru6OvFmQ7CcXdg6kch0LQUucxdzNv
 Q2FObxiHrxFRZefcm3y7r7YADayxD4DQzJRk2zKMChGrH1QlCgFWqmXgMiCV7wte38aX
 FyiANj8GxrevpJKu/GVSyLAdvx0g3YJFfWiqfT0yl+2EvD3qNMb91y6c4ErUPSUmWmTB
 4tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780756; x=1694385556;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rJDVZGRXNPlbG+uW3nJBHU09g5j3lMYwRuZyrmz3c3s=;
 b=cuQ6fiLirJtfhHONxk6wS8DSr4x0Sm6TSXaYiw9X3XRPQCzzcKVVD3l0HeNhEGLSXt
 nvxAgkmfXP3hS9ybkjYlK+tFYdVH9wYMQp9YTBrmQ7P97wS7FpzhC16X0C2Vi46J+qI/
 ACTK4MDf4sZXaQ7bQeoZ4U4DCFEpBbSJHzLsV9TLOQD0TcXMkvTBON3Rt8XHqRs+GKjs
 CeKKYiP5fVXB5YPTuLqTDbqqKPQoK6r724isH9j1Us4IX19TjTppsq67PQyyjBBsEmTY
 BHzlPPKedy+TLI9zjakY+Huu/5P8yUT8bgkiOjqs0MauqyMDbE8qTxuiAZs4TUrUmUll
 c6XA==
X-Gm-Message-State: AOJu0YyETC8XTvYaVZpczC9eDDhzq4XD9BP6ZLcB5EK3UeonXjsELD7Z
 2uzTJGShGGf29JgDti6kIY8GsA==
X-Google-Smtp-Source: AGHT+IE8rdKKfRtiKAW4qUZx2CR6ApBgBWNohpTtDZ86s5LagIbmW/Z33cweCIm3MWR7p4a6suEfqA==
X-Received: by 2002:a50:ef1a:0:b0:523:6c47:56f8 with SMTP id
 m26-20020a50ef1a000000b005236c4756f8mr7429079eds.18.1693780756071; 
 Sun, 03 Sep 2023 15:39:16 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:39:15 -0700 (PDT)
Message-ID: <74f45f3a-d075-4911-8173-2ddf4ba74b02@linaro.org>
Date: Mon, 4 Sep 2023 01:39:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-5-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-5-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/dp: Remove aux_cfg_update_done
 and related code
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/08/2023 21:47, Stephen Boyd wrote:
> The member 'aux_cfg_update_done' is always false. This is dead code that
> never runs. Remove it.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 15 ---------------
>   1 file changed, 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

