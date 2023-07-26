Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3972976415D
	for <lists+freedreno@lfdr.de>; Wed, 26 Jul 2023 23:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B3E10E4BF;
	Wed, 26 Jul 2023 21:45:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1454010E4C2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 21:45:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe0bb9500aso443443e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690407930; x=1691012730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OI9rfaCd8Sb0V/MSoJvSxIu6W33z9/KDlVvMfFsQ31U=;
 b=IGutNdAdDqmmW8BuVEtVQG2sY2tZ7vYpmRHmP20glt9uf9fQcQG+Z8Y51xZlIlJbBz
 BUKBnCkGPwvbQaz5g+VFz7yk1z8VLcb93vWi9c8xc77nfwg/hYaNzA8h1pxn9QJ540n1
 y0gPqHnhWjVGnxjw7F2YJQGQ/cmOeqwg21lXml08D/nEA01gP0BJ2f1miI3sMvNc8LMv
 SjWdXZE8V94FwtoaduKOQgyAdNs0cHAnxf9jPgaqy1k5GInNqY8lGSwN2SlfFzuVBDwi
 nqHCyJbBjY5neoBRA0A8uGWSGgTUG00WO29wJm9cgOG13xkniC8QjCdXDzsJE1Fl22ew
 vHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690407930; x=1691012730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OI9rfaCd8Sb0V/MSoJvSxIu6W33z9/KDlVvMfFsQ31U=;
 b=G4F9BcM+zVZdPOuIKDbEoA+8fkvnH9+ZELsVVAA3v/XA01J+5wQWpllxVK4msfyxwJ
 8KWjZlIqYpqXug7ro68R6/LGXNLneA/fcwV4f5cJNLbSdBvCOoBuSIV4LZ5bl/4PDCzD
 VN2r4gP5k7deQv0K2nsbQgAgLljQCb9GW0hcAoz6Bk/B4rorWzDSzpLgcShiiSjOn01Q
 eWuePO+as2LlxY+190idR76sYpnchGn671nm98/Yf67AHmEWW4qCV6DY5o4E4A63pU10
 iw7VyRUTePxfKRtE180hqv8Yx6uo9l0hrCXyom9CNy/3qXkyT+QWeVknyysKMTzF/x0e
 AjWA==
X-Gm-Message-State: ABy/qLb14bdUmhSWoCqb5W9tpVs/REbXDpiim6GbcTlfX8v5A8FDyUOA
 kbjygMvzimIPheYA6JwwudtHlea79GLkB7FzQQc=
X-Google-Smtp-Source: APBJJlGEMliqQqZmf6e7t7gnzFcTrok+yCdeHlSTbva+vvcK1+HpVnAcDQsqUNp8JJIACffMd9u+Rg==
X-Received: by 2002:a19:504c:0:b0:4fd:f7a8:a9f3 with SMTP id
 z12-20020a19504c000000b004fdf7a8a9f3mr309758lfj.38.1690407929699; 
 Wed, 26 Jul 2023 14:45:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d13-20020ac25ecd000000b004f9c44b3e6dsm2545lfq.127.2023.07.26.14.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 14:45:29 -0700 (PDT)
Message-ID: <f37d1a3e-93a0-c9f1-59c6-963fe7e27a22@linaro.org>
Date: Thu, 27 Jul 2023 00:45:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-13-robdclark@gmail.com>
 <ab9f2c65-deb4-1762-4a32-a7046608311e@linaro.org>
 <CAF6AEGtqw0Pj42jucV7H==81WckYQZxBLSwb_ksB+=6pFmC6fQ@mail.gmail.com>
 <b9806e33-2094-dd4b-ec63-06dd8dbbd224@linaro.org>
 <CAF6AEGvGUpte3KJqXE=dVrTf873XZ61xkgeQj+CxRTweETBxyQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGvGUpte3KJqXE=dVrTf873XZ61xkgeQj+CxRTweETBxyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 12/12] drm/msm/adreno: Switch to chip-id for
 identifying GPU
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/07/2023 00:44, Rob Clark wrote:
> On Wed, Jul 26, 2023 at 2:38 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 27/07/2023 00:37, Rob Clark wrote:
>>> On Thu, Jul 6, 2023 at 8:45 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On 07/07/2023 00:10, Rob Clark wrote:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>>     /* Helper for formating the chip_id in the way that userspace tools like
>>>>>      * crashdec expect.
>>>>>      */
>>>>>     #define ADRENO_CHIPID_FMT "u.%u.%u.%u"
>>>>> -#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r).patchid
>>>>> +#define ADRENO_CHIPID_ARGS(_c) \
>>>>> +     (((_c) >> 24) & 0xff), \
>>>>> +     (((_c) >> 16) & 0xff), \
>>>>> +     (((_c) >> 8)  & 0xff), \
>>>>> +     ((_c) & 0xff)
>>>>
>>>> So, we still have some meaning for chipid?
>>>
>>> Only enough to do the inverse of what userspace does when parsing
>>> devcoredump to construct chip-id.  Basically it is just a different
>>> way to represent a 32b #
>>
>> What about passing it in the direct form? The macro adds assumptions.
> 
> It is uabi
> 
> I wouldn't call it adding assumptions as much as just a funny way to
> format a number.  In some cases it might work out to something that
> vaguely resembles a marketing name (6.3.0.2), in other cases it won't
> (12.34.56.78).. it's just formatting a 32b # to match the way existing
> userspace parses it

I see. Sounds fine then.

-- 
With best wishes
Dmitry

