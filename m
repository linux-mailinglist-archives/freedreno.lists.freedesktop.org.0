Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2E487243
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 06:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDFF1131D4;
	Fri,  7 Jan 2022 05:26:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CA61131D4
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 05:26:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bp20so11631264lfb.6
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 21:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a74v7f2Hv+IdP7z/eazwaJeILmDVIwPUMnvFevEv50o=;
 b=h/3VkUo9knDx+Rc/FxFMShrZTCS4vYa/9S1YN3FvnyogzeWCn9b/X4/RRr6UyHZ3LD
 YB7yaCkQoFw+/zg0cTpEqRro8Yr9i+9CoZEAp9yyYuobFi5/gTJ/y84mJyJ2lDtp9xfS
 y5FwyGMqQJkvrjCRqngOxvZr86JUgFVwHHcVbYNWoxZd+MUIUsF1AC1aXe/J0NW0OVpQ
 8u/XncJbdsgaLZTCRwFCKjJ6KKAWx9WYZJmRJnJGv9vIpewSDojvcw9QYtlH7Zc6D+ZA
 pgsusL51TOgIXaI7WVjYzD7kkPgLLrTitybrBffGfZke9rnwCpn7koF9GbL+AZezAT4U
 s6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a74v7f2Hv+IdP7z/eazwaJeILmDVIwPUMnvFevEv50o=;
 b=MT250Neglxsud86UbIvyU0hGzqXISBlY0/xgYK+d1xFtdIA76FMQebFPoasyVTox3E
 OfwOV1ecGR8RL1jR2xaiXxc926hSD+AAZEkZUnhI1/MfuiYkOggxXuYhOREfvgGhfq6g
 U5uHSB8TCSkAhsZI7mG2CKV5E8MCsjtsRu80Fhh0HGuqFoZ85BN4qph/Hw4U8fF55oKd
 y2NqFE2mqu132ZjzcWqqYXoGjAwHrzQe3VVzjztGVMJiahq9rxrswc9vcA157+ZcsRnx
 IgTgM2VoqJqOvFcKVyNXB5Li9bCu/a7FB4QX0oUVgA0STCnII4PINAyJycEEu/tBj7W0
 n/Yw==
X-Gm-Message-State: AOAM5331rMz51tE3kvgaAZgoXf3ykyH+SZkTruKepXUPzb4FccMsb+GK
 3AhvnmHxcsVMqNIqrDdJYi3M1Q==
X-Google-Smtp-Source: ABdhPJzZ8pnVj1Q3UCYFQ8g4E+bQPTlPKB7qjdHEzzD5Cp6cloL6Q6CSqnGQB4vIirxvKUvj4pym7g==
X-Received: by 2002:a05:6512:33ca:: with SMTP id
 d10mr53900180lfg.431.1641533191684; 
 Thu, 06 Jan 2022 21:26:31 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g5sm439133lfj.33.2022.01.06.21.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 21:26:31 -0800 (PST)
Message-ID: <a97cec56-5a8d-2b92-2850-af2a6d3fbf09@linaro.org>
Date: Fri, 7 Jan 2022 08:26:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
 <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 2/7] drm/msm/dp: support attaching
 bridges to the DP encoder
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/01/2022 06:42, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-06 18:01:27)
>> Currently DP driver will allocate panel bridge for eDP panels.
>> Simplify this code to just check if there is any next bridge in the
>> chain (be it a panel bridge or regular bridge). Rename panel_bridge
>> field to next_bridge accordingly.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 26 ++++++++------------------
>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
>>   5 files changed, 13 insertions(+), 23 deletions(-)
> 
> I like this one, it certainly makes it easier to understand.
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
>> index a7acc23f742b..5de21f3d0812 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
>> @@ -307,11 +299,9 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
>>          if (rc)
>>                  return rc;
>>
>> -       if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> 
> It feels like this is on purpose, but I don't see any comment so I have
> no idea. I think qcom folks are concerned about changing how not eDP
> works. I'll have to test it out locally.

Ah, another thing that should go into the commit message.

Current situation:
- DP: no external bridges supported.
- eDP: only a drm_panel wrapped into the panel bridge

After this patch:
- both DP and eDP support any chain of bridges attached.


While the change means nothing for the DP (IIUC, it will not have any 
bridges), it simplifies the code path, lowering the amount of checks.

And for eDP this means that we can attach any eDP-to-something bridges 
(e.g. NXP PTN3460).


Well... After re-checking the source code for 
devm_drm_of_get_bridge/drm_of_find_panel_or_bridge I should probably 
revert removal of the check. The function will return -ENODEV if neither 
bridge nor panel are specified.

> 
>> -               rc = dp_parser_find_panel(parser);
>> -               if (rc)
>> -                       return rc;
>> -       }
>> +       rc = dp_parser_find_next_bridge(parser);
>> +       if (rc)
>> +               return rc;
>>
>>          /* Map the corresponding regulator information according to
>>           * version. Currently, since we only have one supported platform,


-- 
With best wishes
Dmitry
