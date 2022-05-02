Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A5D516D9B
	for <lists+freedreno@lfdr.de>; Mon,  2 May 2022 11:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77D10FDBE;
	Mon,  2 May 2022 09:41:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D339810FDCF
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 09:41:40 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x33so24369451lfu.1
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pH7dgy/PEte/5shbJVNiqZ4lGZ8Ek1KPU5FhzTtm05M=;
 b=FgYWzV+f6lqMxBGLElhkUf6UDcC4zTrKW9Dbk9P3yR+l9+cxi8jHMQ1FPfR7k9e4/M
 6tK3IuiiaFczssalFhCl3WuCRl3Cm1aemU8SPEswst6mgN1+nhc9RiCiC3TMAUbSnqur
 2b8mMuQ9JZwnx+hWimuT/SoJgUtaHjSAKFS7cJpsBxNELk96nS+N6vv9kP0FpNC+Z3hO
 Lb4yZjTdvG8qpWT9uTbZDi4RNUvJ0xnoGYTTcrgnLWl2xRaaIpnoNNn3n7NlPxDpjZ81
 tB0jR59Uxs30Ro8HZsDxmftPe2CR1VCQdY4BFNuWROGpAudrounAFf9wFLh+lzkimvZG
 uacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pH7dgy/PEte/5shbJVNiqZ4lGZ8Ek1KPU5FhzTtm05M=;
 b=giR3lZbR3pbq10umvaMS8H4R1yfO8kHyhBG3F4PrQBtWFkguepocB3MAXBch6uY+9a
 WjyjyWZAWnsbkGXvo9g2oVcYVOKeiAr54obkPE+1ijWBpmtR0P+XOinGb7QBsqcZgqq8
 MdQvwY3CNRbeXZDu5tWcHUuCoNXCvLgnXW+FVLMJKisfsQdWT+6S0zPEGSyQIQ9QcMW5
 yPdWzsFE7ofraErY11vWk2WRf1p96yalCLo/g4SwxtW4PbgsAoOTilixghwYxC5J3W8R
 YxP+2SXqDxAg7K65QNyez+YzvFS78AKRVIMtkBrHtmRFxGNZtjr9+J5X4fCPK3DEcOnD
 UjDg==
X-Gm-Message-State: AOAM532rlVVegWjOIAZwArKG5tXJ+HFXs9J9VBXrMmQjuCQvTNSTmWng
 zKxus20hEvXm6NAj3lXXXhssWg==
X-Google-Smtp-Source: ABdhPJycVfJZ0kF39HMlkwwDay9O3WyG+V87+W5YC4UZGBI1yEZn7Qtdm6pfNPt3Wm3SUOuP5AP1yg==
X-Received: by 2002:a05:6512:2251:b0:472:645:2fa5 with SMTP id
 i17-20020a056512225100b0047206452fa5mr8370854lfu.605.1651484499022; 
 Mon, 02 May 2022 02:41:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 t25-20020ac243b9000000b0047255d210fasm658571lfl.41.2022.05.02.02.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 02:41:38 -0700 (PDT)
Message-ID: <95ed686e-e80d-6571-050a-afdb7d22ce2d@linaro.org>
Date: Mon, 2 May 2022 12:41:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
 <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
 <4e308633-cb0d-7050-9ee0-421190683eac@linaro.org>
 <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/05/2022 11:43, Marijn Suijten wrote:
> On 2022-05-02 01:44:20, Dmitry Baryshkov wrote:
>> [sni[
>>> In any case, given that you've already sent this patch and another three
>>> patches [2] fixing/cleaning up the series tells me it's far from ready.
>>> Most of this should just be handled - or have been handled - in review
>>> and amended?
>>
>> During the review time we agreed that [2] would come as a separate
>> change It is an API change that would make using panel-bridge easier,
>> but isn't otherwise required.
>>
>> I have been working towards more logical drm_bridge/drm_bridge_connector
>> chains employing panel-bridge and display-connector where required, [2]
>> is a part of that effort (as well as few other patches that hit
>> dri-devel in the last few days).
> 
> I understand what is going on now.  Since the DSC patches have already
> been queued up in the 5.19 pull I won't hurry to review them; rather
> will go over them when time allows me to play with the many phones here
> that require DSC for the screen to work.  I've been told the series
> didn't result in positive screen output way back in its infancy, but
> I'll re-evaluate and send fixes or improvements if/when necessary.

Sure, thank you!

They work on Pixel3 (sdm845, non-active CTLs, no ping-pong binding to 
intf). I still didn't have time to test them on P4 (sm8150, active CTLs, 
PPs bound to the intf in runtime).

-- 
With best wishes
Dmitry
