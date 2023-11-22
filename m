Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1A7F4BF7
	for <lists+freedreno@lfdr.de>; Wed, 22 Nov 2023 17:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE0C10E678;
	Wed, 22 Nov 2023 16:09:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C062B10E1A0
 for <freedreno@lists.freedesktop.org>; Wed, 22 Nov 2023 16:09:31 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c8880fbb33so35660351fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 Nov 2023 08:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700669370; x=1701274170; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gLCWxiFA7VVYyF6ZRceYWPi2g1OSM3YQHP6IyA6ESAk=;
 b=fMan49hXhBsSt+tMxfW3pOKmu7QXzcrJOm+vgIeCLEXKBNjY7fXKQbz4/CP3OEdhqG
 AGVRuKx3Xw6y86yfwBAELuRCBVscnrTrvYgW+MLBiI/LBPHJhLUU/gXGrz7EPixGFFvR
 zDRMifEGUVv4CpcwBrCXiqB8KMVSvQmaqlDh4TgRelMobKfFDtCJexOG97NZYHlpTei8
 jDDWc0kbAASqSypTjVmEdA0vHCdgxRu9HS7iXnSXkSt65EmWiPrw87wuWIaQgUvWorvX
 euNWOCE72Imzc+7S6RDQzQKuxZvCf2phJPFehXA19A02kmo/fajJxqIKqLne4n5EN9yJ
 jrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700669370; x=1701274170;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gLCWxiFA7VVYyF6ZRceYWPi2g1OSM3YQHP6IyA6ESAk=;
 b=ahEJ9ZKmk15jMG1mPx/TiTwSg2u4a31dPirKcPDPJu9WF/sebY8WEFSNn7TONzX6Pc
 pQKWNdl3M8ki5Wvx/bXCL+gKgvHVuSiE67abSWtjW5O6e6Z6Z5/xLtoIpegHh/AmY4M3
 rfN8SY9KSQPRmY/sxGwAt3y7eEvWXpWN+h7evOE2aq3zMoJIEgG+0xBlvaezO1IaXa6+
 Tj2snILC+DSY6rAk0CkdnA2xXqehoaPFp7wiHvOtc2A+QmWEJuM9VtoiL3RB4IvLtlQF
 Bec1rbKzq/XZzt0KgdV/1b7greUBxZzWSG5dUMikouC76Q4yd2MfYj+eDYZ5rEIIqPzj
 xKEg==
X-Gm-Message-State: AOJu0YzrhrzHBrOrrWeerwKHOEWo0EjaF64w0vQU/JwyT0hJmdWkFpV5
 Sx0WS3QaJrQkkUqp+2Df+DuqDw==
X-Google-Smtp-Source: AGHT+IERsO0nW03FwqjG4/xdsmEc+txIkZDHtnrRfnMv3I/o25pWcNZV6M93k6oa7AovrtcZR5Fl2A==
X-Received: by 2002:a19:5519:0:b0:507:ba28:1bc5 with SMTP id
 n25-20020a195519000000b00507ba281bc5mr2003640lfe.3.1700669369885; 
 Wed, 22 Nov 2023 08:09:29 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 m10-20020a0565120a8a00b004fb9536bc99sm1882136lfu.169.2023.11.22.08.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 08:09:29 -0800 (PST)
Message-ID: <124fd3be-ac01-4c1e-b9d6-63429487cf1e@linaro.org>
Date: Wed, 22 Nov 2023 17:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231121162137.60488-1-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231121162137.60488-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/a690: Fix reg values for a690
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
Cc: Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 11/21/23 17:21, Rob Clark wrote:
> From: Danylo Piliaiev <dpiliaiev@igalia.com>
> 
> KGSL doesn't support a690 so all reg values were the same as
> on a660. Now we know the values and they are different from the
> windows driver.
> 
> This fixes hangs on D3D12 games and some CTS tests.
> 
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Very interesting.. did you document how to get these on windows?

Konrad
