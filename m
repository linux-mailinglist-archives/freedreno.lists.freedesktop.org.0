Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9017EE700
	for <lists+freedreno@lfdr.de>; Thu, 16 Nov 2023 19:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252AC10E665;
	Thu, 16 Nov 2023 18:46:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE32C10E667
 for <freedreno@lists.freedesktop.org>; Thu, 16 Nov 2023 18:46:45 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-41cb615c6fbso6380771cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Nov 2023 10:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1700160405; x=1700765205; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=If/44f1KPyVE2d2iqlt11gTcl1EXO2kaaJZBfwh5YxI=;
 b=JtfItmZopGuYyvkL7iJLkMEEkQsxf2JHTNZhJtsyYqegatRNWZB0ZfkXZ64fti4EMM
 fN0Lylp6CHQTPv6lzwKTS4WF9jbW3tcaNQBNhDvbf67LkDVXPnAE2tsIRWzFM7DFoU2M
 giY4KzSJVuQh+jmcx0Voc7W0ROmDPm22CPBUYWy0RRtRwcaR2GI3D0sW7R+5hfyn4Nam
 86zICLb7Tsj7t+gIYWxkf5Z6X51EMPpdPEawiAtTT1BGLdz44HYFDK9Yyo6h9tUMf8tq
 b4rttZRjgaU0x+3+9pGAfxIc+IE2TOrrDHQOT92o35FW6MzuaaaOrXrVejZ60y5eAKXK
 yUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700160405; x=1700765205;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=If/44f1KPyVE2d2iqlt11gTcl1EXO2kaaJZBfwh5YxI=;
 b=AQgpRWQmgvbYQszA9OfoJTmaosORIG/VCHOWcqWlPgiwKaa2l6/Z2vAeQoCKJTmYHR
 4YRAqwKwtge4XJKUIAbgYXEFZ2RnCh6l6PvuiFHBwjFF8OfhB/DCjle/rSjEOy2F6tUJ
 +RiN2mOT9UJt8SAJEMrBBXOZl1DH7b5fiS+mNGhZL3kxEKi6lBjkrSyC5KTVreXCR8gu
 3DLGoDP/YPIogrw7uDCAlELrVHgfnyAkLR1OCkDn09teWg8+UauAbMi1vqRoph4NGzFP
 rjY8DZfNgs/EzWI9/DHsj3xL5gD4bBIlxhmra8GT5iqPA9ILZJHuTKoZA28ULQllkDO5
 GZdw==
X-Gm-Message-State: AOJu0YwX8i1VqCK4g2UtGnyzHIu361G/0k2yTjzV6CoMV/qiSfJ13A7B
 6QjRC9yZkX0xHrFVRZRrwTrA2g==
X-Google-Smtp-Source: AGHT+IFQlwjNqtRd3lxS5p0T5Vg8UQ+JyMTZejmIFz8gVnKZabprGWmddPa0pf0JYS0omO1Kk+ALrQ==
X-Received: by 2002:ac8:7f14:0:b0:419:6954:3ba2 with SMTP id
 f20-20020ac87f14000000b0041969543ba2mr11124161qtk.43.1700160404914; 
 Thu, 16 Nov 2023 10:46:44 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca.
 [135.19.110.125]) by smtp.gmail.com with ESMTPSA id
 w19-20020ac843d3000000b0041991642c62sm4493571qtn.73.2023.11.16.10.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 10:46:44 -0800 (PST)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-5-jonathan@marek.ca>
 <CAA8EJppg=pYh73ncHBCO6Ddv9gG7+WNnpwLYGEv6xEu_3MRNWw@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <ebec534a-4c72-7d33-4c18-4e0b43338568@marek.ca>
Date: Thu, 16 Nov 2023 13:45:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAA8EJppg=pYh73ncHBCO6Ddv9gG7+WNnpwLYGEv6xEu_3MRNWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 4/6] drm/msm/dsi: add a comment to
 explain pkt_per_line encoding
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
Cc: freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/15/23 2:38 AM, Dmitry Baryshkov wrote:
> On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> Make it clear why the pkt_per_line value is being "divided by 2".
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 66f198e21a7e..842765063b1b 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -877,6 +877,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>>          /* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
>>           * registers have similar offsets, so for below common code use
>>           * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
>> +        *
>> +        * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
>>           */
>>          reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
> 
> Should we switch to ffs() or fls() instead?
> 

Just a ffs() on its own can be confusing as well (without the 
information that only powers of two are possible), I think like this is 
better.

>>          reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
>> --
>> 2.26.1
>>
> 
> 
