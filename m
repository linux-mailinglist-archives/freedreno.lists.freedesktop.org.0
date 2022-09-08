Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B960C5B2116
	for <lists+freedreno@lfdr.de>; Thu,  8 Sep 2022 16:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0B410E42E;
	Thu,  8 Sep 2022 14:46:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A33310E42E
 for <freedreno@lists.freedesktop.org>; Thu,  8 Sep 2022 14:46:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id f11so14106991lfa.6
 for <freedreno@lists.freedesktop.org>; Thu, 08 Sep 2022 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=0g7jm1tfMeS37DuswgCHsZL4cnMeiZpu8DKcWfcPMs4=;
 b=dk0WmkaktqSTA/4u8/wXgL/F5Tz7UEWPdORoVfc618TgX1XHw+OtVIDs7ycXUMfAUV
 8ALm5Z9GqOFENm5lwWu7juE/SlD+2v0xGw2BmGSZjBJvBHF5pbfqv4wazLU3/x35fRw1
 iBuXwKaRqlpNU2SfGnMk6LDGwtAM7/DCT83/LN8Uen/0X7fjRwfQPLBvupBHGH7CPQgb
 1R5TtdXqBAh+mgpei6KUozbWayptzTwRIMYogQ3YwRNCZ4zUSf2UnshYUkasKx9nV9UK
 JP0W6EzjakzDjMl+f7BdB+m2dhYLBbHVZG7eJ1vm3hl9xVAghafW1FapfmimPpY6fcdp
 oEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0g7jm1tfMeS37DuswgCHsZL4cnMeiZpu8DKcWfcPMs4=;
 b=mjUClz7hqOi5am6M9geLowwY0/aplTUTdCG3rbwO5Ftqpy4BnHKHZJzmx9XSbcLXVs
 0Y09+nOAi9H1PYJ6Rl/VWz0Mb+UKze3pAqXMOmA/kw9+mEGHGiMcwOgCqrmCNmSadx+h
 IIw8zTk3g06H31eGm0pYBYKBjW8Bf3/zENlAdncY1QWhnmQgOJNa8vd/1oKoQQxURSJU
 vxf7RSbdk6b4fNOtvSaXZFwDUS9B/ubt4XoKHEXpsygzeektI+JufrZglJ5vIDT9ef04
 2KOoE51JXkM1kAvtUBc3JFWRcmqUYKkY0xoaoxgTCVj+PBuAxNUMn3YOnQCpSeZdkzUJ
 56kg==
X-Gm-Message-State: ACgBeo0ndAfgbxpYmUSuYDEsjMaTRppLxAN420mQeJj5GHRb3aFTsuDo
 N4YubwEXRGlwxsx39bj8ro79LQ==
X-Google-Smtp-Source: AA6agR50EzklNl1HXu9tN8I/TO/HfpAqxxK5ACablQY07eWbAvOhdafOZVGz18+SZBIzH0T8mDMgiw==
X-Received: by 2002:a05:6512:3f01:b0:491:9b9f:a54a with SMTP id
 y1-20020a0565123f0100b004919b9fa54amr3042107lfa.160.1662648374976; 
 Thu, 08 Sep 2022 07:46:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05651205cd00b00492dba3c85asm3062317lfo.220.2022.09.08.07.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 07:46:14 -0700 (PDT)
Message-ID: <9fa2fc18-9cbf-6f21-f850-68ce2b0331a4@linaro.org>
Date: Thu, 8 Sep 2022 17:46:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
 <1661830389-22439-3-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1661830389-22439-3-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 2/3] drm/msm: filter out modes for DSI
 bridge having unsupported clock
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 robdclark@gmail.com, seanpaul@chromium.org, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/08/2022 06:33, Abhinav Kumar wrote:
> DSI interface used with a bridge chip connected to an external
> display is subject to the same pixel clock limits as one
> which is natively pluggable like DisplayPort.
> 
> Hence filter out DSI modes having an unsupported pixel clock
> if its connected to a bridge which is pluggable.
> 
> Ideally, this can be accommodated into msm_dsi_modeset_init()
> by passing an extra parameter but this will also affect non-dpu
> targets. Till we add the same logic for non-dpu chipsets, lets
> have this as a separate call.

I think this makes DP/DSI depend too much on the DPU and DPU internals. 
Can we instead use clk_round_rate() in the .mode_valid in DSI/DP/HDMI 
drivers in order to check that the requested rate can be achieved?

-- 
With best wishes
Dmitry

