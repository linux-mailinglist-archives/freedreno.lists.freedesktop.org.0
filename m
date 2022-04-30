Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4165515FA0
	for <lists+freedreno@lfdr.de>; Sat, 30 Apr 2022 19:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4AD10E260;
	Sat, 30 Apr 2022 17:39:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1BC10E260
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 17:39:12 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j4so19018960lfh.8
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PJUZmqtC/NlHzYBP/fTYOLhJquf+nkTxythqoIbiJuM=;
 b=pd1meebuNyXZNSecDYOignWtnc4uipjWvxFVlqwUedoes11qQYqEUl9XeZ4L7Skj3t
 bLLLLu2wiGS6Cs0JoyCGacW6QOGboQ41b+SY9PYZXeNRjdtE1j2SMREQnjml6+N7IYzk
 PBfcaDqxY1h0MCi0KzIUq9r6DG6YsQupIFvCaOEBgVu9Cm4L0+T3uH2cGDnllzeTqDXU
 gqvZzVGAPULEuUYHszaJjNXXqTo0QNuudXw/28OZD68EAmaFaBroBsrDk5WMjqNKx7j8
 vSQZPVHMZsjE599NJs1tD5I4dQ3gF+RKnkcLW8Bzadp25d/77/lE/N1PekRlxmOEoPeA
 AqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PJUZmqtC/NlHzYBP/fTYOLhJquf+nkTxythqoIbiJuM=;
 b=V5ttXupGhQvt8HmjNrCXxxdn5WPpr9adm+ggnSaaYHybhEZE2HxMF9v3yl7PFMavid
 YdUyIk7pGH7/y/Gk+8mjyl3YWGBF/Yl7t6LnI8o30c0s/Yq4my/cy7Rg1ok4v6PVzZM5
 Z9pJiMwWvEpN2eVQ1+V01Tz+pz9lnUMyxG2nfHZbrbwYLdauHHJ2FHkffUIXC0I9iQbu
 FowMCnRh2zVk1fo0hx4n7Kv01xj+E3/lJ71NQ/dNHOwRf5caAg04yZlsCUV4wE5r/Lx+
 I+lN4C1cO7to4ktQsZVoH+f6gYG8HFgRqCwy9i4vRUtXe/M1jLFl3ea2YdPSpkDglPit
 jnFg==
X-Gm-Message-State: AOAM530jgpQLbnsDU+z8CYYApgowT6jXImiWX2B1E9S3zGXDcryHr2m+
 jNk4m/sqIti/cJayg4h/YZWUew==
X-Google-Smtp-Source: ABdhPJyE49bxeXuAVwnhwbGgtx0PpXMHqSkwfcWTqNFrKFCTOstMHHYjG2ux6kczABK3kiJkuT6HfA==
X-Received: by 2002:a19:c511:0:b0:471:fc54:8a5 with SMTP id
 w17-20020a19c511000000b00471fc5408a5mr3676482lfe.454.1651340350988; 
 Sat, 30 Apr 2022 10:39:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a2e8e25000000b0024f3d1dae89sm589670ljk.17.2022.04.30.10.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 10:39:10 -0700 (PDT)
Message-ID: <d80dea48-5618-95be-67a4-e6ba12b4d05e@linaro.org>
Date: Sat, 30 Apr 2022 20:39:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220430081101.3763847-1-dmitry.baryshkov@linaro.org>
 <37f83a5e-a966-3da3-ea32-3478f77e98e8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <37f83a5e-a966-3da3-ea32-3478f77e98e8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: use RMW cycles in
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/04/2022 18:16, Abhinav Kumar wrote:
> 
> 
> On 4/30/2022 1:11 AM, Dmitry Baryshkov wrote:
>> The downstream uses read-modify-write for updating command mode
>> compression registers. Let's follow this approach. This also fixes the
>> following warning:
>>
>> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 
>> 'reg_ctrl' set but not used [-Wunused-but-set-variable]
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index c983698d1384..a5619ad82a53 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -961,10 +961,12 @@ static void dsi_update_dsc_timing(struct 
>> msm_dsi_host *msm_host, bool is_cmd_mod
>>           reg_ctrl = dsi_read(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
>>           reg_ctrl2 = dsi_read(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
>> +        reg_ctrl &= ~0xffff;
>>           reg_ctrl |= reg;
>> +        reg_ctrl &= 
>> ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
> 
> Shoulnt this be
> 
> reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
> 
> You seem to have used reg_ctrl which is wrong.
> 

Yes. Dummy c&p. I'll post v2 asap.

>>           reg_ctrl2 |= 
>> DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
>> -        dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
>> +        dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, 
>> reg_ctrl);
>>           dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, 
>> reg_ctrl2);
>>       } else {
>>           dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);


-- 
With best wishes
Dmitry
