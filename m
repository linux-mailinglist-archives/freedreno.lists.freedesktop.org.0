Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7107BE71B
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 18:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5476910E18E;
	Mon,  9 Oct 2023 16:57:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5903110E17B
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 16:57:53 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-504427aae4fso7118376e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696870671; x=1697475471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v4ilr7+Ii0ToMA97+lVnUxlCmyGDEQu3lXxCcYih3U4=;
 b=NbgOv1Q+7MhjkMGNZj2cYkBf93e58GRGIk8DI+dQSQeEenHzO2/R1rQ5d/0+mC45yd
 lO65mDyqUVr7uPuu0LB5Nv0qLIwrQISOTsQ6v5l1oMfqvk5RUvtkHS1Z4kPGetBWnzmo
 VLWV5sjq/ZmOoH0lV58yNCnTTcme/WYcgrHk2zU28iOo1kkg2gqTtWv7AqK97PgUszRV
 mcVJZQREqab6Jw7QisYIYetsyzThLvm1ciG/hvZdJzqpJdVQXJiCaXji1Tr0RARWB4f7
 kGG2Hwy8ujy0LiqQ5wt76JsgmLDHUbSKhStFtKLxBd9CoXPs/BxH7FfgNQHBP2+VrBRc
 CZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696870671; x=1697475471;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v4ilr7+Ii0ToMA97+lVnUxlCmyGDEQu3lXxCcYih3U4=;
 b=XwqtifjEkCEIvXj4iCD8HWxlWuCdp8x+ZIz1kc/oYeKd89z8eOBr6xBvj4E432Iluy
 BHd0tGLNt9Q2KVX3AItK4GuzL3wy7+ZttPLXk2LQq8QjQpuhxE4LmlUtgJyGO8jC0K3R
 fwcGjy1qSN5JM26bMFijZ75+tHMN5/MWJQjua0ahtUNW24I0VAjgM4G/Vtlm+hlZZNk1
 AHIwVV2/1Qu4R91uKMFqVHo2mqO2xSdZTn6zLNSGNvy4pEITsW+KN/aWyLZoWYMn8YAD
 leiTyEKATCIQgjm1CfcIN/oKc0r63mIS9gAzdgr+qTKN/BPKsdJRWdRaXjO04Ebm38oV
 Oq/A==
X-Gm-Message-State: AOJu0Yy/PAG8ga6LJOv50qE6/5sKHmOz+5b9imU4izQPSiU9UZBbiPHk
 kv1i2eebKTEWHOBmbBpFgx4/GvieJfWJogGF6PMp2g==
X-Google-Smtp-Source: AGHT+IFwJmsKn/WUgJqM2TLCE9a+ICJ+nX962Esuh3YK7V9GVQk/E/b+LB5Mvk9da1r9nlDr/KyWEw==
X-Received: by 2002:ac2:4da3:0:b0:4ff:9a91:6b73 with SMTP id
 h3-20020ac24da3000000b004ff9a916b73mr9544388lfe.17.1696870671536; 
 Mon, 09 Oct 2023 09:57:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a19a412000000b005047baf3385sm1488987lfc.181.2023.10.09.09.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 09:57:51 -0700 (PDT)
Message-ID: <8d586220-eb79-446a-b789-5a7131c7a2ad@linaro.org>
Date: Mon, 9 Oct 2023 19:57:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
 <20231009-topic-sm8550-graphics-sspp-split-clk-v1-1-806c0dee4e43@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-1-806c0dee4e43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC 1/5] drm/msm: dpu1: create a
 dpu_hw_clk_force_ctrl() helper
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

On 09/10/2023 19:36, Neil Armstrong wrote:
> Add an helper to setup the force clock control as it will
> be used in multiple HW files.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  | 23 +----------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  4 ++++
>   3 files changed, 26 insertions(+), 22 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

