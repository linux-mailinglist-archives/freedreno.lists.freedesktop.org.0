Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569E74F531
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 18:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1473510E3DC;
	Tue, 11 Jul 2023 16:31:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF6310E3DC
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 16:31:25 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fba74870abso8951062e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689093083; x=1691685083;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zKYYp8rVnqq2DLqZW/bklzE/ZMHurz3rrSzMUFEOKHM=;
 b=zFzIfPOJtTc3JedXcpf8f5wS9UMptT+LC3Rv6KrrdCaUkFkC+aWbgJWIvV7e4K/4rm
 fi0wVwyU3bRBNsJ+fJjqLSB/DKGs2tgfxxjucIXjuN+qnPg4YMMn1/dUJ/kK+2JIfkSp
 qvySgPXy0X/Vcv8RAjVmAz8u6hZgFRO3mLxlVyB4BG0Fg5vnZ7PFY92lBx13VhkPrbBN
 qagAI6+itiefX27A2SDas+Cf31AeM+LHVuTvejbci8ciAjyE5OGTQcOQkNkk+1Ij501N
 iOtLS8xzNLfR8mwUAZrRCCsyobcYfUWxZa7juQ+W8rkhKnyS4NyTu89VPtGJFs4beqDc
 EVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689093083; x=1691685083;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zKYYp8rVnqq2DLqZW/bklzE/ZMHurz3rrSzMUFEOKHM=;
 b=a12wAxfiXUqAaDixQZWqOw9r4NLD0VK5V5EFdAoUXhkpevqBusvr5MqU9v5IIfTlhB
 kwI5WQ7TAq7sMrdO6k1R3E9GentcVFCFtSPrAz8i1N3VR9NG37nPNSOzUBiny1eKoSCa
 JG1Gex8YryLbFfNdlIwDEebd6TcN+UWISWu6dtj8qmmBgn11+76kGasyToRwJzteUZbl
 Sc51/SYsPWL8CiOFc0c22NsUaeguk+vR6RPiPnJXEPewGQ3npSZ64iAplENVpU0MwutW
 J2MSeP37t+8o358XZ7Zkr7aaYOryEglhx2J+WYDbgYoPMzgkneoD8kGKp7yTI5vfi2tz
 6BuQ==
X-Gm-Message-State: ABy/qLZnFMfA3oJXk7G0Jic5q44+2lXzyjl49Wz34O3x80BV9Oa4GsbC
 us7xI290q6rlWq3gA5DmRkvjOw==
X-Google-Smtp-Source: APBJJlHRxzjd3W9HsTSu5RyuJ6elWYXh3WoAGvEetwlsHWPL0V89iyKDGu23q05iykeuv9Xrc7aNUA==
X-Received: by 2002:a05:6512:3090:b0:4f8:4512:c844 with SMTP id
 z16-20020a056512309000b004f84512c844mr16215043lfd.48.1689093082805; 
 Tue, 11 Jul 2023 09:31:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a197405000000b004fbc01e17c0sm376987lfe.82.2023.07.11.09.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 09:31:22 -0700 (PDT)
Message-ID: <3b4865d7-2730-1ea9-d75b-a015d27aa84d@linaro.org>
Date: Tue, 11 Jul 2023 19:31:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
 <168908465045.1869384.1893558597710112842.b4-ty@linaro.org>
In-Reply-To: <168908465045.1869384.1893558597710112842.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 0/2] DSIPHY RPM
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/07/2023 17:21, Dmitry Baryshkov wrote:
> 
> On Tue, 20 Jun 2023 13:43:19 +0200, Konrad Dybcio wrote:
>> Some recent SoCs use power rails that we model as GENPDs to power the
>> DSIPHY. This series attempts to make such configurations suspendable.
>>
>> Tested on SM6375.
>>
>>
> 
> Applied, thanks!
> 
> [1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/a402e0e61b75
> [2/2] drm/msm/dsi: Enable runtime PM
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/4e905c2acc9d

Unfortunately this series breaks our CI, see [1], [2]. I had to remove 
these patches for now.

I suppose this is either because of a probe deferral or because of 
having subset of drivers built as module. Konrad, could you please take 
a look?

[1] https://gitlab.freedesktop.org/drm/msm/-/jobs/45271774
[2] https://gitlab.freedesktop.org/drm/msm/-/jobs/45271775

-- 
With best wishes
Dmitry

