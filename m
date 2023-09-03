Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD0790F0C
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 00:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14B010E259;
	Sun,  3 Sep 2023 22:39:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9F810E255
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 22:39:06 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so9850755e9.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 15:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780744; x=1694385544; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FCW5fhzFPO36VkzYsA4ot6wHveFpsnR8+rOVU4lQ1Wc=;
 b=JWlo5y8dVjdNBQBRLxFXy/PNO9D/7hxYtbMdzDRl+XIhpuyMpDo1fk1lc8j7LToxxQ
 /DhNIxb8mlqX5dWu+xXl+okhgOGh22jcT7QS9On7ZwpnrxFX4l/0ky/t7bAT7ZOPsUih
 c2rsh0U1wZkidnVNo27TwBk3+zty7LCIa4CLjdmZ/3t/+E1im6GJQYNNDEmaQP/ehmV+
 t1TjMeu803sXctmClBN+mpCPPDQYHQbtQTh9UOhmrGPwSDKiUee434QbfthgjlPHgL9A
 naJklLRUOMy1JJ8o2z4XgXhwYb50BjTR3h01DegqWEZ3IXra0nZ2Im4a6p+UD6ThC5FO
 SIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780744; x=1694385544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FCW5fhzFPO36VkzYsA4ot6wHveFpsnR8+rOVU4lQ1Wc=;
 b=AhN9Urxyu5RMjW+dsOxtDACaJpmtaUXaUXxToR5h0jAbM3XLc4Fu9B3rH/B0WOkWWD
 Asj2MHulvExLSJyHgoyOnnAVdquO5KKZTwVND3/uBDP8n8zmUbyUxOisOWdps4Ky52Ha
 ZwalV5JyH/jZMyCAIqYxdp+5K0ZCw+BheINastGW5TbrTUzLqKb9jGdZWU7iS1yJALZt
 2afgN06oz7MfAjyz5pMZmkFcpOK6hSSACKmhkOkqkZuCb3FxXL0TqFH8qgmuh3SokIY5
 +NKiPcX07saMW9ABBx3kmofZBd/R1uLJwCOWeXFcRT9bqvaI+/H7XFcucOfRSZHFVOcp
 l7VQ==
X-Gm-Message-State: AOJu0Ywk17u2vaejWuy3ShvGiUwcGbTqV66qVDP3EM8MaXOUYIqGjCSA
 dX2VD9rjAeIDJe/EAGaLOqUd+A==
X-Google-Smtp-Source: AGHT+IHC4LmuKmR0sAciVcZpljh/BF5lACIe0GOW90jgSls+WPgeE839R/LmWZIlDExfc1NZ5qUZvw==
X-Received: by 2002:a05:6000:1749:b0:31f:3cfd:c700 with SMTP id
 m9-20020a056000174900b0031f3cfdc700mr2629921wrf.32.1693780744491; 
 Sun, 03 Sep 2023 15:39:04 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:39:04 -0700 (PDT)
Message-ID: <db42e1b4-3ef7-4af9-80d2-23d84ec5f8dc@linaro.org>
Date: Mon, 4 Sep 2023 01:39:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-4-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-4-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/7] drm/msm/dp: Remove dead code related to
 downstream cap info
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
> We read the downstream port count and capability info but never use it
> anywhere. Remove 'ds_port_cnt' and 'ds_cap_info' and any associated code
> from this driver. Fold the check for 'dfp_present' into a call to
> drm_dp_is_branch() at the one place it is used to get rid of any member
> storage related to downstream ports.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 25 +++----------------------
>   drivers/gpu/drm/msm/dp/dp_panel.h |  6 ------
>   2 files changed, 3 insertions(+), 28 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

