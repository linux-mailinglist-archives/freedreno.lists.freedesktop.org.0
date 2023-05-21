Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B18E70ABB3
	for <lists+freedreno@lfdr.de>; Sun, 21 May 2023 02:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F12710E1A5;
	Sun, 21 May 2023 00:01:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ADA10E00F
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 00:01:40 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2af316b4515so5473691fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 17:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684627298; x=1687219298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BhHFF+I9itHk7q02MfL6eP2c+lYCwKwlb36uQkoEo9A=;
 b=V0qSG1ktvYe9blNJveMjWucQJZVwefISdU363LoGwpFPPLCa/JY6/4ZtlJ1WhzrGep
 zzxVpl1XBD4rzvZjuMyKob2BXOnxvYBmYrRZHZkethyBmzmSwRzezd982JBHb7z830OA
 LWnBAozc/VQNi7DvxiEl0LrI6VEg3Aax7fwbP5quFwR8GasL9xKwY8F0bQvvTyzFUmKf
 loQhcHnvoaESMwzAZ8/Ttt3ok8a+s0NwufZqxA3SWA+VySDN9I/j0vAdK4pnOZGn9/CC
 jmpoFyNSG+fIcbvWyB0WFUYxRzlzbTqc8f+CXpJ6RaRLbvf907U6ipWBZ9CnhuvzzQwK
 JjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684627298; x=1687219298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BhHFF+I9itHk7q02MfL6eP2c+lYCwKwlb36uQkoEo9A=;
 b=YER2klnepVglbFaBhtYgEOh/ukQ6Qqe2liXz0ieebeT8852WaeWI01+Dp31Tle7Kox
 LWebnG0+VJJcc8NhpcaxhVTFkEHm3/BP+RyNBBSPj9MYdc1rQ8Gi1urwcWqjTP9BkU2e
 bzBPT5fIiLUri7FjMDGR5JVDALzW4e5qQzHf89ti5Ouob1vRFCeGY4LTPymyOoRd/cCw
 sB03kufrIjwOsL7NqN+sT3ZUA22UeyoA5XF71hhq2chw0AMWXVf7TIU+AKsm3fPIZd6g
 Z9uciDX0UC9a1NwgjJjK+/0tXGy1HtPKYA3MseY9IrzQZb7dUMstWIGRJx85GTJlDueP
 7Hag==
X-Gm-Message-State: AC+VfDxSZi8qw9Ffz/5AGMm5V/Gu0wVjoonQV9avmUkzwkZ0t3U+J683
 sUW7TAC150MoPckuWtIsVeakqw==
X-Google-Smtp-Source: ACHHUZ44FKOqvfM6G1aCOIoZiD/9C+PWsjCp90qta9Eul9ReiyZmASMzYYR/LuQJRg0F9rAZ5txxWA==
X-Received: by 2002:a2e:9c0e:0:b0:2af:3f7:53fe with SMTP id
 s14-20020a2e9c0e000000b002af03f753femr2059520lji.50.1684627298093; 
 Sat, 20 May 2023 17:01:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a2e9147000000b002ad9057fd00sm491399ljg.85.2023.05.20.17.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 May 2023 17:01:37 -0700 (PDT)
Message-ID: <115de0ee-f0bb-84e2-9bb7-00e23641bcb7@linaro.org>
Date: Sun, 21 May 2023 03:01:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230515143023.801167-1-robdclark@gmail.com>
 <20230515143023.801167-10-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515143023.801167-10-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 9/9] drm/msm: Wire up comm/cmdline
 override for fdinfo
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Chia-I Wu <olvaffe@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/05/2023 17:30, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Also store the override strings in drm_file so that fdinfo can display
> them.  We still need to keep our original copy as we could need these
> override strings after the device file has been closed and drm_file
> freed.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 +++++++++++++++++++++++-
>   drivers/gpu/drm/msm/msm_drv.c           |  2 ++
>   drivers/gpu/drm/msm/msm_gpu.h           | 10 ++++++++++
>   3 files changed, 35 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

