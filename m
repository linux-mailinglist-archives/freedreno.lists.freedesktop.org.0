Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479174ABB5
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 09:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488E910E516;
	Fri,  7 Jul 2023 07:18:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D8A10E516
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 07:18:13 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31441dfbf97so1676518f8f.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 00:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688714292; x=1691306292;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bCwoi876EKAecpckR+Py42F8u1vBxeSlNz7kEWIyaPc=;
 b=YLKJOTomKcga8LSNNYm85p5UwI/HaFsuSIZCISBbizjNSIKpY9hx4rkXXuKCZpntpf
 QUlXQ4+E+qj6AxUyZN9dntFfLu1W629l5zcjyC8miXsC1Y2mCefx77iYdYXAmbiAVP9U
 FKiAF+NeYGlIVMSTBKC5yAeuGyICL0O2dAW7pqDiLZC6RR9X9JrxMXA9Kquyx0zXJsxg
 UQS/ERBrOcdah16s/MInX5npjzhXKmoLsOurH+8Xz+dWaXa+Ue7ryXLlb437owv2Hncv
 hmJ6XiXtkP8qdilVXTO4lYmDOeSSrUb4F9dS1999wmJO0P13RJGDLhxLjy7NCEc350Sn
 fDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688714292; x=1691306292;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bCwoi876EKAecpckR+Py42F8u1vBxeSlNz7kEWIyaPc=;
 b=IZ2DuINdkAEBtb1cRDHa7zeNpjaCHfrAYm88c4r0E04fnKZfZyubllMHxgmqVJ3mNH
 R6xzegDzy7jbhQucttna5izhWbmhorU5hVGRGVLdOfJGKly0JG507LbNbLB1m5QLgHOG
 45n8KuQn7Zfh2OOBpVzLlpJyZU7tOP7uj9WOlB1hg9lJEJ5U9IsRu3YD5dTFDyEcoraN
 wmPiTTCpad+DLy4C+VuAhG8oQpOcXhz4SwKjnm3GvRuYlK5hyJNPKgQM+wUBjJ7phDAD
 +3tiR2Cl06kZkX3n/XxPsHBhOOI3daofUEeDJ6rKozU3/9USSvfKdW0tTOUBri2GFKA+
 qtWw==
X-Gm-Message-State: ABy/qLaIXNhxchv7X6yDXkiLW1MuIHfLwDxxGWJp56mykelmFwYaCQEx
 x3gHUxHYMZ/AG28AgXPLU0p+vw==
X-Google-Smtp-Source: APBJJlG3Ohe9X+Ts1DuAivOoFi5TO38wSn/K9J8fgqQll2hX5uulv+S6/VxxHVszDAStVbcil2+KVA==
X-Received: by 2002:adf:e550:0:b0:314:2e77:afec with SMTP id
 z16-20020adfe550000000b003142e77afecmr3593733wrm.57.1688714292009; 
 Fri, 07 Jul 2023 00:18:12 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 k6-20020adfd846000000b00314315071bbsm3699097wrl.38.2023.07.07.00.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 00:18:11 -0700 (PDT)
Message-ID: <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
Date: Fri, 7 Jul 2023 09:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Amit Pundir <amit.pundir@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 2/2] drm/bridge: lt9611: Do not generate
 HFP/HBP/HSA and EOT packet
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
Reply-To: neil.armstrong@linaro.org
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Michael Walle <michael@walle.cc>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On 06/07/2023 11:20, Amit Pundir wrote:
> On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> [Adding freedreno@ to cc list]
>>
>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>
>>> Hi Amit,
>>>
>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>>>>
>>>> Hi Marek,
>>>>
>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>> EOT packet, as these packets are not required. This makes the bridge
>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>
>>>> This patch broke display on Dragonboard 845c (SDM845) devboard running
>>>> AOSP. This is what I see
>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>> Reverting this patch fixes this regression for me.
>>>
>>> Might be msm dsi host require proper handling on these updated
>>> mode_flags? did they?
>>
>> The msm DSI host supports those flags. Also, I'd like to point out
>> that the patch didn't change the rest of the driver code. So even if
>> drm/msm ignored some of the flags, it should not have caused the
>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>> additional programming is required to make it work with these flags.
> 
> I spent some time today on smoke testing these flags (individually and
> in limited combination) on DB845c, to narrow down this breakage to one
> or more flag(s) triggering it. Here are my observations in limited
> testing done so far.
> 
> There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
> alone and system boots to UI as usual.
> 
> MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in the
> screenshot[1] shared earlier as well.
> 
> Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
> MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
> with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
> display as reported.
> 
> In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
> added in this commit break the display on DB845c one way or another.

I think the investigation would be to understand why samsung-dsim requires
such flags and/or what are the difference in behavior between MSM DSI and samsung DSIM
for those flags ?

If someone has access to the lt9611 datasheet, so it requires HSA/HFP/HBP to be
skipped ? and does MSM DSI and samsung DSIM skip them in the same way ?

Neil

> 
> Regards,
> Amit Pundir
> [1] https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg
> 
>>
>> --
>> With best wishes
>> Dmitry

