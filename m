Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DFA90C893
	for <lists+freedreno@lfdr.de>; Tue, 18 Jun 2024 13:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46D010E630;
	Tue, 18 Jun 2024 11:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zlOXKRAo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261010E627
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 11:10:37 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so55351701fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709035; x=1719313835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/CamK4h0tVkXA5tm1M1BFkFYkjXyPGLjdWaiQdzsO90=;
 b=zlOXKRAo8zVeSknhjuuG0NBsB1flBDWGd0Figt0ZeFBuAptu7zOD6DjOxC3t6ctG0H
 nFx6I/BXKtorOVD+43NXL0IdxndIT5RGEoYD6AHir3+JjRn5suHU6LDkSxyo++ShGEfW
 LXcYkAaRHjl5cmzg/dQd5HG24+iMtKBeaxwJtC5eSpCCMTAtetxPqFzlm/rNjP3YWiM3
 WyG6rsh4A63kqwkUV+mrADOJkOi1kJ2zqE1DDy4xWXxkTyq4bDoU8TC+7n4IAViyB7hh
 mFBGz8U07fI7KTSLRjcd9PAopQ0GXxZ9kTvLbMeBFWvuHWtwP83jXP3JWoq+WpTUO47A
 +96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709035; x=1719313835;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/CamK4h0tVkXA5tm1M1BFkFYkjXyPGLjdWaiQdzsO90=;
 b=APGUe8n+lze2soaI6rXerD2/s04ooHUcSMrID4WH3vkbksezyt5kpLEsHjIOKJS+Fc
 vMReIUh3u1ExflgJ0xWPme/r/7SLR5Ki80rhd2BMgT/bXbgHJDn2gLZnRDADtFSc4890
 H/sOMebtwv/YCn5hM3RfxS8t+wN4KceDbWSopR0UMRayr1ErgiRAvoyPNtQxKqeE7mS/
 98rgmM7NrLQojT8MdXfkqmx2Hgham3cWPWp0Yy8bYXhjrxUEAg0eVFsfAb47EN5FXWiT
 yRa4GHze33fgjde47YQY8fZXrDs80mmox5LD+g2AdWswK8LFImq7GTfMr3UHqqBEKkoz
 slGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb8/Ek1oj6eS/Aq1dFlkKaMLdRrHuvLlo97MNPyFRlBxkpiRdNOnHowUVNlpaUBcqhvCxBPNEWgpgvfa1gtjhrzY+KBxbmEyFYYoYNdwgn
X-Gm-Message-State: AOJu0YxVV0ARUi/89lJx/GI1hpAJSpG/rqmQL8WYX/WYb1hyEefYbpu1
 aRbHOj9XTVskzLMZqn9Bh3xGZHmAKCrYSu6j7xZfyOe2hXTOzrnUv7FwBSrurpc=
X-Google-Smtp-Source: AGHT+IGXPsTBfIq7KgoZ+FjqKnXfQE7o5TjJhqwbSz0mtaVsqH0uGjATHX6jD/wxyZ6VImIIA0MtLg==
X-Received: by 2002:ac2:43ae:0:b0:52c:8a16:b085 with SMTP id
 2adb3069b0e04-52ca6e65542mr7104199e87.19.1718709035526; 
 Tue, 18 Jun 2024 04:10:35 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282569esm1480851e87.41.2024.06.18.04.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:10:35 -0700 (PDT)
Message-ID: <9d9cb645-b3dc-4081-859f-d2be981a696f@linaro.org>
Date: Tue, 18 Jun 2024 13:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/msm/adreno: Split catalog into separate files
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-3-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split each gen's gpu table into it's own file.  Only code-motion, no
> functional change.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
