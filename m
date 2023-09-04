Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEDB791AD9
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 17:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2C210E38C;
	Mon,  4 Sep 2023 15:49:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981FC10E38C
 for <freedreno@lists.freedesktop.org>; Mon,  4 Sep 2023 15:49:05 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-500aed06ffcso2483575e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 04 Sep 2023 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693842543; x=1694447343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Mr4a2ALFhDpVZdNIQ8Ux/W/wDhbSFit8lx1g0WE8sQ=;
 b=JOSfxCun/+vRTTNPuVPAuyFJeSIyRhid6dbAOo45tmpuMCgj5iOASZhN71Nxbev1XS
 oCP9B2y3jymMzhlBqexTNzy8FqOYPNLDJUgFT7wVrvUR5YWU1fZKmcAOm1iqJLLS3h+y
 axARp/Ls0ntcw+8aRVEwImcDpNUS0XRO3svG1NZgyToS3XvbKW/zs1ZLhxbhrZY6klMv
 HgBqwSsihFsttAmlWkx8zYB3RFSW+1NfzyYBNRBpYGHIvQLpATDJORd2D6gBxR0AtwCa
 LGhC23WGctFPUI0CRzNFfVokCU5kah11BbL/tiquIH5MZk8t1pPfJaLf0dDjI1NfK02k
 oNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693842543; x=1694447343;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Mr4a2ALFhDpVZdNIQ8Ux/W/wDhbSFit8lx1g0WE8sQ=;
 b=TyC0wDiLTIMGAiuQ9lC1NfLn/9N/HKsdzydgMr2+4qRsT5IkmbNoSzw8l66gwP8jNl
 u6y+TlO7zvEvyZCEhXbeRoVN0DcD6EK17639dWAL9bjU9sUb/MN23lfgJBcVeJ3rSA5J
 6EvhmGGdI1S+woBJEyosM+IPCvn29agIDoB3+BALRX3Oi/RI+e6B0wJVZ0jpNAT7xQXQ
 iR0wtaUqYtnqa2QbhS3cEA/9LEy4OiWYe2FA50qZdwUpVLOWwJqbXYpJBsr/AejvfMqV
 13ibkomJ6YaN5+1j4u9IONK3ySud5hSJ/rUTNcfnEVvjVdSaKBlFJh7sTW6sTdvQk8L0
 2crA==
X-Gm-Message-State: AOJu0YxPlwSZqPo18YRIiPG1P26jo6jPklLaErkRTdDqzEQX3Ld4GmEJ
 25KhyNMvjrYARduZoR9yXnJJFQ==
X-Google-Smtp-Source: AGHT+IE4v4l6ymY3DjZh2dEcApIj4aqYKl5Mc+y05e23cKNGlbJ9nuy4qF058Dp4ZWgy6wbza5M/ZA==
X-Received: by 2002:a05:6512:3446:b0:500:12c6:c91b with SMTP id
 j6-20020a056512344600b0050012c6c91bmr6396413lfr.40.1693842543157; 
 Mon, 04 Sep 2023 08:49:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u11-20020ac2518b000000b005009920b6afsm1791519lfi.9.2023.09.04.08.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 08:49:02 -0700 (PDT)
Message-ID: <11765348-1d5c-41aa-babc-7c6da68cd9f1@linaro.org>
Date: Mon, 4 Sep 2023 18:49:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bjorn Andersson <andersson@kernel.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <tsvdc6jm7rtnqjcygn7lhzspheomqbwjejoastr7kcfs22btdr@gy2s57cuwsxy>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <tsvdc6jm7rtnqjcygn7lhzspheomqbwjejoastr7kcfs22btdr@gy2s57cuwsxy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v1 00/12] drm,
 usb/typec: uABI for USB-C DisplayPort connectors
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/09/2023 18:46, Bjorn Andersson wrote:
> On Mon, Sep 04, 2023 at 12:41:38AM +0300, Dmitry Baryshkov wrote:
>> During the discussion regarding DisplayPort wrapped in the USB-C
>> connectors (via the USB-C altmode) it was pointed out that currently
>> there is no good way to let userspace know if the DRM connector in
>> question is the 'native' DP connector or if it is the USB-C connector.
>>
>> An attempt to use DRM_MODE_CONNECTOR_USB for such connectors was
>> declined, as existing DP drivers (i915, AMD) use
>> DRM_MODE_CONNECTOR_DisplayPort. New drivers should behave in the same
>> way.
>>
> 
> Sorry, didn't see the commit message before posting my complaint about
> USB -> DisplayPort.
> 
>> An attempt to use subconnector property was also declined. It is defined
>> to the type of the DP dongle connector rather than the host connector.
>>
>> This attempt targets reusing the connector's PATH property. Currently
>> this property is only used for the DP MST connectors. This patchset
>> reuses it to point out to the corresponding registered typec port
>> device.
>>
> 
> Still interested in understanding how the path string should look like.

As wrote in the other letter, on RB5 it is 'typec:port0'. If the machine 
has two Type-C ports and two connected DP blocks, one of them will have 
'typec:port0', another one 'typec:port1'. This way one can further look 
under /sys/class/typec/portN/physical_localtion/ and find corresponding 
location, etc.

> Is the path expected to be consumed by machine, or is it only there for
> human convenience?

As with DP MST it is expected that userspace will consume this 
information, possibly renaming the connector. For example, on my laptop 
I have DP-1, ... DP-5 connectors (with DP-2 -- DP-5 being DP MST ones). 
Xorg renames them to DP-1, DP-2, DP-1-1, DP-1-2, DP-1-3, because the MST 
ones are branches for the DP-1.

-- 
With best wishes
Dmitry

