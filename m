Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1188831859
	for <lists+freedreno@lfdr.de>; Thu, 18 Jan 2024 12:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B44F10E76C;
	Thu, 18 Jan 2024 11:20:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFDD10E76C
 for <freedreno@lists.freedesktop.org>; Thu, 18 Jan 2024 11:20:04 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-50e78f1f41fso13024955e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 18 Jan 2024 03:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705576743; x=1706181543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MDFd66KcIbKFIIX/WcgTl2/WLahORWiu0MGU1O5cSMo=;
 b=OO5CnF7Ox2fpdIiDIbsAzTRcw/8ad1iUCy4NAlGMIrfcgtXyWdb0bP9EiGsrlx+dF8
 Ni8Ap8j93zzZZBewOJsY8CbY5SkK3JJ79ZP2PRbyhJwnHGiek0NTHFSeOtBEOsDmCpgE
 ogfTgDV8gYnAdjE/SZ1yaGLlzrVtwA60g9Pbg/vr5TsdBVTiZ8TEGNZelswdXEdJgQqQ
 3MDdAMq7xM4d50SJbDjc9n+SxRPpHVfu8yBrdPygScjYXNGJ6zv95JsGS0IwJqasSJ7F
 1vh0MG4pAulScU8aGvbwMBA4bktqdDXqs//LF5M0z14nn2ZrksuxLJPdiHIr3u2i9Xzp
 jo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705576743; x=1706181543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MDFd66KcIbKFIIX/WcgTl2/WLahORWiu0MGU1O5cSMo=;
 b=oLYjBwSUfBkPw2DWUAMJYz6eIGp252zT5tLysgDEyRN11eYZPQTTqCfXZp1h4YoaIz
 8X8mTgW9qqsxpItrdAK8zfOhrzEssQypq4xxj7caAERuWP1dGd7HkYYn4FFUEBFEkHXu
 RT/G0WMB4eZ99NPanYrQcVbv+IAJJRUfvJ3sIFZ1VDSMxKgBbRWP1VNfMw3I2wppwq2+
 isEkDLxRwPihT+dITtCsp2Q4Jo4YyFfcTG/GZq7JHCBBIZXyhU1r51GXxy7BKexjFJVz
 3pPlkHiPVnonp/sCDOnnukTl2j5iER4J9hyOOH3uRiGh26cGF+5f6zufWPe+sSL0WXg+
 EUWQ==
X-Gm-Message-State: AOJu0YyOw+7ka+9qx8bHaVdAPOzoMqa/kyNk04shK5b0aCIXjdxKE/ap
 wOZ/8Sp5g+Wumc5bSXo8kz4yrx8+twjiyv6g7ljvvJNZ5psqQfiu9espBZYw6Rw=
X-Google-Smtp-Source: AGHT+IHqoe2TVTZTVhMTb7zPOZYWEj/lioFMe60pwfbBpenxG7wEQKyuG3YE/bPiO2Lu8eFVuFv6CQ==
X-Received: by 2002:a05:6512:4897:b0:50e:d5ad:9414 with SMTP id
 eq23-20020a056512489700b0050ed5ad9414mr386800lfb.50.1705576742745; 
 Thu, 18 Jan 2024 03:19:02 -0800 (PST)
Received: from [172.30.204.173] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 n22-20020a0565120ad600b0050ef97332cbsm601903lfu.32.2024.01.18.03.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 03:19:02 -0800 (PST)
Message-ID: <4c4d7469-c28b-412d-aa30-7123d3c98d1e@linaro.org>
Date: Thu, 18 Jan 2024 12:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Update generated headers
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20240117203744.394260-1-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117203744.394260-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 1/17/24 21:37, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This updates the GPU headers to latest from mesa, using gen_header.py
> (which is used to generate headers at bulid time for mesa), rather than
> headergen2 (which doesn't have proper support for A6XX vs A7XX register
> variants).
> 
> Mostly just uninteresting churn, but there are a couple spots in a7xx
> paths which update REG_A6XX_foo to REG_A7XX_foo for registers which are
> a7xx specific.
> 
> Cc: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
