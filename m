Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DBA7FD17A
	for <lists+freedreno@lfdr.de>; Wed, 29 Nov 2023 09:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CE610E19B;
	Wed, 29 Nov 2023 08:58:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD8410E195
 for <freedreno@lists.freedesktop.org>; Wed, 29 Nov 2023 08:58:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50aab20e828so9126141e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 29 Nov 2023 00:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701248281; x=1701853081; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=GHnCYf5RXf0vnemvHjAASp0ZNFRzPFmZNLDDXI6AIJ8=;
 b=hULZVjqAPakUkK4yt8qLF8lwQMAt2d/ybxxHUoTUh/2h4y6ch51GMN5OFxq01lRZZd
 HwTJisvvHGqdZTYT78e9kg5XZUc7pnR2BJt3bwo8HX0C/ylBl7tgx2BijOgAuPQLRZcW
 L7/y5aHZ4EyOqLTLHkrBMHKRlomfoJSmfVHqXv4V+ajpwxFriqMysopyQJ1RjEQYy4IK
 tlpmkNXaZMqlJX1Ud2ZhN9eEfYbXGS3tqECbR7kh5MNDD8dzLg7NDP7fCPZRXyYy9M/T
 xclrKV3vVGzwYcn0sVDGWqwQzG3cqDVRjlOggcoiPx3MS+Va4DBo+0yB9qtpxV/kgrVV
 r3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701248281; x=1701853081;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GHnCYf5RXf0vnemvHjAASp0ZNFRzPFmZNLDDXI6AIJ8=;
 b=Epp+REZUcIG9n6dFThzJb5NRI0sZzJHiqSGL/t8hmzUewLoBARHTdxlHR1S7vXuvkK
 OENiRWYcOeYrmoGgP3CdKgVVFdPx5ZPyuH9lqpun6RXzvIVmSeHQh7Mw9PCAldInWMWG
 1wtaOI40p2FK0f3UpX2uKpfa2jxDn7PRZnml7IeMajhTUxrv2Z0qdlhu74/yAlrDbg4q
 RJH+05RyQiN/DvuXod3uyC+Lzt2N5wGN6fKSUdju+xxKb9EKNBz+LVA4Qd2lzlapAC4z
 ewEiJQcWClTT+oWIAL+kvMAXpMQcZQrhSfmGFkT4HH1KoxnQtrOmuSuyKBuVZKHAXIDH
 NXkw==
X-Gm-Message-State: AOJu0YwX9P/qxnFyOeGaSPmF0t6kQgGjq6TG898ggTsgYQ11Z9tSV2k4
 qv4r/hvg+yH2LcKEIBsDwAXD0Q==
X-Google-Smtp-Source: AGHT+IEpFy4SsBbo+NV+dsYz0ZIdoJ4/9PFs472GQ0RzOrjG0O3I1kYCYGngfcJXScDbD5z0yA1Zpg==
X-Received: by 2002:a05:6512:33cd:b0:50b:bc9a:b8b with SMTP id
 d13-20020a05651233cd00b0050bbc9a0b8bmr3673264lfg.28.1701248281399; 
 Wed, 29 Nov 2023 00:58:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c?
 ([2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c139300b0040b540ff0a5sm1058902wmf.19.2023.11.29.00.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 00:58:00 -0800 (PST)
Message-ID: <63cc17a9-d28d-43e3-9e04-249534a96d38@linaro.org>
Date: Wed, 29 Nov 2023 09:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>
References: <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
 <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
 <1696f131-83fb-4d0c-b4d7-0bdb61e4ae65@linaro.org>
 <mxtb6vymowutj7whbrygwlcupbdnfqxjralc3nwwapsbvrcmbm@sewxtdslfoen>
 <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <2z3yvvtd6ttsd7qw43sl5svtfijxevdr6omxxmws64k6l5qv55@5nnh2b32h2ep>
 <2023110704-playback-grit-7a27@gregkh>
 <hkzoi4sazufi5xdgr6hacuzk72cnbtmm6dwm2bzfgwh5yij6wj@2g4eb6ea4dgd>
 <2023110704-deem-jigsaw-0bbf@gregkh>
 <kuzbg4a52onojyfh2cc7h7c4iruzfbbbo2lm2jve72rnrpfk6f@2hars5pwujg3>
 <20231108155836.GB21616@pendragon.ideasonboard.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231108155836.GB21616@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 03/10] drm/mipi-dsi: add API for manual
 control over the DSI link power state
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/11/2023 16:58, Laurent Pinchart wrote:
> On Wed, Nov 08, 2023 at 04:34:39PM +0100, Maxime Ripard wrote:
>> On Tue, Nov 07, 2023 at 04:26:34PM +0100, Greg Kroah-Hartman wrote:
>>> On Tue, Nov 07, 2023 at 01:18:14PM +0100, Maxime Ripard wrote:
>>>> On Tue, Nov 07, 2023 at 12:22:21PM +0100, Greg Kroah-Hartman wrote:
>>>>> On Tue, Nov 07, 2023 at 11:57:49AM +0100, Maxime Ripard wrote:
>>>>>> +GKH
>>>>>
>>>>> Why?  I don't see a question for me here, sorry.
>>>>
>>>> I guess the question is: we have a bus with various power states
>>>> (powered off, low power, high speed)
>>>
>>> Great, have fun!  And is this per-device or per-bus-instance?
>>
>> Per bus instance
> 
> To be precise, those power states are link states. They don't
> necessarily translate directly to device power states, and they're not
> so much about power management than speed (and bus turn-around for
> reads) management.

So the DSI core should support handling and tracking the current DSI
link state, and DSI devices should be able to request for a particular
link state.

> 
> Also, while DSI allows for multiple peripherals on a bus, the link is
> point-to-point, with the peripherals being all behind a single DSI RX. >
>>>> low power is typically used to send commands to a device, high speed to
>>>> transmit pixels, but still allows to send commands.
> 
> Low power (LP) is a link state where commands can be transmitted at a
> low speed, as opposed to the high speed (HS) link state that is used to
> transmit both video data and commands at high speed. Any device-to-host
> data transfer (in response to read commands) occurs exclusively in LP
> mode (at least with DSI v1.3, I don't have acces to newer
> specifications).
> 
>>>> Depending on the devices, there's different requirements about the state
>>>> devices expect the bus to be in to send commands. Some will need to send
>>>> all the commands in the low power state, some don't care, etc. See
>>>> the mail I was replying too for more details.
>>>>
>>>> We've tried so far to model that in KMS itself, so the framework the
>>>> drivers would register too, but we're kind of reaching the limits of
>>>> what we can do there. It also feels to me that "the driver can't access
>>>> its device" is more of a problem for the bus to solve rather than the
>>>> framework.
>>>
>>> This is up to the specific bus to resolve, there's nothing special
>>> needed in the driver core for it, right?
>>
>> Yeah, we weren't really looking to handle this into the driver core, but
>> rather if there was a set of guidelines or feedback on implementing
>> those kind of features for a bus.
>>
>>>> Do you agree? Are you aware of any other bus in Linux with similar
>>>> requirements we could look at? Or any suggestion on how to solve it?
>>>
>>> There might be others, yes, look at how the dynamic power management
>>> works for different devices on most busses, that might help you out
>>> here.
>>
>> Thanks for the pointers, we'll have a look
> 

