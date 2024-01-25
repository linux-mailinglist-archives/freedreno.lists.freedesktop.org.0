Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9EB83CE5A
	for <lists+freedreno@lfdr.de>; Thu, 25 Jan 2024 22:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5589410F35B;
	Thu, 25 Jan 2024 21:18:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B51710F35B
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 21:18:45 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51021ba75edso859149e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 13:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706217464; x=1706822264; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qD2QJEJnWPU8h0oM7MFrjmiG6AeNavMG7PZRxfY95OU=;
 b=XXdSDGfbfdvpe+2AxVUWfa++fZ02JxequGqsu3JFTSrVcOS6yvLrBkA1nm+fKLYIJy
 LDpVmAQEGcsETYC3ugGDMbJtzjeyzRmmSCKpHjiA+jHgd4mfi+Uecy3kMxdtx+aYyqa5
 BNwDpcuXRWODLXJYAJ29QP1iyUqSM45R7fUf2hJPo0ItKOGUU6BF43nRB+tYV5PsLIaP
 VZnzqGj6cVcM+2GQ+5PhZwhJQnnbW4ixGptibafIdTEmS1F5zT3kdLb6bL97t8GcXgjL
 Y7Kxi2iVwx3y6/Os0b/y2qeR+n5wtmCtDofYlAvfRytVHwJXvXP339hCfH0+qXmGzsVH
 yKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706217464; x=1706822264;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qD2QJEJnWPU8h0oM7MFrjmiG6AeNavMG7PZRxfY95OU=;
 b=LTOyDclO3zrTgas3Yjh7faNmVAsHaRZFwE7CJq/JLbogRtHHkBeMEBnLcmkGd8Bpkg
 UTmoiJxUBpyLgZ6tdiC6/ezTLPA2h7Ta1JuE0+PgUY8W1+YLfD5qILYIgydE4sikp+KQ
 iL2QGDiIaWolayHYKz8cchWcL4tbBkFvJRtdq2o+Ybe/IcJCKAiPfP6LDBHf5TiBHN99
 PBHNHVU1mLZqWWXguy+oA/NsGRmnMPIfGLEreIcVPiuEUEO9asPXcV/qqG0E0TdMd/Qu
 7BY6jN/6mF5eTUOVOY8RWJzZqK/TDHhvYxRW0nWyn0JrvRWCpR62MBXy33t505EeQPES
 BBHQ==
X-Gm-Message-State: AOJu0Yxlfujkx4sIz7kc3m8QZRbCm0W5SAQEm2kE0FOgp+M03NrvHNj/
 v6D6P43asYAwoAcezuhRWnf72eWFvks9hnbO8JyWbVdXF6dLpKELPnXlV7WFx9M=
X-Google-Smtp-Source: AGHT+IGBDmA781f4oxbUXw2/D3G0P4WiuvTPBTFitCuStyuMCh9gM98JpGODRI1WnCOPGe6iLFGUEg==
X-Received: by 2002:a05:6512:401f:b0:50e:4d3c:c4dd with SMTP id
 br31-20020a056512401f00b0050e4d3cc4ddmr233121lfb.105.1706217463847; 
 Thu, 25 Jan 2024 13:17:43 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a19ac49000000b0051021c54018sm113397lfc.251.2024.01.25.13.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:17:43 -0800 (PST)
Message-ID: <56b38e28-09e5-427b-920b-5e724824c258@linaro.org>
Date: Thu, 25 Jan 2024 23:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm/dp: rename wide_bus_en to wide_bus_supported
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-4-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-4-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> Rename wide_bus_en to wide_bus_supported in dp_display_private to
> correctly establish that the parameter is referencing if wide bus is
> supported instead of enabled.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++---------------
>   1 file changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

