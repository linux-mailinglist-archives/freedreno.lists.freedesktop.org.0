Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FA694C99
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 17:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517D110E61A;
	Mon, 13 Feb 2023 16:25:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2C110E61A
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 16:25:25 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qb15so31174566ejc.1
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eWFr1CwZvMY5/EN0vu8t/Vj+LDxEJAQErVcpCjqVbII=;
 b=oUUfDS770cSTzQ+Zst5e/kfjkax8DHMQvYXxccdwc0dMN3GliHUDJxG6T2ZaP7YTR8
 jdFWlcGRBlGRccBQNkWLmQtXBGZQTefa6O9eOHp1A1HNW6m12xNuQ9ys6UrhlXeBjvsE
 04kcceD/awx0pgM/VzIyOjbK1yEWzustl7WTzzxA8cJIg79gqqQYeTedR2elW6fI0Xvl
 b+ymiN4Y2YnilSNvSXG9Gz5XbThGIuuOjdDMT9+LUN9C52JxNRq8E3qTZQ9cHz3JJzmu
 NWEJvzNE79Skg1l2HQLM0Qt7R8LWbsDiFOtm+l089E/7pr8GPln12yWnSE8d8D+Eh04p
 Kntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eWFr1CwZvMY5/EN0vu8t/Vj+LDxEJAQErVcpCjqVbII=;
 b=72WHNj0lx4dLk+RxLN7/goXJ3s3MNZfC0/u3+RdmiY1nik6f2bNSxNX6DPiSCW9zJT
 qVDuWspuDp3rTqVStmoqqtd6QiwcjhaXGX0vPOKaykT9liXWKsO5ltMk3EvD65xkVQ7E
 Uu6hH7tcuQhgbNAEX4Q7V3tGdML6XPqwyIbHVf5OFdC3Bpo9WP1m5hTJ+ljjyhVCj5ye
 vd/ASv5qNj/UICyaQmAsnYzd78fbDz3iTwQycvka8p2paq9ZflApIn5jgL5TKMBfrEkH
 a2k7uCOPenu2dVpGwfL5oeOMCEj99peIUGFRAXH4W2aV+ISJrbP6a0i8VZdjgWBxZcJP
 edwA==
X-Gm-Message-State: AO0yUKWPvjlLJDmuDh0ahOL9LuuTmHyCULNjQJu+4Z76mfFG3qqoESXL
 AtxcJuTTMlFJ7OYWN/cy+RiENg==
X-Google-Smtp-Source: AK7set/WZntuEziXN2YaI/cS4O20orw4Yw3GpGUOrBGyNYo6PuwOs635uCnb9R3l1O3CyZKM0lIQqQ==
X-Received: by 2002:a17:906:1511:b0:88d:d304:3432 with SMTP id
 b17-20020a170906151100b0088dd3043432mr25472687ejd.60.1676305524040; 
 Mon, 13 Feb 2023 08:25:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 lu19-20020a170906fad300b007a9c3831409sm6915447ejb.137.2023.02.13.08.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:25:23 -0800 (PST)
Message-ID: <56281f37-2c7f-5f70-6c9e-87e950f06b0e@linaro.org>
Date: Mon, 13 Feb 2023 18:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-7-konrad.dybcio@linaro.org>
 <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
 <cc364658-478a-f239-5d17-5ca2b7f7df8b@linaro.org>
 <20230213113008.ih7ii5m3cz4w3lmz@SoMainline.org>
 <8560b69f-8d42-995d-2f4d-11d6a64afef0@linaro.org>
 <20230213142831.hbzfp2chekshsqyy@SoMainline.org>
 <28c9ea04-fedb-16cf-f874-f4c965fbc445@linaro.org>
 <20230213151413.qhpzzcz4c6m6rynk@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213151413.qhpzzcz4c6m6rynk@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 06/10] drm/msm/dpu: Add SM6350 support
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
Cc: Vinod Koul <vkoul@kernel.org>, Liu Shixin <liushixin2@huawei.com>,
 Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 David Airlie <airlied@gmail.com>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/02/2023 17:14, Marijn Suijten wrote:
> On 2023-02-13 16:58:00, Dmitry Baryshkov wrote:
>> So, *possible* the merge order is the following:
>> - fixes from https://patchwork.freedesktop.org/series/113910/ go to
>> msm-fixes
>> - fixes from your intf-te go to msm-fixes
>> - https://patchwork.freedesktop.org/series/111751/
>> - the rest of intf-te and catalog (*see below)
>> - DPU features
>> - new DPU platforms (might go together with DPU features)
>>
>> * That really depends on the availability of the patchsets. Most
>> probably, as your patchset also contains several fixups, it would be
>> easier to land it before catalog split/rework.
>>
>> So, if you have the available timeslot, could you please finish & send
>> intf te on top of msm-next.
> 
> Ack, I'll get to that immediately.  You might even pull in the
> intermediate patches linked above (that touch the catalog) to see how it
> integrates, if I remember correctly (it has been a while) the catalog
> changes should now be independent of driver changes...?

I'll check and if it goes well, I'll just cherry-pick them into my branch.

> 
>>> Sure, I will at least start looking at your 50-patch as part of catching
>>> back up.  Do you want to process that on the mailing list or via
>>> https://gitlab.freedesktop.org/drm/msm/-/merge_requests/44?
>>
>> I'd prefer to use email. The MR was open to doublecheck that nothing got
>> broken on sc7180.
> 
> Ack; will try providing feedback on the 50-patch series via email in
> parallel to getting INTF TE v2 out ASAP.  As discussed before I should
> probably add myself as reviewer to the drm/msm subsystem to have these
> patches in my inbox from the get-go though...

I'd support this.


-- 
With best wishes
Dmitry

