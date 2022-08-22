Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E877659CA47
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 22:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26778A2ABD;
	Mon, 22 Aug 2022 20:42:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B09CA2A80
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 20:42:37 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id s6so5673449lfo.11
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 13:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=T2n+Lv4KvObfEMOxqTtH9zJ8A2GPm+1tT6W+HrcRbLY=;
 b=uyR1Lq08Xt37Czv3fZnuQVC5djaS3RavHhqAE/nCVhDLnogNF0T4hECW+gb+J0XekS
 QRBAGt31862H1JfZEACVl+hVxlN+IMC2vy70jeCbPeXbsk4gjBGEmbxpVg+Xs5Eu8dEr
 xLXdznl02Wmki6mmYdK0CWLvyZs3GeMF8MaxxjFHKbN206D+syv/Xzknoyph17E22L7p
 t7VkVqUua0QyUOt2KalftjWfOyu6NIIqssjZOd5ixXL+DPd2zWLVfC63eJAE3yPwSaoF
 RSEDw4hb25LQuNn/HtIgkk/luUb/j5F9LUML0zjL6P0NIAhEbAV406iw01PkA323hO7+
 f1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=T2n+Lv4KvObfEMOxqTtH9zJ8A2GPm+1tT6W+HrcRbLY=;
 b=cb7QQe8klQQdA3cAlX/IkdjgULQHozM/x4epRJG+9VTJ3WrYYDC4tKWD1Lmqp0hTS/
 CuAAF07xU3HTU7PZr5/bANiHpXHtb9bSVkGY7xyknW52DV1AzDvcSh8k0UYsB/DWd2Yr
 c3RuQCmh/FlUUcyOEhWwVHMh1RkP4dnVULRnNvDrvwfVAG5oU4xS4cSbNrsJDaedkoqX
 PLPgMvDvSlpj45cvPkuWLgb2QfK/qeDeYWiuhGH+Z+bcprHnC4aGdPJV60UHNyid6gv+
 g6clcYnYJ2AbfjXnlehaRw/Q489x4FndRvFR6N3l/UwrR7TrUfQf7OOQtoe5dEvyhnuR
 vkWA==
X-Gm-Message-State: ACgBeo2rDTm4x4tk1044XzLSLamY+aSn8jOxf/TvRGDyILvTE1NtEd9b
 1iZ58Ea7tGVvcowksnNrs4iMSg==
X-Google-Smtp-Source: AA6agR5rCB4QhCUzVyTSuhrloe4Tlr3L7LCyjaozOGYIYqRMr4K9wKFtZ6ZXnjidUe1hpMsTfB1upg==
X-Received: by 2002:a05:6512:1385:b0:491:4152:c9d7 with SMTP id
 p5-20020a056512138500b004914152c9d7mr7667543lfa.675.1661200955744; 
 Mon, 22 Aug 2022 13:42:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a197708000000b0048a891e4d88sm2089178lfc.193.2022.08.22.13.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 13:42:35 -0700 (PDT)
Message-ID: <ea75b23f-d389-b24e-9ebd-2fd35bf33fd1@linaro.org>
Date: Mon, 22 Aug 2022 23:42:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220807172848.2432845-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220807172848.2432845-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Add fault-injection support
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/08/2022 20:28, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Intended as a way to trigger error paths in mesa.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_debugfs.c |  8 ++++++++
>   drivers/gpu/drm/msm/msm_drv.c     | 15 +++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h     |  7 +++++++
>   3 files changed, 30 insertions(+)
> -- 
With best wishes
Dmitry

