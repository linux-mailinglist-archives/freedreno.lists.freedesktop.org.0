Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F4370DCA8
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 14:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A163810E42F;
	Tue, 23 May 2023 12:34:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81FE10E42F
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 12:34:16 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f3baf04f0cso3311853e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684845255; x=1687437255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VStAuEVhC2bCRmusIaySDz/SK/sdnCdNupplahYT9Q=;
 b=ItC/HSLvWJai35Wq6AoHYCugrh1LBbE8UpOeF0LZVCgHMMuV5hMMYIbe1zYqapEzZJ
 y9qiz4LK4kmoGWJlYxkUa0Bt3qeSeOjduzxYdl39PYg/ylqDgH5jlzcd7WxnO4VPT5N0
 Z8qQqeEaK8cnIBjgmvP9V2x6KX2NW+Se1BArQFKRgVP3VjpxjzMBFLpoz/Gtqqv1yQTl
 7NiNVG/oCUfyV83xI602JFpSScw6flnFy1/MnxZOscieb2m4ZROMysYBStgB/NAsMR9w
 GaAhdPaHN2y7KutWw6dLQfLLxSMco1Rm3sRDnifsOgwIlTNWluqVqLd0iA4C01+H+PSm
 IXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684845255; x=1687437255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5VStAuEVhC2bCRmusIaySDz/SK/sdnCdNupplahYT9Q=;
 b=FlIzZxY9sNSRhhl0JrvFDFXzlkcL3xYWm80UpEj1gyVKfEwCHIJKPqhZl51DHcpJIh
 kWaprnYXBcxHODUqj7Z+3kpyKLn1VgXVgRHQz+EenbsBtYNQBIZwUvvnMMGgWyPVhvD4
 g/VBA6zqXT9/1E1TuGqfKdwb5MRB1eLCQLnjDivoHISfXGsASvmFjui2rxtq88gypSkV
 j/ciJp/ZtxZrDswpwWysvpjyGCl4VfdxETVaOoVHSz3pDdn3FPNOz8NFnY0ZJwtMKMxg
 xH7hPX5SVaaBwxV9S42eLGTX37b9OSYOsCKos34KAOgImAhsSqBvmQjHpvqIC6jNK65E
 XxMg==
X-Gm-Message-State: AC+VfDxte/alQlADewe9UWHtX0WkFm6aDMYn809CrX5Rm8oJra663PoM
 k9wZtjun/u9mprJbP1j2NU0yog==
X-Google-Smtp-Source: ACHHUZ6mRNSCPuwh1780ZJPAelP5liz4bXxJaS2j4Brr3xJN1o0gnDBB9N1MkO7iAWK5UecFSO/ybg==
X-Received: by 2002:a19:f610:0:b0:4f4:b3e2:ff5a with SMTP id
 x16-20020a19f610000000b004f4b3e2ff5amr1176411lfe.50.1684845254928; 
 Tue, 23 May 2023 05:34:14 -0700 (PDT)
Received: from [10.10.15.175] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a19520b000000b004f13f4ec267sm1312723lfb.186.2023.05.23.05.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 05:34:14 -0700 (PDT)
Message-ID: <16c5ddb7-f5a4-d70b-ce0c-32aa6674fc98@linaro.org>
Date: Tue, 23 May 2023 15:34:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1684796565-17138-1-git-send-email-quic_khsieh@quicinc.com>
 <20230523123504.3xjssy6ktgrsdewi@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230523123504.3xjssy6ktgrsdewi@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: enable HDP plugin/unplugged
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, airlied@gmail.com, linux-arm-msm@vger.kernel.org,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, marijn.suijten@somainline.org, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/05/2023 15:35, Bjorn Andersson wrote:
> On Mon, May 22, 2023 at 04:02:45PM -0700, Kuogee Hsieh wrote:
>> The internal_hpd flag is set to true by dp_bridge_hpd_enable() and set to
>> false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP controller
>> case. HDP related interrupts can not be enabled until internal_hpd is set
>> to true. At current implementation dp_display_config_hpd() will initialize
>> DP host controller first followed by enabling HDP related interrupts if
>> internal_hpd was true at that time. Enable HDP related interrupts depends on
>> internal_hpd status may leave system with DP driver host is in running state
>> but without HDP related interrupts being enabled. This will prevent external
>> display from being detected. Eliminated this dependency by moving HDP related
>> interrupts enable/disable be done at dp_bridge_hpd_enable/disable() directly
>> regardless of internal_hpd status.
>>
>> Changes in V3:
>> -- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
>> -- rewording ocmmit text
>>
>> Changes in V4:
>> -- replace dp_display_config_hpd() with dp_display_host_start()
>> -- move enable_irq() at dp_display_host_start();
> 
> I think what Dmitry was asking for was that you remove the disable_irq()
> from dp_display_request_irq(), but perhaps I missed some argumentation
> for why that can't/shouldn't be done?
> 

Yes, I was asking to get it removed. Kuogee, is there any reason for 
keeping the enable_irq() / disable_irq() calls?

-- 
With best wishes
Dmitry

