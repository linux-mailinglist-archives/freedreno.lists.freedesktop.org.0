Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0AE8C5D93
	for <lists+freedreno@lfdr.de>; Wed, 15 May 2024 00:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9160E10E6E4;
	Tue, 14 May 2024 22:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lAP0CFKa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6035F10E6E4
 for <freedreno@lists.freedesktop.org>; Tue, 14 May 2024 22:17:28 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e43c481b53so73768371fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 14 May 2024 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715725046; x=1716329846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LtFt7wDddzxzOujkRVGAoAf/dJUoMvePNiVnCCaevzU=;
 b=lAP0CFKakI/y/GoF0Do4CgmdACLYIPh12b4ZR4I6QR72353soBygNJeWR+v3rFBP1S
 UrGmedqNEOb5lTVIZ48cn04sLwHyPsPm5m7i/SPD0C30AAKbi5S7os8VonEWLfIBavAR
 TJJizKmR6Mz0xNZGGHuLYiXBwAyBAojQdkeiD7wIH7U/SQOmAiB/V4rSyy/OpyFvyzZn
 Gxgb2CzcsSNcZo6P8wTayRHv9MxVjKdEnHIJor/vfN/ijg7TPE6C+Mpnytf7GF5cJHln
 rezB/Del9YxwYbmX1w0dNztp+7D8XBqbJkaRHtZnQlYRiLDzJpodMJuay0B2jpcdBjXU
 dgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715725046; x=1716329846;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LtFt7wDddzxzOujkRVGAoAf/dJUoMvePNiVnCCaevzU=;
 b=L6T2pKwhAjX40TaNTOJ5i9OTZM8uSajBQn16rZR+UGdkjGsnJZLjmwi5nMFQEZPvjP
 9wScBpGhh8gYkZ+6Or3quxYvHl+/JhY+VTk245TvlZxrxxW5SoJNJ3HP2/hLhJF+N48T
 BvcH5ifCKhGyEBMPrre4iSKFFM7VrZzQ/NKSEn0eSlMbmelhrJXf0f9t0ccvyDm7NTrc
 3tJJuzVxiL1jP3BxcnS2y85vmJyMoDE7mWrajhR2AWIgfSVOWeEYVzG63OkH2Yk0O9Zq
 nIr6VXNhaugBb/OJYusB9HwXaEVDNDhrtwOXkwUivZ+N3U0nS6fcA8IcaLUdvaG2A2QP
 VHJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAq1fVIHb8ZNRjfnt4ajqfa07/w4NqRGfn7NYVNRW1y6D71icIDOX1AGu7DGMLkmM8SIpf0TFnASkG4SeT/9zwrJ7ziTyz2cHW5jrIBmJr
X-Gm-Message-State: AOJu0YzSQbrCG53Ti/pjpS9IZEGFQKIAPd6gOgrhP6NWGIIqPe8MJIgC
 7eJumY8QyZSq89iSbPDV92kvk6Pz3r68yuAlURNh4ga/LaZQDh0GmRoYx4ojOsE=
X-Google-Smtp-Source: AGHT+IHufBornj75MaM0CaFqK+fsJscVVdOQ/IMTS+dnU8UXQa2+ajhmTfkTpNSwPpVz1LgRs/Djzg==
X-Received: by 2002:a2e:460a:0:b0:2e6:f710:6061 with SMTP id
 38308e7fff4ca-2e6f710617fmr340141fa.17.1715725045977; 
 Tue, 14 May 2024 15:17:25 -0700 (PDT)
Received: from [10.1.2.16] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41ff063d8cesm175234525e9.46.2024.05.14.15.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 15:17:25 -0700 (PDT)
Message-ID: <0ba6af4b-1d69-454b-85cf-a83b64431496@linaro.org>
Date: Wed, 15 May 2024 00:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Add obj flags to gpu devcoredump
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240513155150.166924-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240513155150.166924-1-robdclark@gmail.com>
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



On 5/13/24 17:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When debugging faults, it is useful to know how the BO is mapped (cached
> vs WC, gpu readonly, etc).
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
