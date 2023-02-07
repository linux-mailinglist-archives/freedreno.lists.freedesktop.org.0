Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0568DCD2
	for <lists+freedreno@lfdr.de>; Tue,  7 Feb 2023 16:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C81710E1C5;
	Tue,  7 Feb 2023 15:21:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC93A10E1C5
 for <freedreno@lists.freedesktop.org>; Tue,  7 Feb 2023 15:21:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id sa10so13561311ejc.9
 for <freedreno@lists.freedesktop.org>; Tue, 07 Feb 2023 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YTPYfaNfHTlgzHYyV9+fBlSvLMoaCZHX7hD5pX806Bw=;
 b=yM2LjNDtT8Di21u7MkpL8aEYysXvyagUm5aFbBZ47I6Hp8/h+0a6HUX7mqE/WMGGQM
 WnHyppQiTUdXfcPULg81UxftTgArLfn0DrEOlvPmqv0GuN4frYzktmX7+3FTAtBE5TZB
 3I1Gol6P/42HRIH+oV61kzOydHpL1TAaxE+RUOLmFhuc9Aq/M64FlW9VdvsSKLjzZDmj
 XCNiFpFySOrnA/GcbDMlWlzg1Q8NDk557SxUE4x4dZK6FAUPZfvfjd8J9EFLbhMEbkDm
 v6+t8B2cMGUkBTM/WBn5ksA8GWz1UBv6/tKz8nkVe6mUM3e1Qb+L2TVtzPB6LPeRR4j6
 Pt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YTPYfaNfHTlgzHYyV9+fBlSvLMoaCZHX7hD5pX806Bw=;
 b=pDgZO1CUOsLRT6N1ZUlz19lPReJUGrP1haD6Xp/pxFNvzRCo0XWZ233Sy9kF8a9xyT
 aFBe5IXTwRDW4Zlso3O4GNcshFmZHK1IPK6gNcs4sYdTc/Wi0rwHIpx3l02eQ9VkY0gs
 UO+xxrw/NAATd1oR6b7ShK3hFPvzqf4EYBKNkf08qSF4PFlvNTpmBtNt5Ixvm6ACh/vE
 DCF2i6PgCumVFnQJVdKEPNRPn6Qp6qKzhzUrydMfaNebLOBAJEXN7GfdMTpUJs8BRtql
 xZMhiGM+Ac1JHJ8re1eew5V700GsiRlOfprVxTyJk6R3oszyQ+wuCtlFpQpNuX20RzGX
 9D6A==
X-Gm-Message-State: AO0yUKUn9mqvfi5G0UxtAZ0W112bLk9UzhHlfSTjzN3xXQmI+GNNzMh+
 rdfcYLMRciiamC132RkNp5GYTA==
X-Google-Smtp-Source: AK7set8584YuXOspFQeCKZnkVa3k+0F5o6MK5ItC2rBbYRItlVp13BBNRpy1PcI/NjxZgLO++QQCdg==
X-Received: by 2002:a17:906:604d:b0:878:7b5c:3811 with SMTP id
 p13-20020a170906604d00b008787b5c3811mr4171364ejj.42.1675783295577; 
 Tue, 07 Feb 2023 07:21:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bl11-20020a170906c24b00b0088d0b51f056sm6921120ejb.40.2023.02.07.07.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:21:35 -0800 (PST)
Message-ID: <f57c7137-0470-ca04-68fa-f0a2f5fabb4f@linaro.org>
Date: Tue, 7 Feb 2023 17:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1675780196-3076-1-git-send-email-quic_kalyant@quicinc.com>
 <1675780196-3076-4-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675780196-3076-4-git-send-email-quic_kalyant@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm/dpu: avoid unnecessary check
 in DPU reservations
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 marijn.suijten@somainline.org, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/02/2023 16:29, Kalyan Thota wrote:
> Return immediately on failure, this will make dpu reservations
> part look cleaner.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

