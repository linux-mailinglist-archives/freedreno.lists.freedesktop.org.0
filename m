Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0536945E2
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 13:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA9010E5A0;
	Mon, 13 Feb 2023 12:34:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C0E10E5A0
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 12:34:44 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id n10so4530592ejc.4
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 04:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J74YHf3ie7EaU63+SY0GQSf4YHEgWreO7FWC0ay2bw8=;
 b=KRPaa3mRTKfV9nEWIVZacyPcGFYG2GDfrUIyqJCfRYOZne58j6YgASCAtJSgrtdGMU
 LESaAHJysEkYczmZes/snqjGhvp2z69rjDVifAA1vH9z7XimouO/0m4cMWhcPg5/5Mu3
 GRk/q5ZI+p4W/p4xj/do3ZKRP4YRkP7FLOHIufGnK/Yvu+5zWciGgJ9Z5cjMPhDNW4pZ
 R+U7Vq+iBlKR1JvCrMv6u8WuMwg7sx6LHKFsT34AXpyMrZ04HlVI5v54QRay/lLWYwly
 7wwfuTYj2yXJI1x5YXHH091sr7Gn3HUEv9z7ra91TPNesyp+Pnc+dYKFwwJDbIh5Z+OY
 P14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J74YHf3ie7EaU63+SY0GQSf4YHEgWreO7FWC0ay2bw8=;
 b=39qvcIuTQez/Q49hx6J+kz92trX3LeQvGNl3Nn3ckRMNP1hhwj1zhJNYe9ha8a41pL
 L9FqIMl+ezBbpuR8ceFrcjJFCRDqPB5u2CXB5PXMAUAWjkcnCB8DuM96hIn4ORH45EV0
 x6JnFE12ESLE5zaEaNQCOGlVDq+DkXVZj+VGYJ0DGuZC4jOUosSue33gYEj/WC/ffEOh
 dCrU/pjZgOvsZ8DGMIYo6CcCB2i6b9yochvJfwDqRfH8/UFVkGaodLVJrIKFUUYhrx49
 im7E6Slzh6TR+LmcQYGRE0RuJaV97NLd+mvrsLWfR9AQiJzWGqsm/PCz1ZtW9WL/AAQj
 1D0w==
X-Gm-Message-State: AO0yUKVN3BR8hgBq/V0m81iXI1bO7BG+sRwDuKMGLP6i0UtMhJ1vMaX9
 /LEPNJLz1eLUE5vG/b+snXtOrA==
X-Google-Smtp-Source: AK7set8AgoS42l3aYBmi6ssUgphTAVWKiJuZGpw8TVRlOcNRbOod9d2aTGw/bl90SBxhX0d8T/pI9w==
X-Received: by 2002:a17:906:3994:b0:878:4dd1:5161 with SMTP id
 h20-20020a170906399400b008784dd15161mr22037674eje.11.1676291683426; 
 Mon, 13 Feb 2023 04:34:43 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 by8-20020a170906a2c800b0088b93bfa777sm6839596ejb.149.2023.02.13.04.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 04:34:42 -0800 (PST)
Message-ID: <6760207f-b2db-1f19-f265-1d965f8a155f@linaro.org>
Date: Mon, 13 Feb 2023 14:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-3-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213121012.1768296-3-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/9] drm/msm/dsi: Get rid of
 msm_dsi_config::num_dsi
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/02/2023 14:10, Konrad Dybcio wrote:
> In preparation for supporting multiple sets of possible base registers,
> remove the num_dsi variable. We're comparing the io_start array contents
> with the reg value from the DTS, so it will either match one of the
> expected values or don't match against a zero (which we get from partial
> array initialization).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 13 -------------
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 -
>   drivers/gpu/drm/msm/dsi/dsi_host.c |  2 +-
>   3 files changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

