Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8AD68DC43
	for <lists+freedreno@lfdr.de>; Tue,  7 Feb 2023 15:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343D910E110;
	Tue,  7 Feb 2023 14:57:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C640C10E0D5
 for <freedreno@lists.freedesktop.org>; Tue,  7 Feb 2023 14:57:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id ba1so9765923wrb.5
 for <freedreno@lists.freedesktop.org>; Tue, 07 Feb 2023 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=wFeDxVlcRx/JfkqGcUz6Ws64LZbVqrdBEE9QOFXCTsk=;
 b=IfjcDk6eXvALTnsWtg5t/vxNs6iCClgkOlFrNsNpt+Umobc4gFmfGubvvzncA97ljP
 BwnChs4pgZr1VN1yv01zef+A1WSF4LSE5KRpnsYOwPV/b7keY+CdZPdlOwXpzrnmdwd6
 qelk014Ez8HStia5JoXu2ghiftVS/3vj89Oi/l5mO0P/kyvBQ/aLEiYBvoQlYqAZ6RPG
 hqD356Lxf2jrl7eV3lEfJTXTLxwEqmSEcdRILhsXHdKH4D+j9rygF+hTeSjExjLaJa4b
 xJ8cOUjJYpzrwGDj81+ODozGDFT851lZNhntRaOggzaEFQ7dkWYzhJMJyaOlNi/rBUZB
 qR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wFeDxVlcRx/JfkqGcUz6Ws64LZbVqrdBEE9QOFXCTsk=;
 b=u2fexTY4dDgMDyzh7gPQym3WZC/9US4EQT0BOjOUz5Yh/Y+wklvwIzH2AHo2FPbV+Y
 +Ux2XB/p9ESrvFcAaVD0YkcG/BlK28dtgTrpadklAT8A/xq+nXMoF70DQi16bP5oRhee
 67Sp43c4fm1l87+84WAaFS/I2i21FNBpzHnapqjL3XIgUUsCrucZHbyIeSqCZZ6v7GS+
 4uTBfH+4WO53NDUmYTxJYg/4P/56JJ+MaBWI7hhrYgnQnXRxRe1tkT8lBM+3sfpmUwBi
 kx1A+CdouW6jltFGtA+RvQRuSXZZEt1Yui0X6lMTcevFChlx6dVlM2Em7Javo3sdPeIK
 W1QQ==
X-Gm-Message-State: AO0yUKWUzAaxoEieZbpet3hCGD5yK3mll1xDVUiKHm7z0PCpqZJ2G8Md
 +eMXjJKncWd8gVjUjQVkTU82wA==
X-Google-Smtp-Source: AK7set88XjH0IQZ8n4gZYW4VEGKeL6j0RoN0HiHlNdp24teYiAhMskmRZdj/kLoX4cSkdz34tUcCWQ==
X-Received: by 2002:a5d:4452:0:b0:2c3:f2a3:c37c with SMTP id
 x18-20020a5d4452000000b002c3f2a3c37cmr3071772wrr.9.1675781835305; 
 Tue, 07 Feb 2023 06:57:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3?
 ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adffbd0000000b002c3ea5ebc73sm4840538wrs.101.2023.02.07.06.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:57:14 -0800 (PST)
Message-ID: <6b0b619e-3ded-a09d-b751-21f3c70fa2cb@linaro.org>
Date: Tue, 7 Feb 2023 15:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
 <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
 <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
 <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
 <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
 <CAMuHMdUgtiuxJ9dnjcGy77onHtrhabT5krJMp2XSr4KOD31ydQ@mail.gmail.com>
 <31b5a693-d9e6-1c21-9fa7-32abc431a46d@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <31b5a693-d9e6-1c21-9fa7-32abc431a46d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 0/7] drm/bridge_connector: perform HPD
 enablement automatically
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
Cc: dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>,
 David Airlie <airlied@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Tomi Valkeinen <tomba@kernel.org>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Geert,

On 07/02/2023 14:30, neil.armstrong@linaro.org wrote:
> On 07/02/2023 11:19, Geert Uytterhoeven wrote:
>> Hi Neil,
>>
>> On Tue, Feb 7, 2023 at 11:02 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Tue, Feb 7, 2023 at 10:59 AM Neil Armstrong
>>> <neil.armstrong@linaro.org> wrote:
>>>> On 07/02/2023 10:40, Geert Uytterhoeven wrote:
>>>>> On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>> On 10/01/2023 08:57, Laurentiu Palcu wrote:
>>>>>>> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
>>>>>>>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
>>>>>>>>> It looks like there are some issues with this patchset... :/ I just
>>>>>>>>> fetched the drm-tip and, with these patches included, the "Hot plug
>>>>>>>>> detection already enabled" warning is back for i.MX DCSS.
>>>>>>>>
>>>>>>>> Could you please provide a backtrace?
>>>>>>>
>>>>>>> Sure, see below:
>>>>>>
>>>>>> I wondered, why didn't I see this on msm, my main target nowadays. The
>>>>>> msm driver is calling msm_kms_helper_poll_init() after initializing
>>>>>> fbdev, so all previous kms_helper_poll_enable() calls return early.
>>>>>>
>>>>>> I think I have the fix ready. Let me test it locally before posting.
>>>>>
>>>>> Is this fix available?
>>>>> Do you have a lore link?
>>>>
>>>> The fix at [1] has been applied on 2023-01-26
>>>>
>>>> [1] https://lore.kernel.org/all/20230124104548.3234554-1-dmitry.baryshkov@linaro.org/
>>>
>>> Applied where? linux-next does not have it.
>>
>> commit cbf143b282c64e59
>> ("drm/probe_helper: extract two helper functions") in next-20230127
>> next-20230130 next-20230131
>> commit d33a54e3991dfce8
>> ("drm/probe_helper: sort out poll_running vs poll_enabled") in
>> next-20230127 next-20230130 next-20230131
>>
>> but not in any later version?
> 
> $ git log --oneline --author=dmitry next-20230207 drivers/gpu/drm/drm_probe_helper.c
> c8268795c9a9 drm/probe-helper: enable and disable HPD on connectors
> 78b991ccfa64 drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
> 
> $ cat Next/SHA1s | grep drm
> drm-fixes       4ec5183ec48656cec489c49f989c508b68b518e3
> drm-intel-fixes 4c7b9344cadbed477372c75e3c0a8cfd542f5990
> drm-misc-fixes  8f20660f053cefd4693e69cfff9cf58f4f7c4929
> drm             1c0db6d84f8e0ac8f14178f13250e36ebcf457ee
> drm-misc        d20a8f409259f1782f080b434054854020878f23
> drm-intel       155c6b16eec2eaaaf6c71abf2d5e71641770d7ba
> drm-tegra       b9930311641cf2ed905a84aabe27e8f3868aee4a
> drm-msm         dbd7a2a941b8cbf9e5f79a777ed9fe0090eebb61
> drm-msm-lumag   1d233b1cb149ec78c20fac58331b27bb460f9558
> imx-drm         927d8fd465adbaaad6cce82f840d489d7c378f29
> 
> so weren't merged into drm-misc, I'll ping Thomas & Maxime on irc.

Thomas just told me the commits were cherry-picked into drm-misc-next-fixes
and should appear on tomorrow's linux-next tree.

https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-next-fixes&id=91f43949662c9eb4a443203a188e806df8290bc9
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-next-fixes&id=a4e771729a51168bc36317effaa9962e336d4f5e

Neil

> 
> Neil
> 
>>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>> -- 
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                  -- Linus Torvalds
> 

