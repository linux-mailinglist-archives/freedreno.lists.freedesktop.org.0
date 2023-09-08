Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C379802F
	for <lists+freedreno@lfdr.de>; Fri,  8 Sep 2023 03:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2654C10E23D;
	Fri,  8 Sep 2023 01:30:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3249010E23D
 for <freedreno@lists.freedesktop.org>; Fri,  8 Sep 2023 01:30:46 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99357737980so187111866b.2
 for <freedreno@lists.freedesktop.org>; Thu, 07 Sep 2023 18:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694136644; x=1694741444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+s6ddDNWj5Ed/aqdjx7Pfh0SYjgnxSyCgwh9TBhOQWw=;
 b=Ne9CewkRM54tRmskCDRyNcW4n7STP/ve7va7LhxtlhyVRp7cjr2E1FW/U9+B6mW3Y4
 iF5xCQhsZseUz4e75qVycMy6S/j2jOJZ7JNIhHC7WPC2M1+UWX1okFgVCD0O3vi7tAme
 8bt5/RJ09VBTWPobxY1P2grApu2GmtR9LKMJ0Xp6x2Gtnk/cA1nA4rF0BaebJzq4nPAA
 SgcNuwXCC/GQGmqYWvZ1vuuUJfH5RB+LrTbvNHSc7gTOrKJgU7X6JufTGcInA7mc9uUn
 9Pbsdh1D810/NMuqyTyoUerbmuPtMGP6TpIS0UHHPRRKTlIjDFhX/xEJJQgxyXiE5jNw
 RgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694136644; x=1694741444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+s6ddDNWj5Ed/aqdjx7Pfh0SYjgnxSyCgwh9TBhOQWw=;
 b=vw8dmL9ECb21Mweauo6t7JbGmlwuusBOqqi5Sh/5NmTuhuL/gJxaUuJjvhpsnlmN6j
 a5HGF2M70n9nZrT2aQ4+avDKZ1iBjsI5CgasXaa+w/wFx+riOOz4zGwq/6vuuy3RXQQb
 tD1c8XtO67IAuz8zii4ijXVMxe6Q/R1s19PEaM2jSkm/YENWeOeaiqys8sZkoMl1Bdg5
 O2GXNcup16lVYa7grEtwgNjQMGJ+8Bli0jWnM1cIZne0Jti9+CIe2en8I+6rDmN/A2hQ
 W/Xy4Ayd1DNBKnznZEQkB0zddcqM6YnVC4KKkgzdOs/0zCG909oNtcCPPku38/W+rLFa
 FdEw==
X-Gm-Message-State: AOJu0YyX6QDWWhuEGjuqasnGE6VkX7hqqnNmCEvLILWkV0npozYhJWlZ
 s6GHKFwUGRdMljiuU6u1Xe+jnQ==
X-Google-Smtp-Source: AGHT+IGoHfi/f0ipDYYNQtYwElSZi0+PTS0KL74gN0o35Q3QTzuxbhrmUK7vaOEkHJM2Pm7wiL3FwQ==
X-Received: by 2002:a17:906:76d8:b0:9a9:ee3e:e6b6 with SMTP id
 q24-20020a17090676d800b009a9ee3ee6b6mr608770ejn.3.1694136644631; 
 Thu, 07 Sep 2023 18:30:44 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a17090648d800b00992e14af9c3sm325285ejt.143.2023.09.07.18.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 18:30:44 -0700 (PDT)
Message-ID: <d5135c84-65d1-4e39-8c97-a7c6838a32a5@linaro.org>
Date: Fri, 8 Sep 2023 04:30:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <20230908012616.20654-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230908012616.20654-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: change _dpu_plane_calc_bw()
 to use u64 to avoid overflow
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, nespera@igalia.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/09/2023 04:26, Abhinav Kumar wrote:
> _dpu_plane_calc_bw() uses integer variables to calculate the bandwidth
> used during plane bandwidth calculations. However for high resolution
> displays this overflows easily and leads to below errors
> 
> [dpu error]crtc83 failed performance check -7
> 
> Promote the intermediate variables to u64 to avoid overflow.
> 
> changes in v2:
> 	- change to u64 where actually needed in the math
> 
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/32
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

