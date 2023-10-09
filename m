Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3747BE70E
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 18:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE95810E17B;
	Mon,  9 Oct 2023 16:56:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEA110E155
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 16:56:20 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bfed7c4e6dso53275041fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696870578; x=1697475378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WlhqBQl9oFMKzadsnusYrJDuDpk68abfiZiL1f4YOiY=;
 b=aQMdpJBfaq9V4xVzss4YqSDdCpfv8COa7cc43cLNa35HzIHeokz6YQFbZ9b1CZkb9J
 5S4AvXMZcMjexTvbqd8gnfz14rRe+xuV9NMmiwIRpsLqLZE1iC5O+OVnk3AfiRZ0nt1l
 zIIQvF6geiWFhJqxaWokMDwfbAd7ABFxYLtylMIg/u0bDH63Gd8Tmdy5PYJmcX9mdxST
 nGO1jWhNfLpBlF7oea8Cl95s6t/9g2C7zk0LVp+8bye13R31Tyu31DPkjgpkN/HNtwj/
 4UloKATHZ6dNZ9aBRz0zfkERe3WnlfgqJWAqw05dUtKOu4XbPam1jUP6a0IwesijHcLa
 XUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696870578; x=1697475378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WlhqBQl9oFMKzadsnusYrJDuDpk68abfiZiL1f4YOiY=;
 b=pIh570VhEmYRWR8sobFwkachEV6WdcLp/S9jE7Q20l90AJob99jRZmgBUvRr9x8rti
 Vj/vbWYYx0hFTTEfKG81Xh+YVshDTbjPyzkqhnAPp9TN727F2CK3Kkl74IcoEQXXVai7
 vy7N3S3JfgZqg2fv5eYqpTWz0c4qtUIRIaaaM3OOyz9Qz2NVTgY+fjn9QzdW+iWBc2MD
 8VB3sdokUfRsmAz5PLHDHJY7mP0uY47Ew0hKo8+lQQuPPtoPCdhauehbmqI1FfyX8nT1
 JXChWaXEABCeUTjI20J6BUuZVfp9H1HDhqsghxn5iJIvt1MtPKQG+LjqZcsmCQ0NpePg
 CdnQ==
X-Gm-Message-State: AOJu0YyEDx1MpkNmnU1eM8c7YEjBqOmJ2kroZtSCD0zuTLlD1e7z3ZAk
 JVMn+5aPDa20ukllWVBVbDaKPQ==
X-Google-Smtp-Source: AGHT+IEzc+wWdYLx/D2ts2ez2S94HZ9kZNSnVve1pOz142p3GNd2sRYfgrX3YVCBmxnsKQjBUkC4Lw==
X-Received: by 2002:ac2:5fa7:0:b0:4ff:7004:545e with SMTP id
 s7-20020ac25fa7000000b004ff7004545emr12437678lfe.4.1696870578282; 
 Mon, 09 Oct 2023 09:56:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a19a412000000b005047baf3385sm1488987lfc.181.2023.10.09.09.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 09:56:17 -0700 (PDT)
Message-ID: <ce15113b-c032-44ad-ab03-ff1b719fcb99@linaro.org>
Date: Mon, 9 Oct 2023 19:56:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: enable smartdma on sm8350
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_parellan@quicinc.com,
 quic_jesszhan@quicinc.com, nespera@igalia.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/09/2023 22:33, Abhinav Kumar wrote:
> To support high resolutions on sm8350, enable smartdma
> in its catalog.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Notes:
>      only compile tested, to be landed after sufficient testing

-- 
With best wishes
Dmitry

