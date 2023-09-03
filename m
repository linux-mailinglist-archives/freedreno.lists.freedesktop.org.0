Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2305790F13
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 00:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE4D10E255;
	Sun,  3 Sep 2023 22:40:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82CC10E255
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 22:39:59 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5007f3d3235so1323980e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 15:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780798; x=1694385598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3njyN7L52ply28cLSWvghKHcDvpsiniGrJ+Mxrq7efI=;
 b=u9W3iM43czpNa5uPGgTXgWzMNPT17YVA1iby7yTdAFK4xLnXEuo9lO6qoXAm/pYBH3
 JrIUw/d6zYqQ/CJzeTb0eiE8nDafFNhqezeKSaIDfSnq1vH0BoEYttPOJamJNND/PFLI
 NzHUo5PkC0wCOW1FysuzXv0fa65V11AF/T++FlOyCJqs9OJLYFblqxNlY/cwE4Ow7lZM
 6FLSv9kAzC7GD01Ws9UHNXiaaPtgajeyQhV6TkKErdLHZexIxjg5zrVzWo7ecg1GtxgS
 PJV/xmSyMg34lIB5DMmwg/VCBnfL2rPUWCTt2QAN+T9IilLZFkS2QgVhpCU/tpD1X1WD
 OF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780798; x=1694385598;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3njyN7L52ply28cLSWvghKHcDvpsiniGrJ+Mxrq7efI=;
 b=c/cQI/veRT29eOb+ATKG7fevYht7VK6Gv1V/AGij8yRwPNZpxp5Vd9vuz0jXvU3a2i
 3yZiFOYJ3oQFQDnaq5oCSD9BoHWLgcNH6bor86Shj1noZsMJMdbWwNq8/fH4qMW7tf1/
 kdRoC7npXMZSB9jAnJdbsfwGfaevA3X5uBANJ9e4Th8wJG1a9N37bZPKNr8zy0Bb10OU
 KHkqrrYlrelb4vrp+2pathg0+MBebeK6nPL7uh1jqqixTeLcF5ohFkK+5rhGWAYjf+Fr
 wEqrsUbDK3UuT045YjzY/WhpaI9iiJzhO0vqKh9y1Ur/vldtguiW2f801BIJljUC6QZn
 ZJyQ==
X-Gm-Message-State: AOJu0Ywpl5u8U4+RcZnM/p6VOa/ATjhq0N43GRDeWBzsPmMQoMETH4nm
 fuErqAAL+RbOo819X9WiQDT5ww==
X-Google-Smtp-Source: AGHT+IHqA5bKFtbDh+6zSj7AEktpbIX5QdrDfqbVTVJTxtGdex58MNMVKlZ2+5ZRABDSdhyKeGSD5A==
X-Received: by 2002:a05:6512:3701:b0:500:7e64:cff1 with SMTP id
 z1-20020a056512370100b005007e64cff1mr4786349lfr.14.1693780797803; 
 Sun, 03 Sep 2023 15:39:57 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:39:57 -0700 (PDT)
Message-ID: <79297172-7be5-4eb1-9288-83334f8302b6@linaro.org>
Date: Mon, 4 Sep 2023 01:39:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-7-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-7-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 6/7] drm/msm/dp: Inline
 dp_link_parse_sink_count()
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
> The function dp_link_parse_sink_count() is really just
> drm_dp_read_sink_count(). It debug prints out the bit for content
> protection (DP_SINK_CP_READY), but that is not useful beyond debug
> because 'link->dp_link.sink_count' is overwritten to only contain the
> sink_count in this same function. Just use drm_dp_read_sink_count() in
> the one place this function is called to simplify.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 38 +++-----------------------------
>   1 file changed, 3 insertions(+), 35 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

