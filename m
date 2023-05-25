Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6F7113AD
	for <lists+freedreno@lfdr.de>; Thu, 25 May 2023 20:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DB110E08A;
	Thu, 25 May 2023 18:29:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E7410E08A
 for <freedreno@lists.freedesktop.org>; Thu, 25 May 2023 18:29:36 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f3bb395e69so2845689e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 May 2023 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685039373; x=1687631373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H+b24C77d9A2u9UTnLoifoUxD5slr2fdLTj++pWst70=;
 b=fLEkzZfSVZKSHIt49CCsR3FwdXcGBM+yggkoWf6irQPOVz9dI4elnrX6N9qKeRjvZ8
 DEJlyMRpYESTW8CwsZzEmuSExNZZ8cdJ5iA7uq8zdD+8FoWv9EWlKcqGnr5MqeZwAT9W
 tgPbbeAaKbkoQROrQn8bbtaTGAccu13e+zC0DBd/9aByAy8AL3Th1V5sNTPnRS6WUmxx
 WIHZF5+4q7biw21do3UBX1Tdql0b5fXjglVfSV+A8PPdvhi/EltrD7SDLzCoGR8N+dvx
 NhvtMfVxZA55p/+xiRf4NO/d/aRUF4+S2kVhnmn1kGR8FK8D9fBtjxZbJwP+aoRAtVtc
 Vw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685039373; x=1687631373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H+b24C77d9A2u9UTnLoifoUxD5slr2fdLTj++pWst70=;
 b=ImLd8WcpCpOh4gm4xxr24Tvr9AGZQCzzRT7uOMhHWzaV2iwinTxcUQIYxYkCpuoTTO
 DWUD6KkvGtp/fNaxzEhD8F/qvaTlqaxHEP3u1wOT2JHCP1qfmA6iGLCtz1LB9qwjsTmZ
 tAJcXmHrKualcE51WYTeExOhXr6uWbOYnXG3Oc2nHdu+aDXNALYY1+epEf9esxH07f3r
 VxJs58dtE5x4z2AcxYdg/Z/nm+vz/Or5qNwUmx+QkVDZemX1/Q79j3wecbEGMjP6eErf
 UnUv0peGdt4txHvxt2n5p7Em98ou0sLsza1qpyxcQpgM1xvABnfaTWme0xz7CXt/jEM7
 KceA==
X-Gm-Message-State: AC+VfDwYMCf7TS3TmFyusIseb+mlbmQy5mci1uYDgsaTP/f8CR0hpKpb
 /EZUP4I17/7KoVUCePlm+9yAlw==
X-Google-Smtp-Source: ACHHUZ4cuZ+XPY8hnX4V/tTQBykGPBXRAE5A+zNP3iexE+m6J8nJtSxLuUXwZj5ASu6EX4nyvgoeew==
X-Received: by 2002:a19:c517:0:b0:4f3:792c:289d with SMTP id
 w23-20020a19c517000000b004f3792c289dmr6409992lfe.20.1685039373522; 
 Thu, 25 May 2023 11:29:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac24573000000b004db3eff4b12sm295337lfm.171.2023.05.25.11.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 11:29:32 -0700 (PDT)
Message-ID: <85b1c798-bb6e-a37c-d84f-983d19cb96c2@linaro.org>
Date: Thu, 25 May 2023 21:29:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1684878756-17830-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1684878756-17830-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6] drm/msm/dp: enable HDP plugin/unplugged
 interrupts at hpd_enable/disable
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
Cc: quic_sbillaka@quicinc.com, leonard@lausen.nl, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/05/2023 00:52, Kuogee Hsieh wrote:
> The internal_hpd flag is set to true by dp_bridge_hpd_enable() and set to
> false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP controller
> case. HDP related interrupts can not be enabled until internal_hpd is set
> to true. At current implementation dp_display_config_hpd() will initialize
> DP host controller first followed by enabling HDP related interrupts if
> internal_hpd was true at that time. Enable HDP related interrupts depends on
> internal_hpd status may leave system with DP driver host is in running state
> but without HDP related interrupts being enabled. This will prevent external
> display from being detected. Eliminated this dependency by moving HDP related
> interrupts enable/disable be done at dp_bridge_hpd_enable/disable() directly
> regardless of internal_hpd status.
> 
> Changes in V3:
> -- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
> -- rewording ocmmit text
> 
> Changes in V4:
> -- replace dp_display_config_hpd() with dp_display_host_start()
> -- move enable_irq() at dp_display_host_start();
> 
> Changes in V5:
> -- replace dp_display_host_start() with dp_display_host_init()
> 
> Changes in V6:
> -- squash remove enable_irq() and disable_irq()
> 
> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++-
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  3 +-
>   drivers/gpu/drm/msm/dp/dp_display.c | 71 ++++++++++---------------------------
>   3 files changed, 35 insertions(+), 54 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

